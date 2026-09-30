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

#include <stdint.h>

#pragma once

#include "util-mem.h"

#include "libei.h"
#include "libeis.h"

enum peck_ei_mode {
	PECK_EI_RECEIVER = 20,
	PECK_EI_SENDER,
};

/**
 * An enum to define basic server behavior in peck_dispatch_eis().
 * Where a flag is **not** set for any specific behaviour, that event will
 * remain on the event queue after peck_dispatch_eis(). For example, a
 * caller setting @ref PECK_EIS_BEHAVIOR_ACCEPT_CLIENT will see
 * the device added event as first event in the queue.
 */
enum peck_eis_behavior {
	/**
	 * Behavior of EIS is implemented in the test case.
	 */
	PECK_EIS_BEHAVIOR_NONE,
	/**
	 * Accept all client connection requests, create default seats
	 * **and** resume any device immediately after add.
	 */
	PECK_EIS_BEHAVIOR_ACCEPT_ALL,

	/**
	 * Process connect/disconnect requests from the client.
	 */
	PECK_EIS_BEHAVIOR_ACCEPT_CLIENT,
	PECK_EIS_BEHAVIOR_REJECT_CLIENT,

	/**
	 * Create a "default" seat. This behavior is enabled as part of
	 * PECK_EIS_BEHAVIOR_ACCEPT_ALL.
	 */
	PECK_EIS_BEHAVIOR_DEFAULT_SEAT,
	/**
	 * Do not create a "default" seat.
	 */
	PECK_EIS_BEHAVIOR_NO_DEFAULT_SEAT,

	/**
	 * Handle the bind seat request
	 */
	PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT,

	/**
	 * Handle the device close. This behavior is enabled as part of
	 * PECK_EIS_BEHAVIOR_ACCEPT_ALL.
	 */
	PECK_EIS_BEHAVIOR_HANDLE_CLOSE_DEVICE,

	/**
	 * Handle frame events. This behavior is enabled by default.
	 */
	PECK_EIS_BEHAVIOR_HANDLE_FRAME,
	/**
	 * Handle sync events. This behavior is enabled by default.
	 */
	PECK_EIS_BEHAVIOR_HANDLE_SYNC,
	/**
	 * Handle the start/stop emulation event. This behavior is enabled as part of
	 * PECK_EIS_BEHAVIOR_ACCEPT_ALL.
	 */
	PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING,
	PECK_EIS_BEHAVIOR_HANDLE_STOP_EMULATING,

	/**
	 * Create default devices
	 */
	PECK_EIS_BEHAVIOR_ADD_DEVICES, /**< add all of the below */
	PECK_EIS_BEHAVIOR_ADD_POINTER,
	PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE,
	PECK_EIS_BEHAVIOR_ADD_KEYBOARD,
	PECK_EIS_BEHAVIOR_ADD_TOUCH,

	PECK_EIS_BEHAVIOR_RESUME_DEVICE,
	PECK_EIS_BEHAVIOR_SUSPEND_DEVICE,

	/**
	 * Handle device ready events. This behavior is enabled by default.
	 */
	PECK_EIS_BEHAVIOR_HANDLE_DEVICE_READY,
};

enum peck_ei_behavior {
	PECK_EI_BEHAVIOR_NONE,
	/* enabled by default - handle the Connect event */
	PECK_EI_BEHAVIOR_HANDLE_CONNECT,
	/* enabled by default - handle the first seat added event, setting
	 * the default seat to the first seat and bind to it */
	PECK_EI_BEHAVIOR_AUTOSEAT,
	/* handle Connect/Seat/Added/Resumed events, i.e. anything until the
	 * first real device event */
	PECK_EI_BEHAVIOR_AUTODEVICES,
	/**
	 * Immediately send a StartEmulating request once a device is resumed.
	 */
	PECK_EI_BEHAVIOR_AUTOSTART,
	PECK_EI_BEHAVIOR_HANDLE_ADDED,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER_ABSOLUTE,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_TOUCH,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_BUTTON,
	PECK_EI_BEHAVIOR_HANDLE_ADDED_SCROLL,

	PECK_EI_BEHAVIOR_HANDLE_RESUMED,
	PECK_EI_BEHAVIOR_HANDLE_PAUSED,

	/**
	 * Handle frame events. This behavior is enabled by default.
	 */
	PECK_EI_BEHAVIOR_HANDLE_FRAME,
	/**
	 * Handle sync events. This behavior is enabled by default.
	 */
	PECK_EI_BEHAVIOR_HANDLE_SYNC,
};

struct peck;

struct peck *
_peck_new_context(const char *what, ...) __attribute__((sentinel));

#define peck_new_context(...) _peck_new_context(__VA_ARGS__, NULL)
#define peck_new() peck_new_context(NULL, NULL);

