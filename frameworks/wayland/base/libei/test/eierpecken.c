/* SPDX-License-Identifier: MIT */
/*
 * Copyright © 2020 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include "config.h"

#include <math.h>
#include <munit.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/time.h>

#include "util-bits.h"
#include "util-color.h"
#include "util-io.h"
#include "util-logger.h"
#include "util-mem.h"
#include "util-munit.h"
#include "util-object.h"
#include "util-strings.h"
#include "util-time.h"
#include "util-tristate.h"

#include "eierpecken.h"

static bool enable_sigalarm;

DEFINE_TRISTATE(yes, no, unset);

struct peck_log_capture {
	bool enabled;
	char **debug;
	char **info;
	char **warning;
	char **error;
};

struct peck {
	struct object object;
	struct ei *ei;
	int ei_fd;
	struct eis *eis;
	uint32_t eis_behavior;
	uint32_t ei_behavior;
	struct logger *logger;

	/* The default seat/devices */
	struct eis_seat *eis_seat;
	struct eis_device *eis_pointer;
	struct eis_device *eis_keyboard;
	struct eis_device *eis_abs;
	struct eis_device *eis_button;
	struct eis_device *eis_scroll;
	struct eis_device *eis_touch;

	struct ei_seat *ei_seat;
	struct ei_device *ei_pointer;
	struct ei_device *ei_keyboard;
	struct ei_device *ei_abs;
	struct ei_device *ei_button;
	struct ei_device *ei_scroll;
	struct ei_device *ei_touch;

	uint64_t now;

	struct eis_client *eis_client;

	uint32_t indent;

	struct sigaction sigact;

	bool ei_fatal_bugs;
	bool eis_fatal_bugs;

	uint64_t ei_time_offset;
	uint64_t eis_time_offset;

	struct peck_log_capture ei_log_capture;
	struct peck_log_capture eis_log_capture;

	bool ei_needs_frame;
	bool eis_needs_frame;
};

static const uint32_t INDENTATION = 4;
static void
peck_indent(struct peck *peck)
{
	peck->indent += INDENTATION;
}

static void
peck_dedent(struct peck *peck)
{
	assert(peck->indent >= INDENTATION);
	peck->indent -= INDENTATION;
}

static OBJECT_IMPLEMENT_GETTER(peck, indent, uint32_t);

static uint64_t
peck_ei_now_func(struct ei *ei)
{
	static uint64_t offset = 0;
	struct peck *peck = ei_get_user_data(ei);

	if (peck->ei_time_offset != offset) {
		offset = peck->ei_time_offset;
		log_debug(peck, "Time is now offset by %" PRIu64 "us\n", offset);
	}

	uint64_t ts = 0;
	now(&ts);

	return ts + peck->ei_time_offset;
}

static uint64_t
peck_eis_now_func(struct eis *eis)
{
	static uint64_t offset = 0;
	struct peck *peck = eis_get_user_data(eis);

	if (peck->eis_time_offset != offset) {
		offset = peck->eis_time_offset;
		log_debug(peck, "Time is now offset by %" PRIu64 "us\n", offset);
	}

	uint64_t ts = 0;
	now(&ts);

	return ts + peck->ei_time_offset;
}

static void
peck_destroy(struct peck *peck)
{
	log_debug(peck, "destroying peck context\n");

	/* we don't want valgrind to complain about us not handling *all*
	 * events in a test */
	peck_drain_ei(peck);
	peck_drain_eis(peck);

	log_debug(peck, "final event processing done\n");

	eis_client_unref(peck->eis_client);

	eis_device_unref(peck->eis_pointer);
	eis_device_unref(peck->eis_abs);
	eis_device_unref(peck->eis_keyboard);
	eis_device_unref(peck->eis_touch);
	eis_device_unref(peck->eis_button);
	eis_device_unref(peck->eis_scroll);
	eis_seat_unref(peck->eis_seat);

	ei_device_unref(peck->ei_pointer);
	ei_device_unref(peck->ei_abs);
	ei_device_unref(peck->ei_keyboard);
	ei_device_unref(peck->ei_touch);
	ei_device_unref(peck->ei_button);
	ei_device_unref(peck->ei_scroll);
	ei_seat_unref(peck->ei_seat);

	ei_unref(peck->ei);
	eis_unref(peck->eis);
	logger_unref(peck->logger);

	if (enable_sigalarm) {
		struct itimerval timer = { 0 };
		setitimer(ITIMER_REAL, &timer, 0);
		sigaction(SIGALRM, &peck->sigact, NULL);
	}

	strv_free(peck->ei_log_capture.debug);
	strv_free(peck->ei_log_capture.info);
	strv_free(peck->ei_log_capture.warning);
	strv_free(peck->ei_log_capture.error);

	strv_free(peck->eis_log_capture.debug);
	strv_free(peck->eis_log_capture.info);
	strv_free(peck->eis_log_capture.warning);
	strv_free(peck->eis_log_capture.error);
}

void
peck_ei_add_time_offset(struct peck *peck, uint64_t us)
{
	log_debug(peck, "Adding ei time offset of %" PRIu64 "us\n", us);
	peck->ei_time_offset += us;
}

void
peck_eis_add_time_offset(struct peck *peck, uint64_t us)
{
	log_debug(peck, "Adding EIS time offset of %" PRIu64 "us\n", us);
	peck->eis_time_offset += us;
}

static OBJECT_IMPLEMENT_CREATE(peck);
OBJECT_IMPLEMENT_UNREF(peck);
OBJECT_IMPLEMENT_GETTER(peck, ei, struct ei *);
OBJECT_IMPLEMENT_GETTER(peck, eis, struct eis *);
OBJECT_IMPLEMENT_GETTER(peck, ei_fd, int);

void
peck_drop_ei(struct peck *peck)
{
	peck->ei_pointer = ei_device_unref(peck->ei_pointer);
	peck->ei_keyboard = ei_device_unref(peck->ei_keyboard);
	peck->ei_abs = ei_device_unref(peck->ei_abs);
	peck->ei_touch = ei_device_unref(peck->ei_touch);
	peck->ei_seat = ei_seat_unref(peck->ei_seat);
	peck->ei = NULL;
}

char **
peck_ei_get_log_capture(struct peck *peck, enum ei_log_priority priority)
{
	switch (priority) {
	case EI_LOG_PRIORITY_ERROR:
		return peck->ei_log_capture.error;
	case EI_LOG_PRIORITY_WARNING:
		return peck->ei_log_capture.warning;
	case EI_LOG_PRIORITY_INFO:
		return peck->ei_log_capture.info;
	case EI_LOG_PRIORITY_DEBUG:
		return peck->ei_log_capture.debug;
	default:
		abort();
	}
}

void
peck_ei_enable_log_capture(struct peck *peck)
{
	peck->ei_log_capture.enabled = true;
}

void
peck_ei_disable_log_capture(struct peck *peck)
{
	peck->ei_log_capture.enabled = false;
}

char **
peck_eis_get_log_capture(struct peck *peck, enum eis_log_priority priority)
{
	switch (priority) {
	case EIS_LOG_PRIORITY_ERROR:
		return peck->eis_log_capture.error;
	case EIS_LOG_PRIORITY_WARNING:
		return peck->eis_log_capture.warning;
	case EIS_LOG_PRIORITY_INFO:
		return peck->eis_log_capture.info;
	case EIS_LOG_PRIORITY_DEBUG:
		return peck->eis_log_capture.debug;
	default:
		abort();
	}
}

void
peck_eis_enable_log_capture(struct peck *peck)
{
	peck->eis_log_capture.enabled = true;
}

void
peck_eis_disable_log_capture(struct peck *peck)
{
	peck->eis_log_capture.enabled = false;
}

struct eis_client *
peck_eis_get_default_client(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_client);
	return peck->eis_client;
}

struct eis_seat *
peck_eis_get_default_seat(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_seat);
	return peck->eis_seat;
}

struct eis_device *
peck_eis_get_default_pointer(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_pointer);
	return peck->eis_pointer;
}

struct eis_device *
peck_eis_get_default_pointer_absolute(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_abs);
	return peck->eis_abs;
}

struct eis_device *
peck_eis_get_default_button(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_button);
	return peck->eis_button;
}

struct eis_device *
peck_eis_get_default_scroll(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_scroll);
	return peck->eis_scroll;
}

struct eis_device *
peck_eis_get_default_keyboard(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_keyboard);
	return peck->eis_keyboard;
}

struct eis_device *
peck_eis_get_default_touch(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->eis_touch);
	return peck->eis_touch;
}

struct ei_seat *
peck_ei_get_default_seat(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_seat);
	return peck->ei_seat;
}

struct ei_device *
peck_ei_get_default_pointer(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_pointer);
	return peck->ei_pointer;
}

struct ei_device *
peck_ei_get_default_pointer_absolute(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_abs);
	return peck->ei_abs;
}

struct ei_device *
peck_ei_get_default_button(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_button);
	return peck->ei_button;
}

struct ei_device *
peck_ei_get_default_scroll(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_scroll);
	return peck->ei_scroll;
}

struct ei_device *
peck_ei_get_default_keyboard(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_keyboard);
	return peck->ei_keyboard;
}

struct ei_device *
peck_ei_get_default_touch(struct peck *peck)
{
	munit_assert_ptr_not_null(peck->ei_touch);
	return peck->ei_touch;
}

/* Ensures that device frames in tests always have an ascending and fixed
 * interval. Every time this is called it adds 10ms to the time offset.
 */
uint64_t
peck_ei_now(struct peck *peck)
{
	peck_ei_add_time_offset(peck, ms2us(10));
	return ei_now(peck->ei);
}

uint64_t
peck_eis_now(struct peck *peck)
{
	peck_eis_add_time_offset(peck, ms2us(10));
	return eis_now(peck->eis);
}

void
peck_ei_disable_fatal_bug(struct peck *peck)
{
	peck->ei_fatal_bugs = false;
}

void
peck_ei_enable_fatal_bug(struct peck *peck)
{
	peck->ei_fatal_bugs = true;
}

void
peck_eis_disable_fatal_bug(struct peck *peck)
{
	peck->eis_fatal_bugs = false;
}

void
peck_eis_enable_fatal_bug(struct peck *peck)
{
	peck->eis_fatal_bugs = true;
}

static void
peck_capture_log(struct peck_log_capture *capture,
		 enum ei_log_priority priority,
		 const char *message)
{
	if (!capture->enabled)
		return;

	switch (priority) {
	case EI_LOG_PRIORITY_ERROR:
		capture->error = strv_append_strdup(capture->error, message);
		break;
	case EI_LOG_PRIORITY_WARNING:
		capture->warning = strv_append_strdup(capture->warning, message);
		break;
	case EI_LOG_PRIORITY_INFO:
		capture->info = strv_append_strdup(capture->info, message);
		break;
	case EI_LOG_PRIORITY_DEBUG:
		capture->debug = strv_append_strdup(capture->debug, message);
		break;
	default:
		abort();
	}
}

static void
peck_ei_log_handler(struct ei *ei,
		    enum ei_log_priority priority,
		    const char *message,
		    struct ei_log_context *ctx)
{
	bool use_color = true;
	run_only_once
	{
		use_color = isatty(STDERR_FILENO);
	}

	const char *prefix = NULL;
	switch (priority) {
	case EI_LOG_PRIORITY_ERROR:
		prefix = "ERR ";
		break;
	case EI_LOG_PRIORITY_WARNING:
		prefix = "WRN ";
		break;
	case EI_LOG_PRIORITY_INFO:
		prefix = "INF ";
		break;
	case EI_LOG_PRIORITY_DEBUG:
		prefix = "    ";
		break;
	}

	struct peck *peck = ei_get_user_data(ei);
	fprintf(stderr,
		"|      | ei |     | %s |%*s🥚 %s%s%s\n",
		prefix,
		(int)peck_get_indent(peck),
		" ",
		use_color ? ANSI_FG_RGB(150, 125, 100) : "",
		message,
		use_color ? ansi_colorcode[RESET] : "");

	if (peck->ei_fatal_bugs) {
		assert(!strstr(message, "🪳"));
		assert(!strstr(message, "🪲"));
	}

	peck_capture_log(&peck->ei_log_capture, priority, message);
}

static void
peck_eis_log_handler(struct eis *eis,
		     enum eis_log_priority priority,
		     const char *message,
		     struct eis_log_context *ctx)
{
	bool use_color = true;
	run_only_once
	{
		use_color = isatty(STDERR_FILENO);
	}

	const char *prefix = NULL;
	switch (priority) {
	case EIS_LOG_PRIORITY_ERROR:
		prefix = "ERR ";
		break;
	case EIS_LOG_PRIORITY_WARNING:
		prefix = "WRN ";
		break;
	case EIS_LOG_PRIORITY_INFO:
		prefix = "INF ";
		break;
	case EIS_LOG_PRIORITY_DEBUG:
		prefix = "    ";
		break;
	}

	struct peck *peck = eis_get_user_data(eis);
	fprintf(stderr,
		"|      |    | EIS | %s |%*s🍨 %s%s%s\n",
		prefix,
		(int)peck_get_indent(peck),
		" ",
		use_color ? ANSI_FG_RGB(150, 200, 125) : "",
		message,
		use_color ? ansi_colorcode[RESET] : "");

	if (peck->eis_fatal_bugs) {
		assert(!strstr(message, "🪳"));
		assert(!strstr(message, "🪲"));
	}