void
_peck_mark(struct peck *peck, const char *func, int line);
/** Add debug marker to the log output */
#define peck_mark(peck_) _peck_mark(peck_, __func__, __LINE__)

void
_peck_debug(struct peck *peck, const char *func, int line, const char *format, ...);
#define peck_debug(peck_, ...) _peck_debug(peck_, __func__, __LINE__, __VA_ARGS__)

void
peck_ei_disable_fatal_bug(struct peck *peck);

void
peck_ei_enable_fatal_bug(struct peck *peck);

void
peck_eis_disable_fatal_bug(struct peck *peck);

void
peck_eis_enable_fatal_bug(struct peck *peck);

void
peck_ei_add_time_offset(struct peck *peck, uint64_t us);

void
peck_eis_add_time_offset(struct peck *peck, uint64_t us);

void
peck_enable_eis_behavior(struct peck *peck, enum peck_eis_behavior behavior);

void
peck_disable_eis_behavior(struct peck *peck, enum peck_eis_behavior behavior);

void
peck_enable_ei_behavior(struct peck *peck, enum peck_ei_behavior behavior);

void
peck_disable_ei_behavior(struct peck *peck, enum peck_ei_behavior behavior);

void
peck_ei_enable_log_capture(struct peck *peck);

void
peck_ei_disable_log_capture(struct peck *peck);

char **
peck_ei_get_log_capture(struct peck *peck, enum ei_log_priority priority);

void
peck_eis_enable_log_capture(struct peck *peck);

void
peck_eis_disable_log_capture(struct peck *peck);

char **
peck_eis_get_log_capture(struct peck *peck, enum eis_log_priority priority);

struct ei *
peck_get_ei(struct peck *peck);

int
peck_get_ei_fd(struct peck *peck);

void
peck_drop_ei(struct peck *peck);

struct eis *
peck_get_eis(struct peck *peck);

struct eis_client *
peck_eis_get_default_client(struct peck *peck);

struct eis_seat *
peck_eis_get_default_seat(struct peck *peck);

struct eis_device *
peck_eis_get_default_pointer(struct peck *peck);

struct eis_device *
peck_eis_get_default_keyboard(struct peck *peck);

struct eis_device *
peck_eis_get_default_pointer_absolute(struct peck *peck);

struct eis_device *
peck_eis_get_default_touch(struct peck *peck);

struct eis_device *
peck_eis_get_default_button(struct peck *peck);

struct eis_device *
peck_eis_get_default_scroll(struct peck *peck);

struct ei_seat *
peck_ei_get_default_seat(struct peck *peck);

struct ei_device *
peck_ei_get_default_pointer(struct peck *peck);

struct ei_device *
peck_ei_get_default_button(struct peck *peck);

struct ei_device *
peck_ei_get_default_scroll(struct peck *peck);

struct ei_device *
peck_ei_get_default_keyboard(struct peck *peck);

struct ei_device *
peck_ei_get_default_pointer_absolute(struct peck *peck);

struct ei_device *
peck_ei_get_default_touch(struct peck *peck);

uint64_t
peck_ei_now(struct peck *peck);

uint64_t
peck_eis_now(struct peck *peck);

/**
 * Dispatch all events according to the currently defined behavior.
 * When this function returns false, the connection is in a "stable" state
 * and further calls to this function will not change that state. This stable
 * state may mean either there are no events or events pending to be
 * processed by the caller.
 *
 * @return true if at least one event was processed according to the current
 * behavior
 */
#define peck_dispatch_eis(_p) \
	_peck_dispatch_eis(_p, __LINE__)
bool
_peck_dispatch_eis(struct peck *peck, int lineno);

/**
 * Dispatch all events according to the currently defined behavior.
 * When this function returns false, the connection is in a "stable" state
 * and further calls to this function will not change that state. This stable
 * state may mean either there are no events or events pending to be
 * processed by the caller.
 *
 * @return true if at least one behavior was processed according to the
 * current behavior
 */
#define peck_dispatch_ei(_p) \
	_peck_dispatch_ei(_p, __LINE__)
bool
_peck_dispatch_ei(struct peck *peck, int lineno);

struct peck *
peck_unref(struct peck *peck);

/**
 * Dispatch both EIS and EI until a stable state is reached, i.e. until
 * either there are no events pending or until either (or both) have events
 * pending that are not processed by the current behaviors.
 */
void
_peck_dispatch_until_stable(struct peck *peck, const char *func, int lineno);

#define peck_dispatch_until_stable(_p) \
	_peck_dispatch_until_stable((_p), __func__, __LINE__)

/**
 * Discard all pending events.
 */
void
peck_drain_eis(struct peck *peck);

/**
 * Discard all pending events.
 */
void
peck_drain_ei(struct peck *peck);

void
_peck_assert_no_eis_events(struct eis *eis, int lineno);
#define peck_assert_no_eis_events(_eis) \
	_peck_assert_no_eis_events(_eis, __LINE__)