	peck_capture_log(&peck->eis_log_capture, (enum ei_log_priority)priority, message);
}

_printf_(7, 0) static void
peck_log_handler(struct logger *logger,
		 const char *prefix,
		 enum logger_priority priority,
		 const char *file,
		 int lineno,
		 const char *func,
		 const char *format,
		 va_list args)
{
	_cleanup_free_ char *msgtype;
	bool use_color = true;
	run_only_once
	{
		use_color = isatty(STDERR_FILENO);
	}

	switch (priority) {
	case LOGGER_DEBUG:
		msgtype = xaprintf("%4d", lineno);
		break;
	case LOGGER_INFO:
		msgtype = xstrdup("INF");
		break;
	case LOGGER_WARN:
		msgtype = xstrdup("WRN");
		break;
	case LOGGER_ERROR:
		msgtype = xstrdup("ERR");
		break;
	default:
		msgtype = xstrdup("<invalid msgtype>");
		break;
	}

	struct peck *peck = logger_get_user_data(logger);

	fprintf(stderr,
		"| peck |    |     | %s |%*s%s",
		msgtype,
		(int)peck_get_indent(peck),
		" ",
		use_color ? ANSI_FG_RGB(125, 150, 255) : "");
	vfprintf(stderr, format, args);
	if (use_color)
		fprintf(stderr, "%s", ansi_colorcode[RESET]);
}

static void
handle_sigalrm(int signo)
{
	/* Nothing to do but this may cause a few EINTR */
}

static struct peck *
new_context(const char *what, va_list args)
{
	struct peck *peck = peck_create(NULL);

	enum peck_ei_mode ei_mode = PECK_EI_SENDER;
	uint32_t eis_flags = 0;

	while (what) {
		if (streq(what, "mode"))
			ei_mode = va_arg(args, enum peck_ei_mode);
		if (streq(what, "eis-flags"))
			eis_flags = va_arg(args, uint32_t);
		what = va_arg(args, const char *);
	}

	assert(ei_mode == PECK_EI_RECEIVER || ei_mode == PECK_EI_SENDER);

	int rc, fd;

	struct eis *eis = eis_new(peck);
	if (eis_flags != 0) {
		size_t shift = 0;
		while (eis_flags) {
			if (eis_flags & 0x1)
				eis_set_flag(eis, bit(shift));
			eis_flags >>= 1;
			shift++;
		}
	}

	eis_log_set_handler(eis, peck_eis_log_handler);
	eis_log_set_priority(eis, EIS_LOG_PRIORITY_DEBUG);
	eis_clock_set_now_func(eis, peck_eis_now_func);
	rc = eis_setup_backend_fd(eis);
	munit_assert_int(rc, ==, 0);
	fd = eis_backend_fd_add_client(eis);
	munit_assert_int(fd, >, 0);
	peck->eis = eis;
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_FRAME);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);

	struct ei *ei = ei_mode == PECK_EI_RECEIVER ? ei_new_receiver(peck) : ei_new_sender(peck);
	ei_set_user_data(ei, peck);
	ei_log_set_handler(ei, peck_ei_log_handler);
	ei_log_set_priority(ei, EI_LOG_PRIORITY_DEBUG);
	ei_clock_set_now_func(ei, peck_ei_now_func);
	ei_configure_name(ei, "eierpecken test context");
	rc = ei_setup_backend_fd(ei, fd);
	munit_assert_int(rc, ==, 0);
	peck->ei = ei;
	peck->ei_fd = fd;
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_FRAME);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	peck_ei_enable_fatal_bug(peck);
	peck_eis_enable_fatal_bug(peck);

	peck->logger = logger_new("peck", peck);
	logger_set_handler(peck->logger, peck_log_handler);
	logger_set_priority(peck->logger, LOGGER_DEBUG);

	if (enable_sigalarm) {
		/* We set up SIGALRM to hammer us because libei is used by Xwayland which
		 * uses that for scheduling and we need to be able to handle that */
		struct sigaction act;
		sigaddset(&act.sa_mask, SIGALRM);
		act.sa_flags = 0;
		act.sa_handler = handle_sigalrm;
		rc = xerrno(sigaction(SIGALRM, &act, &peck->sigact));
		if (rc >= 0) {
			struct itimerval timer = {
				.it_interval = {
					.tv_sec = 0,
					.tv_usec = 50,
				},
				.it_value = {
					.tv_sec = 0,
					.tv_usec = 50,
				}
			};
			rc = xerrno(setitimer(ITIMER_REAL, &timer, 0));
			if (rc < 0) {
				log_error(peck, "Failed to enable timer: %s\n", strerror(-rc));
				munit_assert_int(rc, >=, 0);
			}
		} else {
			log_error(peck, "Failed to enable SIGALRM: %s\n", strerror(-rc));
			munit_assert_int(rc, >=, 0);
		}
	}

	return peck;
}

struct peck *
_peck_new_context(const char *what, ...)
{
	va_list args;

	va_start(args, what);
	struct peck *peck = new_context(what, args);
	va_end(args);

	return peck;
}

void
peck_enable_eis_behavior(struct peck *peck, enum peck_eis_behavior behavior)
{
	switch (behavior) {
	case PECK_EIS_BEHAVIOR_NONE:
		peck->eis_behavior = 0;
		break;
	case PECK_EIS_BEHAVIOR_DEFAULT_SEAT:
	case PECK_EIS_BEHAVIOR_NO_DEFAULT_SEAT:
		flag_set(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_ACCEPT_ALL:
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_DEVICE_READY);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING);
		break;
	case PECK_EIS_BEHAVIOR_ADD_DEVICES:
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
		break;
	case PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT:
	case PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE:
	case PECK_EIS_BEHAVIOR_HANDLE_FRAME:
	case PECK_EIS_BEHAVIOR_HANDLE_SYNC:
	case PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING:
	case PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING:
	case PECK_EIS_BEHAVIOR_ADD_POINTER:
	case PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE:
	case PECK_EIS_BEHAVIOR_ADD_KEYBOARD:
	case PECK_EIS_BEHAVIOR_ADD_TOUCH:
	case PECK_EIS_BEHAVIOR_HANDLE_DEVICE_READY:
		flag_set(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_REJECT_CLIENT:
		flag_clear(peck->eis_behavior, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
		flag_set(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_ACCEPT_CLIENT:
		flag_clear(peck->eis_behavior, PECK_EIS_BEHAVIOR_REJECT_CLIENT);
		flag_set(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_RESUME_DEVICE:
		flag_clear(peck->eis_behavior, PECK_EIS_BEHAVIOR_SUSPEND_DEVICE);
		flag_set(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_SUSPEND_DEVICE:
		flag_clear(peck->eis_behavior, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
		flag_set(peck->eis_behavior, behavior);
		break;
	}
}

void
peck_disable_eis_behavior(struct peck *peck, enum peck_eis_behavior behavior)
{
	switch (behavior) {
	case PECK_EIS_BEHAVIOR_NONE:
		peck->eis_behavior = 0;
		break;
	case PECK_EIS_BEHAVIOR_DEFAULT_SEAT:
	case PECK_EIS_BEHAVIOR_NO_DEFAULT_SEAT:
		flag_clear(peck->eis_behavior, behavior);
		break;
	case PECK_EIS_BEHAVIOR_ACCEPT_ALL:
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING);
		break;
	case PECK_EIS_BEHAVIOR_ADD_DEVICES:
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
		peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
		break;
	case PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT:
	case PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE:
	case PECK_EIS_BEHAVIOR_HANDLE_FRAME:
	case PECK_EIS_BEHAVIOR_HANDLE_SYNC:
	case PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING:
	case PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING:
	case PECK_EIS_BEHAVIOR_ADD_POINTER:
	case PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE:
	case PECK_EIS_BEHAVIOR_ADD_KEYBOARD:
	case PECK_EIS_BEHAVIOR_ADD_TOUCH:
	case PECK_EIS_BEHAVIOR_HANDLE_DEVICE_READY:
	case PECK_EIS_BEHAVIOR_REJECT_CLIENT:
	case PECK_EIS_BEHAVIOR_ACCEPT_CLIENT:
	case PECK_EIS_BEHAVIOR_RESUME_DEVICE:
	case PECK_EIS_BEHAVIOR_SUSPEND_DEVICE:
		flag_clear(peck->eis_behavior, behavior);
		break;
	}
}

void
peck_enable_ei_behavior(struct peck *peck, enum peck_ei_behavior behavior)
{
	switch (behavior) {
	case PECK_EI_BEHAVIOR_NONE:
		peck->ei_behavior = 0;
		break;
	case PECK_EI_BEHAVIOR_HANDLE_CONNECT:
	case PECK_EI_BEHAVIOR_AUTOSEAT:
		flag_set(peck->ei_behavior, behavior);
		break;
	case PECK_EI_BEHAVIOR_AUTODEVICES:
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSEAT);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);
		break;
	case PECK_EI_BEHAVIOR_HANDLE_ADDED:
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON);
		peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL);
		break;
	case PECK_EI_BEHAVIOR_AUTOSTART:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL:
	case PECK_EI_BEHAVIOR_HANDLE_FRAME:
	case PECK_EI_BEHAVIOR_HANDLE_SYNC:
	case PECK_EI_BEHAVIOR_HANDLE_RESUMED:
	case PECK_EI_BEHAVIOR_HANDLE_PAUSED:
		flag_set(peck->ei_behavior, behavior);
		break;
	}
}

void
peck_disable_ei_behavior(struct peck *peck, enum peck_ei_behavior behavior)
{
	switch (behavior) {
	case PECK_EI_BEHAVIOR_NONE:
		abort();
		break;
	case PECK_EI_BEHAVIOR_HANDLE_CONNECT:
	case PECK_EI_BEHAVIOR_AUTOSEAT:
		flag_clear(peck->ei_behavior, behavior);
		break;
	case PECK_EI_BEHAVIOR_AUTODEVICES:
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSEAT);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);
		break;
	case PECK_EI_BEHAVIOR_HANDLE_ADDED:
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON);
		peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL);
		break;
	case PECK_EI_BEHAVIOR_AUTOSTART:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON:
	case PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL:
	case PECK_EI_BEHAVIOR_HANDLE_FRAME:
	case PECK_EI_BEHAVIOR_HANDLE_SYNC:
	case PECK_EI_BEHAVIOR_HANDLE_RESUMED:
	case PECK_EI_BEHAVIOR_HANDLE_PAUSED:
		flag_clear(peck->ei_behavior, behavior);
		break;
	}
}

static inline void
peck_create_eis_seat(struct peck *peck, struct eis_client *client)
{
	_unref_(eis_seat) *seat = eis_client_new_seat(client, "peck default seat");

	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_POINTER);
	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_POINTER_ABSOLUTE);
	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_KEYBOARD);
	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_TOUCH);
	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_BUTTON);
	eis_seat_configure_capability(seat, EIS_DEVICE_CAP_SCROLL);

	log_debug(peck, "EIS adding seat: '%s'\n", eis_seat_get_name(seat));
	eis_seat_add(seat);

	peck->eis_seat = eis_seat_ref(seat);
}

static inline void
peck_handle_eis_connect(struct peck *peck, struct eis_event *e)
{
	struct eis_client *client = eis_event_get_client(e);

	if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT)) {
		log_debug(peck, "EIS accepting client: '%s'\n", eis_client_get_name(client));
		peck->eis_client = eis_client_ref(client);
		eis_client_connect(client);
		if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_DEFAULT_SEAT))
			peck_create_eis_seat(peck, client);
	} else {
		log_debug(peck, "EIS disconnecting client: '%s'\n", eis_client_get_name(client));
		eis_client_disconnect(client);
	}
}

static inline struct eis_device *
peck_eis_create_pointer(struct peck *peck, struct eis_seat *seat, const char *name)
{
	struct eis_device *device = eis_seat_new_device(seat);

	eis_device_configure_name(device, name);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_BUTTON);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_SCROLL);
	eis_device_add(device);

	return device;
}

static inline struct eis_device *
peck_eis_create_pointer_absolute(struct peck *peck, struct eis_seat *seat, const char *name)
{
	struct eis_device *device = eis_seat_new_device(seat);
	_unref_(eis_region) *region = eis_device_new_region(device);

	eis_region_set_offset(region, 0, 0);
	eis_region_set_size(region, 1920, 1080);

	eis_device_configure_name(device, name);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_BUTTON);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_SCROLL);
	eis_region_add(region);
	eis_device_add(device);

	return device;
}

static inline struct eis_device *
peck_eis_create_keyboard(struct peck *peck, struct eis_seat *seat, const char *name)
{
	struct eis_device *device = eis_seat_new_device(seat);

	eis_device_configure_name(device, name);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_KEYBOARD);
	eis_device_add(device);

	return device;
}

static inline struct eis_device *
peck_eis_create_touch(struct peck *peck, struct eis_seat *seat, const char *name)
{
	struct eis_device *device = eis_seat_new_device(seat);
	_unref_(eis_region) *region = eis_device_new_region(device);

	eis_region_set_offset(region, 0, 0);
	eis_region_set_size(region, 1920, 1080);

	eis_device_configure_name(device, name);
	eis_device_configure_capability(device, EIS_DEVICE_CAP_TOUCH);
	eis_region_add(region);
	eis_device_add(device);

	return device;
}