void
_peck_assert_no_ei_events(struct ei *ei, int lineno);
#define peck_assert_no_ei_events(_ei) \
	_peck_assert_no_ei_events(_ei, __LINE__)

#define peck_ei_next_event(_ei, _type) \
	_peck_ei_next_event(_ei, _type, __LINE__)
struct ei_event *
_peck_ei_next_event(struct ei *ei, enum ei_event_type type, int lineno);

#define peck_eis_next_event(_eis, _type) \
	_peck_eis_next_event(_eis, _type, __LINE__)
struct eis_event *
_peck_eis_next_event(struct eis *eis, enum eis_event_type type, int lineno);

#define peck_eis_touch_down(_eis, _x, _y) \
	_peck_eis_touch_event(_eis, EIS_EVENT_TOUCH_DOWN, _x, _y,  __LINE__)
#define peck_eis_touch_motion(_eis, _x, _y) \
	_peck_eis_touch_event(_eis, EIS_EVENT_TOUCH_MOTION, _x, _y,  __LINE__)
#define peck_eis_touch_up(_eis) \
	_peck_eis_next_event(_eis, EIS_EVENT_TOUCH_UP, __LINE__)

struct eis_event *
_peck_eis_touch_event(struct eis *eis, enum eis_event_type type, double x, double y, int lineno);

#define peck_ei_touch_down(_ei, _x, _y) \
	_peck_ei_touch_event(_ei, EI_EVENT_TOUCH_DOWN, _x, _y,  __LINE__)
#define peck_ei_touch_motion(_ei, _x, _y) \
	_peck_ei_touch_event(_ei, EI_EVENT_TOUCH_MOTION, _x, _y,  __LINE__)
#define peck_ei_touch_up(_ei) \
	_peck_ei_next_event(_ei, EI_EVENT_TOUCH_UP, __LINE__)

struct ei_event *
_peck_ei_touch_event(struct ei *ei, enum ei_event_type type, double x, double y, int lineno);

const char *
peck_ei_event_name(struct ei_event *e);

const char *
peck_eis_event_name(struct eis_event *e);

const char *
peck_ei_event_type_name(enum ei_event_type type);

const char *
peck_eis_event_type_name(enum eis_event_type type);

DEFINE_UNREF_CLEANUP_FUNC(peck);

/* Define a bunch of _cleanup_foo_ macros for a struct foo */
DEFINE_UNREF_CLEANUP_FUNC(ei);
DEFINE_UNREF_CLEANUP_FUNC(ei_event);
DEFINE_UNREF_CLEANUP_FUNC(ei_device);
DEFINE_UNREF_CLEANUP_FUNC(ei_touch);
DEFINE_UNREF_CLEANUP_FUNC(ei_keymap);
DEFINE_UNREF_CLEANUP_FUNC(ei_seat);
DEFINE_UNREF_CLEANUP_FUNC(ei_region);
DEFINE_UNREF_CLEANUP_FUNC(ei_ping);

DEFINE_UNREF_CLEANUP_FUNC(eis);
DEFINE_UNREF_CLEANUP_FUNC(eis_client);
DEFINE_UNREF_CLEANUP_FUNC(eis_event);
DEFINE_UNREF_CLEANUP_FUNC(eis_device);
DEFINE_UNREF_CLEANUP_FUNC(eis_touch);
DEFINE_UNREF_CLEANUP_FUNC(eis_keymap);
DEFINE_UNREF_CLEANUP_FUNC(eis_seat);
DEFINE_UNREF_CLEANUP_FUNC(eis_region);
DEFINE_UNREF_CLEANUP_FUNC(eis_ping);

/* Macros intended just for readability to make it more obvious which part
   of a test handles server vs client */
#define with_server(peck_) for (struct eis *eis = peck_get_eis(peck_); eis; eis = NULL)
#define with_client(peck_) for (struct ei *ei = peck_get_ei(peck_); ei; ei = NULL)
#define with_emulation(d_, sequence_) for (bool _loop = ({ ei_device_start_emulating(d_, sequence_); true;});\
				_loop; \
				({ ei_device_stop_emulating(d_); _loop = false; }))
#define with_nonfatal_eis_bug(peck_) for (bool _loop = ({ peck_eis_disable_fatal_bug(peck_); true; }); \
					  _loop; \
					  ({ peck_eis_enable_fatal_bug(peck_); _loop = false; }))
#define with_nonfatal_ei_bug(peck_) for (bool _loop = ({ peck_ei_disable_fatal_bug(peck_); true; }); \
					  _loop; \
					  ({ peck_ei_enable_fatal_bug(peck_); _loop = false; }))

#define peck_errno_check(_rc) {		\
	const int xrc = (_rc);		\
	if (xrc != 0)			\
		munit_errorf("errno is not 0: %d - %s\n", -xrc, strerror(-xrc)); \
	}