static inline void
peck_handle_eis_seat_bind(struct peck *peck, struct eis_event *e)
{
	struct eis_seat *seat = eis_event_get_seat(e);

	log_debug(peck, "EIS binding seat: '%s'\n", eis_seat_get_name(seat));

	if (eis_event_seat_has_capability(e, EIS_DEVICE_CAP_POINTER)) {
		if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ADD_POINTER) &&
		    !peck->eis_pointer) {
			log_debug(peck, "EIS creating default pointer\n");
			_unref_(eis_device) *ptr =
				peck_eis_create_pointer(peck, seat, "default pointer");

			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_RESUME_DEVICE))
				eis_device_resume(ptr);

			peck->eis_pointer = eis_device_ref(ptr);
		}
	} else {
		if (peck->eis_pointer) {
			log_debug(peck, "EIS removing default pointer\n");

			_unref_(eis_device) *ptr = steal(&peck->eis_pointer);
			eis_device_remove(ptr);
		}
	}

	if (eis_event_seat_has_capability(e, EIS_DEVICE_CAP_POINTER_ABSOLUTE)) {
		if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE) &&
		    !peck->eis_abs) {
			log_debug(peck, "EIS creating default abs pointer\n");
			_unref_(eis_device) *abs =
				peck_eis_create_pointer_absolute(peck, seat, "default abs");

			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_RESUME_DEVICE))
				eis_device_resume(abs);

			peck->eis_abs = eis_device_ref(abs);
		}
	} else {
		if (peck->eis_abs) {
			log_debug(peck, "EIS removing default abs\n");

			_unref_(eis_device) *abs = steal(&peck->eis_abs);
			eis_device_remove(abs);
		}
	}

	if (eis_event_seat_has_capability(e, EIS_DEVICE_CAP_KEYBOARD)) {
		if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ADD_KEYBOARD) &&
		    !peck->eis_keyboard) {
			log_debug(peck, "EIS creating default keyboard\n");
			_unref_(eis_device) *kbd =
				peck_eis_create_keyboard(peck, seat, "default keyboard");

			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_RESUME_DEVICE))
				eis_device_resume(kbd);

			peck->eis_keyboard = eis_device_ref(kbd);
		}
	} else {
		if (peck->eis_keyboard) {
			log_debug(peck, "EIS removing default keyboard\n");

			_unref_(eis_device) *kbd = steal(&peck->eis_keyboard);
			eis_device_remove(kbd);
		}
	}

	if (eis_event_seat_has_capability(e, EIS_DEVICE_CAP_TOUCH)) {
		if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ADD_TOUCH) &&
		    !peck->eis_touch) {
			log_debug(peck, "EIS creating default touch\n");
			_unref_(eis_device) *touch =
				peck_eis_create_touch(peck, seat, "default touch");

			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_RESUME_DEVICE))
				eis_device_resume(touch);

			peck->eis_touch = eis_device_ref(touch);
		}
	} else {
		if (peck->eis_touch) {
			log_debug(peck, "EIS removing default touch\n");

			_unref_(eis_device) *touch = steal(&peck->eis_touch);
			eis_device_remove(touch);
		}
	}

	/* Removing all caps means removing the seat */
	if (!eis_event_seat_has_capability(e, EIS_DEVICE_CAP_POINTER) &&
	    !eis_event_seat_has_capability(e, EIS_DEVICE_CAP_POINTER_ABSOLUTE) &&
	    !eis_event_seat_has_capability(e, EIS_DEVICE_CAP_KEYBOARD) &&
	    !eis_event_seat_has_capability(e, EIS_DEVICE_CAP_BUTTON) &&
	    !eis_event_seat_has_capability(e, EIS_DEVICE_CAP_SCROLL) &&
	    !eis_event_seat_has_capability(e, EIS_DEVICE_CAP_TOUCH))
		eis_seat_remove(seat);
}

static inline void
peck_eis_device_remove(struct peck *peck, struct eis_device *device)
{
	eis_device_remove(device);
	if (device == peck->eis_pointer)
		peck->eis_pointer = eis_device_unref(device);
	if (device == peck->eis_abs)
		peck->eis_abs = eis_device_unref(device);
	if (device == peck->eis_keyboard)
		peck->eis_keyboard = eis_device_unref(device);
	if (device == peck->eis_touch)
		peck->eis_touch = eis_device_unref(device);
	if (device == peck->eis_button)
		peck->eis_button = eis_device_unref(device);
	if (device == peck->eis_scroll)
		peck->eis_scroll = eis_device_unref(device);
}

bool
_peck_dispatch_eis(struct peck *peck, int lineno)
{
	struct eis *eis = peck->eis;
	bool had_event = false;
	static uint64_t last_timestamp;

	log_debug(peck, "EIS Dispatch, line %d\n", lineno);
	peck_indent(peck);

	while (eis) {
		eis_dispatch(eis);
		tristate process_event = tristate_unset;

		_unref_(eis_event) *e = eis_peek_event(eis);
		if (!e)
			break;

		switch (eis_event_get_type(e)) {
		case EIS_EVENT_CLIENT_CONNECT:
		case EIS_EVENT_CLIENT_DISCONNECT:
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT) ||
			    flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_REJECT_CLIENT))
				process_event = tristate_yes;
			break;
		case EIS_EVENT_SEAT_BIND:
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT))
				process_event = tristate_yes;
			else
				process_event = tristate_no;
			break;
		case EIS_EVENT_SEAT_DEVICE_REQUESTED:
			break;
		case EIS_EVENT_DEVICE_CLOSED:
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE))
				process_event = tristate_yes;
			else
				process_event = tristate_no;
			break;
		case EIS_EVENT_DEVICE_READY:
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_DEVICE_READY))
				process_event = tristate_yes;
			else
				process_event = tristate_no;
			break;
		case EIS_EVENT_PONG:
			break;
		case EIS_EVENT_SYNC:
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_SYNC))
				process_event = tristate_yes;
			break;
		case EIS_EVENT_FRAME:
			/* Ensure we only expect frames when we expect them */
			munit_assert_true(peck->eis_needs_frame);
			peck->eis_needs_frame = false;
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_FRAME))
				process_event = tristate_yes;
			break;
		case EIS_EVENT_DEVICE_START_EMULATING:
			if (flag_is_set(peck->eis_behavior,
					PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING))
				process_event = tristate_yes;
			break;
		case EIS_EVENT_DEVICE_STOP_EMULATING:
			if (flag_is_set(peck->eis_behavior,
					PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING))
				process_event = tristate_yes;
			break;
		case EIS_EVENT_POINTER_MOTION:
		case EIS_EVENT_POINTER_MOTION_ABSOLUTE:
		case EIS_EVENT_BUTTON_BUTTON:
		case EIS_EVENT_SCROLL_DELTA:
		case EIS_EVENT_SCROLL_STOP:
		case EIS_EVENT_SCROLL_CANCEL:
		case EIS_EVENT_SCROLL_DISCRETE:
		case EIS_EVENT_KEYBOARD_KEY:
		case EIS_EVENT_TOUCH_DOWN:
		case EIS_EVENT_TOUCH_UP:
		case EIS_EVENT_TOUCH_MOTION:
		case EIS_EVENT_TEXT_KEYSYM:
		case EIS_EVENT_TEXT_UTF8:
			peck->eis_needs_frame = true;
			break;
		}

		log_debug(peck,
			  "EIS received %s.... %s\n",
			  peck_eis_event_name(e),
			  tristate_is_yes(process_event) ? "handling ourselves"
							 : "punting to caller");

		if (!tristate_is_yes(process_event))
			break;

		had_event = true;

		/* manual unref, _cleanup_ will take care of the real event */
		eis_event_unref(e);
		e = eis_get_event(eis);

		switch (eis_event_get_type(e)) {
		case EIS_EVENT_CLIENT_CONNECT:
			peck_handle_eis_connect(peck, e);
			break;
		case EIS_EVENT_CLIENT_DISCONNECT:
			log_debug(peck,
				  "EIS disconnecting client: %s\n",
				  eis_client_get_name(eis_event_get_client(e)));
			eis_client_disconnect(eis_event_get_client(e));
			break;
		case EIS_EVENT_SEAT_BIND:
			peck_handle_eis_seat_bind(peck, e);
			break;
		case EIS_EVENT_DEVICE_CLOSED:
			peck_eis_device_remove(peck, eis_event_get_device(e));
			break;
		case EIS_EVENT_FRAME: {
			uint64_t timestamp = eis_event_get_time(e);
			uint64_t ts_now = 0;

			munit_assert_int(now(&ts_now), ==, 0);
			munit_assert_int64(last_timestamp, <, timestamp);
			munit_assert_int64(last_timestamp, <=, ts_now);
			last_timestamp = timestamp;
			break;
		}
		default:
			break;
		}
	}

	peck_dedent(peck);

	return had_event;
}

static inline tristate
peck_check_ei_added(struct peck *peck, struct ei_event *e)
{
	struct ei_device *device = ei_event_get_device(e);

	if (ei_device_has_capability(device, EI_DEVICE_CAP_POINTER) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER))
		return tristate_yes;

	if (ei_device_has_capability(device, EI_DEVICE_CAP_POINTER_ABSOLUTE) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE))
		return tristate_yes;

	if (ei_device_has_capability(device, EI_DEVICE_CAP_KEYBOARD) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD))
		return tristate_yes;

	if (ei_device_has_capability(device, EI_DEVICE_CAP_TOUCH) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH))
		return tristate_yes;

	if (ei_device_has_capability(device, EI_DEVICE_CAP_BUTTON) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON))
		return tristate_yes;

	if (ei_device_has_capability(device, EI_DEVICE_CAP_SCROLL) &&
	    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL))
		return tristate_yes;

	return tristate_unset;
}

bool
_peck_dispatch_ei(struct peck *peck, int lineno)
{
	struct ei *ei = peck->ei;
	bool had_event = false;

	log_debug(peck, "ei dispatch, line %d\n", lineno);
	peck_indent(peck);

	while (ei) {
		ei_dispatch(ei);
		tristate process_event = tristate_no;

		_unref_(ei_event) *e = ei_peek_event(ei);
		if (!e)
			break;

		switch (ei_event_get_type(e)) {
		case EI_EVENT_CONNECT:
			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_CONNECT))
				process_event = tristate_yes;
			break;
		case EI_EVENT_DISCONNECT:
			break;
		case EI_EVENT_SEAT_ADDED:
			if (peck->ei_seat == NULL &&
			    flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_AUTOSEAT))
				process_event = tristate_yes;
			break;
		case EI_EVENT_SEAT_REMOVED:
			break;
		case EI_EVENT_DEVICE_ADDED:
			process_event = peck_check_ei_added(peck, e);
			break;
		case EI_EVENT_DEVICE_REMOVED:
			break;
		case EI_EVENT_DEVICE_RESUMED:
			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_RESUMED))
				process_event = tristate_yes;
			break;
		case EI_EVENT_DEVICE_PAUSED:
			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_PAUSED))
				process_event = tristate_yes;
			break;
		case EI_EVENT_PONG:
			break;
		case EI_EVENT_SYNC:
			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_SYNC))
				process_event = tristate_yes;
			break;
		case EI_EVENT_FRAME:
			/* Ensure we only expect frames when we expect them */
			munit_assert_true(peck->ei_needs_frame);
			peck->ei_needs_frame = false;

			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_FRAME))
				process_event = tristate_yes;
			break;
		case EI_EVENT_DEVICE_START_EMULATING:
		case EI_EVENT_DEVICE_STOP_EMULATING:
			break;
		case EI_EVENT_POINTER_MOTION:
		case EI_EVENT_POINTER_MOTION_ABSOLUTE:
		case EI_EVENT_BUTTON_BUTTON:
		case EI_EVENT_SCROLL_DELTA:
		case EI_EVENT_SCROLL_STOP:
		case EI_EVENT_SCROLL_CANCEL:
		case EI_EVENT_SCROLL_DISCRETE:
		case EI_EVENT_KEYBOARD_KEY:
		case EI_EVENT_KEYBOARD_MODIFIERS:
		case EI_EVENT_TOUCH_DOWN:
		case EI_EVENT_TOUCH_UP:
		case EI_EVENT_TOUCH_MOTION:
		case EI_EVENT_TEXT_KEYSYM:
		case EI_EVENT_TEXT_UTF8:
			peck->ei_needs_frame = true;
			break;
		}

		log_debug(peck,
			  "ei event %s.... %s\n",
			  peck_ei_event_name(e),
			  tristate_is_yes(process_event) ? "handling ourselves"
							 : "punting to caller");

		if (!tristate_is_yes(process_event))
			break;

		had_event = true;

		/* manual unref, _cleanup_ will take care of the real event */
		ei_event_unref(e);
		e = ei_get_event(ei);

		switch (ei_event_get_type(e)) {
		case EI_EVENT_CONNECT:
			log_debug(peck, "ei is connected\n");
			/* Nothing to do here */
			break;
		case EI_EVENT_SEAT_ADDED: {
			struct ei_seat *seat = ei_event_get_seat(e);
			munit_assert_ptr_null(peck->ei_seat);
			peck->ei_seat = ei_seat_ref(seat);
			log_debug(peck, "default seat: %s\n", ei_seat_get_name(peck->ei_seat));
			ei_seat_bind_capabilities(seat,
						  EI_DEVICE_CAP_POINTER,
						  EI_DEVICE_CAP_POINTER_ABSOLUTE,
						  EI_DEVICE_CAP_KEYBOARD,
						  EI_DEVICE_CAP_TOUCH,
						  EI_DEVICE_CAP_BUTTON,
						  EI_DEVICE_CAP_SCROLL,
						  NULL);
			break;
		}
		case EI_EVENT_DEVICE_ADDED: {
			struct ei_device *device = ei_event_get_device(e);
			if (!peck->ei_pointer &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_POINTER))
				peck->ei_pointer = ei_device_ref(device);
			if (!peck->ei_abs &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_POINTER_ABSOLUTE))
				peck->ei_abs = ei_device_ref(device);
			if (!peck->ei_keyboard &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_KEYBOARD))
				peck->ei_keyboard = ei_device_ref(device);
			if (!peck->ei_touch &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_TOUCH))
				peck->ei_touch = ei_device_ref(device);
			if (!peck->ei_button &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_BUTTON))
				peck->ei_button = ei_device_ref(device);
			if (!peck->ei_scroll &&
			    ei_device_has_capability(device, EI_DEVICE_CAP_SCROLL))
				peck->ei_scroll = ei_device_ref(device);
			break;
		}
		case EI_EVENT_DEVICE_RESUMED:
			if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_AUTOSTART)) {
				static uint32_t sequence;
				struct ei_device *device = ei_event_get_device(e);
				if (ei_is_sender(ei_device_get_context(device)))
					ei_device_start_emulating(device, ++sequence);
			}
			break;
		case EI_EVENT_DEVICE_PAUSED:
			/* Nothing to do here */
			break;
		default:
			break;
		}
	}

	peck_dedent(peck);
	return had_event;
}

void
_peck_dispatch_until_stable(struct peck *peck, const char *func, int lineno)
{
	int eis = 0, ei = 0;
	int loop_counter = 0;

	log_debug(peck, "dispatching until stable (%s:%d) {\n", func, lineno);
	peck_indent(peck);

	/* we go two dispatch loops for both ei and EIS before we say it's
	 * stable. With the DEVICE_REGION/KEYMAP/DONE event split we may
	 * get events on the wire that don't result in an actual event
	 * yet, so we can get stuck if we just wait for one.
	 */
	do {
		log_debug(peck, "entering dispatch loop %d {\n", loop_counter++);
		peck_indent(peck);
		eis = _peck_dispatch_eis(peck, lineno) ? 0 : eis + 1;
		ei = _peck_dispatch_ei(peck, lineno) ? 0 : ei + 1;
		peck_dedent(peck);
		log_debug(peck, "} done: ei %d|eis %d\n", ei, eis);
	} while (ei <= 2 || eis <= 2);

	peck_dedent(peck);
	log_debug(peck, "} stable (%s:%d)\n", func, lineno);
}

void
peck_drain_eis(struct peck *peck)
{
	struct eis *eis = peck->eis;

	if (!eis)
		return;

	eis_dispatch(eis);

	while (true) {
		_unref_(eis_event) *e = eis_get_event(eis);
		if (e == NULL)
			break;
	}

	peck->eis_needs_frame = false;
}

void
peck_drain_ei(struct peck *peck)
{
	struct ei *ei = peck->ei;

	if (!ei)
		return;

	ei_dispatch(ei);
	while (true) {
		_unref_(ei_event) *e = ei_get_event(ei);
		if (e == NULL)
			break;
	}

	peck->ei_needs_frame = false;
}

void
_peck_assert_no_ei_events(struct ei *ei, int lineno)
{
	struct peck *peck = ei_get_user_data(ei);

	ei_dispatch(ei);
	while (true) {
		_unref_(ei_event) *e = ei_get_event(ei);
		if (!e)
			return;

		if (peck && flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_FRAME) &&
		    ei_event_get_type(e) == EI_EVENT_FRAME) {
			log_debug(peck, "Skipping over frame event\n");
			continue;
		}

		if (peck && flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_SYNC) &&
		    ei_event_get_type(e) == EI_EVENT_SYNC) {
			log_debug(peck, "Skipping over sync event\n");
			continue;
		}

		munit_errorf("Expected empty event queue, have: %s, line %d\n",
			     peck_ei_event_name(e),
			     lineno);
	}
}

void
_peck_assert_no_eis_events(struct eis *eis, int lineno)
{
	struct peck *peck = eis_get_user_data(eis);

	eis_dispatch(eis);
	while (true) {
		_unref_(eis_event) *e = eis_get_event(eis);
		if (!e)
			return;

		if (peck) {
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_FRAME) &&
			    eis_event_get_type(e) == EIS_EVENT_FRAME) {
				log_debug(peck, "Skipping over frame event\n");
				continue;
			}
			if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_SYNC) &&
			    eis_event_get_type(e) == EIS_EVENT_SYNC) {
				log_debug(peck, "Skipping over sync event\n");
				continue;
			}
		}

		munit_errorf("Expected empty event queue, have: %s, line %d\n",
			     peck_eis_event_name(e),
			     lineno);
	}
}

struct ei_event *
_peck_ei_next_event(struct ei *ei, enum ei_event_type type, int lineno)
{
	struct ei_event *event = ei_get_event(ei);
	struct peck *peck = ei_get_user_data(ei);

	if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_FRAME)) {
		while (event && ei_event_get_type(event) == EI_EVENT_FRAME) {
			ei_event_unref(event);
			log_debug(peck, "Skipping over frame event\n");
			event = ei_get_event(ei);
		}
	}

	if (flag_is_set(peck->ei_behavior, PECK_EI_BEHAVIOR_HANDLE_SYNC)) {
		while (event && ei_event_get_type(event) == EI_EVENT_SYNC) {
			ei_event_unref(event);
			log_debug(peck, "Skipping over sync event\n");
			event = ei_get_event(ei);
		}
	}

	if (!event)
		munit_errorf("Expected ei event type %s, got none, line %d\n",
			     peck_ei_event_type_name(type),
			     lineno);
	if (!streq(peck_ei_event_name(event), peck_ei_event_type_name(type)))
		munit_errorf("Expected ei event type %s, got %s, line %d\n",
			     peck_ei_event_type_name(type),
			     peck_ei_event_name(event),
			     lineno);

	log_debug(peck, "ei passing %s to caller, line %d\n", peck_ei_event_name(event), lineno);

	return event;
}

struct eis_event *
_peck_eis_next_event(struct eis *eis, enum eis_event_type type, int lineno)
{
	struct eis_event *event = eis_get_event(eis);
	struct peck *peck = eis_get_user_data(eis);

	if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_FRAME)) {
		while (event && eis_event_get_type(event) == EIS_EVENT_FRAME) {
			eis_event_unref(event);
			log_debug(peck, "Skipping over frame event\n");
			event = eis_get_event(eis);
		}
	}

	if (flag_is_set(peck->eis_behavior, PECK_EIS_BEHAVIOR_HANDLE_SYNC)) {
		while (event && eis_event_get_type(event) == EIS_EVENT_SYNC) {
			eis_event_unref(event);
			log_debug(peck, "Skipping over sync event\n");
			event = eis_get_event(eis);
		}
	}

	if (!event)
		munit_errorf("Expected EIS event type %s, got none, line %d\n",
			     peck_eis_event_type_name(type),
			     lineno);
	if (eis_event_get_type(event) != type) {
		munit_errorf("Expected EIS event type %s, got %s, line %d\n",
			     peck_eis_event_type_name(type),
			     peck_eis_event_type_name(eis_event_get_type(event)),
			     lineno);
	}

	log_debug(peck, "EIS passing %s to caller, line %d\n", peck_eis_event_name(event), lineno);

	return event;
}

struct eis_event *
_peck_eis_touch_event(struct eis *eis, enum eis_event_type type, double x, double y, int lineno)
{
	assert(type == EIS_EVENT_TOUCH_DOWN || type == EIS_EVENT_TOUCH_MOTION);

	struct eis_event *event = _peck_eis_next_event(eis, type, lineno);
	double ex = eis_event_touch_get_x(event);
	double ey = eis_event_touch_get_y(event);

	if (fabs(ex - x) > 1e-3 || fabs(ey - y) > 1e-3) {
		munit_errorf("Touch coordinate mismatch: have (%.2f/%.2f) need (%.2f/%.2f)\n",
			     ex,
			     ey,
			     x,
			     y);
	}

	return event;
}

struct ei_event *
_peck_ei_touch_event(struct ei *ei, enum ei_event_type type, double x, double y, int lineno)
{
	assert(type == EI_EVENT_TOUCH_DOWN || type == EI_EVENT_TOUCH_MOTION);

	struct ei_event *event = _peck_ei_next_event(ei, type, lineno);
	double ex = ei_event_touch_get_x(event);
	double ey = ei_event_touch_get_y(event);

	if (fabs(ex - x) > 1e-3 || fabs(ey - y) > 1e-3) {
		munit_errorf("Touch coordinate mismatch: have (%.2f/%.2f) need (%.2f/%.2f)\n",
			     ex,
			     ey,
			     x,
			     y);
	}

	return event;
}

const char *
peck_ei_event_name(struct ei_event *e)
{
	return peck_ei_event_type_name(ei_event_get_type(e));
}

const char *
peck_ei_event_type_name(enum ei_event_type type)
{
#define CASE_STRING(_name) \
	case EI_EVENT_##_name: return #_name

	switch (type) {
		CASE_STRING(CONNECT);
		CASE_STRING(DISCONNECT);
		CASE_STRING(SEAT_ADDED);
		CASE_STRING(SEAT_REMOVED);
		CASE_STRING(DEVICE_ADDED);
		CASE_STRING(DEVICE_REMOVED);
		CASE_STRING(DEVICE_PAUSED);
		CASE_STRING(DEVICE_RESUMED);
		CASE_STRING(KEYBOARD_MODIFIERS);
		CASE_STRING(PONG);
		CASE_STRING(SYNC);
		CASE_STRING(FRAME);
		CASE_STRING(DEVICE_START_EMULATING);
		CASE_STRING(DEVICE_STOP_EMULATING);
		CASE_STRING(POINTER_MOTION);
		CASE_STRING(POINTER_MOTION_ABSOLUTE);
		CASE_STRING(BUTTON_BUTTON);
		CASE_STRING(SCROLL_DELTA);
		CASE_STRING(SCROLL_STOP);
		CASE_STRING(SCROLL_CANCEL);
		CASE_STRING(SCROLL_DISCRETE);
		CASE_STRING(KEYBOARD_KEY);
		CASE_STRING(TOUCH_DOWN);
		CASE_STRING(TOUCH_UP);
		CASE_STRING(TOUCH_MOTION);
		CASE_STRING(TEXT_KEYSYM);
		CASE_STRING(TEXT_UTF8);
	}
#undef CASE_STRING
	assert(!"Unhandled ei event type");
}

const char *
peck_eis_event_name(struct eis_event *e)
{
	return peck_eis_event_type_name(eis_event_get_type(e));
}

const char *
peck_eis_event_type_name(enum eis_event_type type)
{
#define CASE_STRING(_name) \
	case EIS_EVENT_##_name: return #_name

	switch (type) {
		CASE_STRING(CLIENT_CONNECT);
		CASE_STRING(CLIENT_DISCONNECT);
		CASE_STRING(SEAT_BIND);
		CASE_STRING(SEAT_DEVICE_REQUESTED);
		CASE_STRING(DEVICE_CLOSED);
		CASE_STRING(PONG);
		CASE_STRING(SYNC);
		CASE_STRING(DEVICE_START_EMULATING);
		CASE_STRING(DEVICE_STOP_EMULATING);
		CASE_STRING(DEVICE_READY);
		CASE_STRING(POINTER_MOTION);
		CASE_STRING(POINTER_MOTION_ABSOLUTE);
		CASE_STRING(BUTTON_BUTTON);
		CASE_STRING(SCROLL_DELTA);
		CASE_STRING(SCROLL_STOP);
		CASE_STRING(SCROLL_CANCEL);
		CASE_STRING(SCROLL_DISCRETE);
		CASE_STRING(KEYBOARD_KEY);
		CASE_STRING(TOUCH_DOWN);
		CASE_STRING(TOUCH_UP);
		CASE_STRING(TOUCH_MOTION);
		CASE_STRING(FRAME);
		CASE_STRING(TEXT_KEYSYM);
		CASE_STRING(TEXT_UTF8);
	}
#undef CASE_STRING
	assert(!"Unhandled EIS event type");
}

void
_peck_mark(struct peck *peck, const char *func, int line)
{
	static uint32_t mark = 0;
	log_debug(peck, "mark %3d: line %d in %s()\n", mark++, line, func);
}

void
_peck_debug(struct peck *peck, const char *func, int line, const char *format, ...)
{
	va_list args;

	va_start(args, format);
	log_msg_va(peck->logger, LOGGER_DEBUG, "unused", line, func, format, args);
	va_end(args);
}

MUNIT_GLOBAL_SETUP(init_sigalarm)
{
	int argc = setup->argc;
	char **argv = setup->argv;

	for (int i = 0; i < argc; i++) {
		if (streq(argv[i], "--enable-sigalrm") || streq(argv[i], "--enable-sigalarm")) {
			enable_sigalarm = true;
			for (int j = i + 1; j < setup->argc; j++) {
				setup->argv[i] = setup->argv[j];
			}
			setup->argc--;
			break;
		}
	}
}
