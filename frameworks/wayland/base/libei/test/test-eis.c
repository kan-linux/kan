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

#include "util-munit.h"
#include "util-strings.h"
#include "util-version.h"

#include "eierpecken.h"
#include "unistd.h"

MUNIT_TEST(eistest_ref_unref)
{
	struct eis *eis = eis_new(NULL);

	struct eis *refd = eis_ref(eis);
	munit_assert_ptr_equal(eis, refd);

	struct eis *unrefd = eis_unref(eis);
	munit_assert_ptr_null(unrefd);
	unrefd = eis_unref(eis);
	munit_assert_ptr_null(unrefd);

	/* memleak only shows up in valgrind */

	return MUNIT_OK;
}

MUNIT_TEST(eistest_name)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	/* The name is set by peck_new() and immutable after the
	 * backend was set, which peck_new() does for us as well.
	 * So the name we should see is the one hardcoded in peck_new()
	 */

	with_client(peck) {
		with_nonfatal_ei_bug(peck) ei_configure_name(ei, "this name should not be used");
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *event = eis_get_event(eis);
		munit_assert_ptr_not_null(event);
		munit_assert_int(eis_event_get_type(event), ==, EIS_EVENT_CLIENT_CONNECT);

		struct eis_client *client = eis_event_get_client(event);
		munit_assert_string_equal(eis_client_get_name(client), "eierpecken test context");
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_client_bind_all_caps)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *seat_added = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(seat_added);
		ei_seat_bind_capabilities(seat,
					  EI_DEVICE_CAP_POINTER,
					  EI_DEVICE_CAP_POINTER_ABSOLUTE,
					  EI_DEVICE_CAP_KEYBOARD,
					  EI_DEVICE_CAP_TOUCH,
					  EI_DEVICE_CAP_BUTTON,
					  EI_DEVICE_CAP_SCROLL,
					  NULL);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *bind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		munit_assert_true(eis_event_seat_has_capability(bind, EIS_DEVICE_CAP_POINTER));
		munit_assert_true(
			eis_event_seat_has_capability(bind, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_true(eis_event_seat_has_capability(bind, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_true(eis_event_seat_has_capability(bind, EIS_DEVICE_CAP_TOUCH));
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_client_bind_some_caps)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);

	peck_dispatch_until_stable(peck);

	/* Before the clients binds to the seat, our seat has all caps */
	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		munit_assert_true(eis_seat_has_capability(seat, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_true(eis_seat_has_capability(seat, EIS_DEVICE_CAP_POINTER));
		munit_assert_true(eis_seat_has_capability(seat, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_true(eis_seat_has_capability(seat, EIS_DEVICE_CAP_TOUCH));
	}

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_KEYBOARD, NULL);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_TOUCH, NULL);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *bind_kbd = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);

		munit_assert_true(eis_event_seat_has_capability(bind_kbd, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(eis_event_seat_has_capability(bind_kbd, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(
			eis_event_seat_has_capability(bind_kbd, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(eis_event_seat_has_capability(bind_kbd, EIS_DEVICE_CAP_TOUCH));

		_unref_(eis_event) *bind_touch = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);

		munit_assert_true(
			eis_event_seat_has_capability(bind_touch, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(
			eis_event_seat_has_capability(bind_touch, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(
			eis_event_seat_has_capability(bind_touch, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_true(eis_event_seat_has_capability(bind_touch, EIS_DEVICE_CAP_TOUCH));
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_device_resume_pause_twice)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);

		/* Resuming multiple times should only trigger one event */
		eis_device_resume(device);
		eis_device_resume(device); /* noop */
		eis_device_resume(device); /* noop */
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *resumed = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);

		peck_assert_no_ei_events(ei);
	}

	/* Pausing multiple times should only trigger one event */
	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);

		eis_device_pause(device);
		eis_device_pause(device); /* noop */
		eis_device_pause(device); /* noop */
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *paused = peck_ei_next_event(ei, EI_EVENT_DEVICE_PAUSED);

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_device_ignore_paused_device)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_START_EMULATING);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *added = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *device = ei_event_get_device(added);

		peck_assert_no_ei_events(ei);
		/* device was never resumed */
		with_nonfatal_ei_bug(peck) ei_device_pointer_motion(device, 1, 1);
	}

	uint32_t sequence = 100;

	for (size_t i = 0; i < 3; i++) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);

		/* Device is paused */
		with_server(peck) {
			peck_assert_no_eis_events(eis);
			eis_device_resume(device);
		}

		peck_dispatch_until_stable(peck);

		/* Device is resumed */
		with_client(peck) {
			_unref_(ei_event) *resumed =
				peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
			struct ei_device *device = ei_event_get_device(resumed);

			peck_assert_no_ei_events(ei);
			with_emulation(device, ++sequence)
			{
				ei_device_pointer_motion(device, 1, 1);
				ei_device_frame(device, ei_now(ei));
			}
		}

		peck_dispatch_until_stable(peck);

		/* Device is resumed */
		with_server(peck) {
			_unref_(eis_event) *rel =
				peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
			_unref_(eis_event) *stop =
				peck_eis_next_event(eis, EIS_EVENT_DEVICE_STOP_EMULATING);
			peck_assert_no_eis_events(eis);
			eis_device_pause(device);
		}

		peck_dispatch_until_stable(peck);

		/* Device is paused */
		with_client(peck) {
			_unref_(ei_event) *paused = peck_ei_next_event(ei, EI_EVENT_DEVICE_PAUSED);
			struct ei_device *device = ei_event_get_device(paused);

			peck_assert_no_ei_events(ei);
			with_nonfatal_ei_bug(peck)
			{
				ei_device_pointer_motion(device, 1, 1);
				ei_device_frame(device, ei_now(ei));
			}
		}
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_regions)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *ptr = eis_seat_new_device(seat);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_POINTER_ABSOLUTE);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_BUTTON);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_SCROLL);
		eis_device_configure_name(ptr, "region device");
		_unref_(eis_region) *region = eis_device_new_region(ptr);
		eis_region_set_size(region, 100, 200);
		eis_region_set_offset(region, 300, 400);
		eis_region_set_physical_scale(region, 5.6);
		eis_region_add(region);
		eis_device_add(ptr);
		eis_device_resume(ptr);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *added = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *resumed = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		struct ei_device *device = ei_event_get_device(resumed);
		ei_device_start_emulating(device, 1);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *start =
			peck_eis_next_event(eis, EIS_EVENT_DEVICE_START_EMULATING);
		struct eis_device *device = eis_event_get_device(start);

		struct eis_region *r = eis_device_get_region(device, 0);
		munit_assert_int(eis_region_get_width(r), ==, 100);
		munit_assert_int(eis_region_get_height(r), ==, 200);
		munit_assert_int(eis_region_get_x(r), ==, 300);
		munit_assert_int(eis_region_get_y(r), ==, 400);
		munit_assert_double(eis_region_get_physical_scale(r), ==, 5.6);

		r = eis_device_get_region(device, 1);
		munit_assert_null(r);
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_multiple_emulating)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, 1);
		eis_device_start_emulating(device, 2); /* quietly filtered */
		eis_device_start_emulating(device, 3); /* quietly filtered */
		eis_device_stop_emulating(device);
		eis_device_stop_emulating(device); /* quietly filtered */
		eis_device_stop_emulating(device); /* quietly filtered */
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *added = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *resumed = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_int(ei_event_emulating_get_sequence(start), ==, 1);
		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_device_start_emulating_sequence)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *resumed = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
	}

	for (int i = 0; i < 10; i++) {
		uint32_t sequence = munit_rand_uint32();

		with_client(peck) {
			struct ei_device *device = peck_ei_get_default_pointer(peck);
			ei_device_start_emulating(device, sequence);
			ei_device_stop_emulating(device);
		}

		peck_dispatch_until_stable(peck);

		with_server(peck) {
			_unref_(eis_event) *start =
				peck_eis_next_event(eis, EIS_EVENT_DEVICE_START_EMULATING);
			munit_assert_uint32(eis_event_emulating_get_sequence(start), ==, sequence);
			_unref_(eis_event) *stop =
				peck_eis_next_event(eis, EIS_EVENT_DEVICE_STOP_EMULATING);
			peck_assert_no_eis_events(eis);
		}
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_socket_overflow)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, 1);

		for (size_t i = 0; i < 500; i++) {
			eis_device_pointer_motion(device, -10, -10);
			eis_device_frame(device, 0 + i);
		}
		eis_device_stop_emulating(device);
	}

	peck_dispatch_until_stable(peck);

	enum ei_event_type last_type = -1;

	with_client(peck) {
		_unref_(ei_event) *added = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *resumed = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);

		do {
			struct ei_event *peek = ei_peek_event(ei);
			if (!peek)
				break;

			last_type = ei_event_get_type(peek);
			switch (last_type) {
			case EI_EVENT_FRAME:
			case EI_EVENT_POINTER_MOTION:
				break;
			default:
				munit_assert(last_type == EI_EVENT_FRAME ||
					     last_type == EI_EVENT_POINTER_MOTION);
				break;
			}
			ei_event_unref(peek);
			ei_event_unref(ei_get_event(ei));
		} while (true);

		peck_assert_no_ei_events(ei);
	}

	/* We've hit the first batch, now let the server send
	 * the remaining events */
	peck_dispatch_until_stable(peck);

	bool complete = false;

	with_client(peck) {
		if (last_type == EI_EVENT_POINTER_MOTION) {
			_unref_(ei_event) *frame = peck_ei_next_event(ei, EI_EVENT_FRAME);
		} else if (last_type == EI_EVENT_FRAME) {
			/* This fail if the buffer filled just
			 * before the STOP_EVENT event. Adjust the test
			 * if that ever happens */
			_unref_(ei_event) *motion = peck_ei_next_event(ei, EI_EVENT_POINTER_MOTION);
		}
		do {
			struct ei_event *peek = ei_peek_event(ei);
			if (!peek) {
				peck_dispatch_until_stable(peck);
				break;
			}

			last_type = ei_event_get_type(peek);
			switch (last_type) {
			case EI_EVENT_FRAME:
			case EI_EVENT_POINTER_MOTION:
				break;
			case EI_EVENT_DEVICE_STOP_EMULATING:
				complete = true;
				break;
			default:
				munit_error(ei_event_type_to_string(last_type));
				break;
			}
			ei_event_unref(peek);
			ei_event_unref(ei_get_event(ei));
		} while (!complete);
	}

	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_device_ready)
{
	_unref_(peck) *peck = peck_new_context("eis-flags", EIS_FLAG_DEVICE_READY);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);

		_unref_(eis_device) *ptr = eis_seat_new_device(seat);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_POINTER);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_BUTTON);
		eis_device_configure_capability(ptr, EIS_DEVICE_CAP_SCROLL);
		eis_device_configure_name(ptr, "ready device");
		eis_device_add(ptr);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *ready = peck_eis_next_event(eis, EIS_EVENT_DEVICE_READY);
		struct eis_device *dev = eis_event_get_device(ready);
		eis_device_resume(dev);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_eis_ping)
{
	_unref_(peck) *peck = peck_new();
	_unref_(eis_ping) *ping = NULL;
	int userdata = 123;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);

	peck_dispatch_until_stable(peck);

	peck_drain_eis(peck);

	/* Create a ping object without having our own ref, object
	 * is kept alive until the returned pong event is destroyed */
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		_unref_(eis_ping) *ping = eis_client_new_ping(client);
		eis_ping_set_user_data(ping, &userdata);
		eis_ping(ping);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *e = peck_eis_next_event(eis, EIS_EVENT_PONG);
		struct eis_ping *pong = eis_event_pong_get_ping(e);
		munit_assert_not_null(pong);
		munit_assert_ptr_equal(eis_ping_get_user_data(pong), &userdata);
	}

	peck_dispatch_until_stable(peck);

	/* Create a ping object this time keeping our own ref, object
	 * is kept alive until the returned pong event is destroyed */
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		ping = eis_client_new_ping(client);
		eis_ping_set_user_data(ping, &userdata);
		eis_ping(ping);
		/* Keep the ref */
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *e = peck_eis_next_event(eis, EIS_EVENT_PONG);
		struct eis_ping *pong = eis_event_pong_get_ping(e);
		munit_assert_ptr_equal(pong, ping);
		munit_assert_int64(eis_ping_get_id(pong), ==, eis_ping_get_id(ping));
		munit_assert_ptr_equal(eis_ping_get_user_data(pong), &userdata);
	}

	/* unref after the event above, in case that blows things up */
	ping = eis_ping_unref(ping);

	peck_mark(peck);

	/* Send two pings, one we keep the ref to, one floating, then disconnect
	 * immediately */
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		ping = eis_client_new_ping(client);
		eis_ping(ping);

		_unref_(eis_ping) *floating = eis_client_new_ping(client);
		eis_ping(floating);

		eis_client_disconnect(client);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_event *e;
		while ((e = eis_peek_event(eis))) {
			bool found = eis_event_get_type(e) == EIS_EVENT_PONG;
			eis_event_unref(e);

			if (found)
				break;
			_unref_(eis_event) *ev = eis_get_event(eis);
		}

		_unref_(eis_event) *e1 = peck_eis_next_event(eis, EIS_EVENT_PONG);
		struct eis_ping *pong = eis_event_pong_get_ping(e1);
		munit_assert_ptr_equal(pong, ping);

		_unref_(eis_event) *e2 = peck_eis_next_event(eis, EIS_EVENT_PONG);
		pong = eis_event_pong_get_ping(e2);
		munit_assert_ptr_not_equal(pong, ping);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_eis_ping_delayed_pong)
{
	_unref_(peck) *peck = peck_new();
	uint32_t ping_id_1 = 0, ping_id_2 = 0;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);

	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);

	peck_dispatch_until_stable(peck);

	peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_disable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_FRAME);
	peck_disable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	peck_drain_eis(peck);

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		struct eis_device *keyboard = peck_eis_get_default_keyboard(peck);
		_unref_(eis_ping) *ping1 = eis_client_new_ping(client);
		_unref_(eis_ping) *ping2 = eis_client_new_ping(client);

		ping_id_1 = eis_ping_get_id(ping1);
		ping_id_2 = eis_ping_get_id(ping2);

		eis_ping(ping1);
		eis_device_keyboard_send_xkb_modifiers(keyboard, 0x1, 0x2, 0x3, 0x4);
		eis_ping(ping2);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		/* check events arrive in the right order, without processing them */
		struct ei_event *ping1 = peck_ei_next_event(ei, EI_EVENT_SYNC);
		_unref_(ei_event) *mods = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_MODIFIERS);
		struct ei_event *ping2 = peck_ei_next_event(ei, EI_EVENT_SYNC);

		ei_event_unref(ping1);

		/* Send the key as if it was processed between the two pings. */
		struct ei_device *keyboard = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(keyboard, 123, true);
		ei_device_frame(keyboard, ei_now(ei));

		ei_event_unref(ping2);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *pong1 = peck_eis_next_event(eis, EIS_EVENT_PONG);
		_unref_(eis_event) *key = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame = peck_eis_next_event(eis, EIS_EVENT_FRAME);
		_unref_(eis_event) *pong2 = peck_eis_next_event(eis, EIS_EVENT_PONG);

		struct eis_ping *ping1 = eis_event_pong_get_ping(pong1);
		struct eis_ping *ping2 = eis_event_pong_get_ping(pong2);

		munit_assert_int64(ping_id_1, ==, eis_ping_get_id(ping1));
		munit_assert_int64(ping_id_2, ==, eis_ping_get_id(ping2));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_eis_ping_after_disconnect)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	/* Forcibly close the pipe */
	with_client(peck) {
		int fd = peck_get_ei_fd(peck);
		close(fd);
	}

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		_unref_(eis_ping) *ping = eis_client_new_ping(client);

		eis_ping(ping);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *pong = peck_eis_next_event(eis, EIS_EVENT_PONG);
		_unref_(eis_event) *unbind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(eistest_ignore_EPIPE)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	/* Forcibly close the pipe */
	with_client(peck) {
		int fd = peck_get_ei_fd(peck);
		close(fd);
	}

	with_server(peck) {
		eis_log_set_priority(eis, EIS_LOG_PRIORITY_DEBUG);
		peck_eis_enable_log_capture(peck);
		/* Do something that tries to send a message to the client, doesn't matter what */
		eis_device_pause(peck_eis_get_default_pointer(peck));
		peck_eis_disable_log_capture(peck);

		char **warnings = peck_eis_get_log_capture(peck, EIS_LOG_PRIORITY_WARNING);
		munit_assert_false(strv_find_substring(warnings, "Broken pipe", NULL));

		char **debugs = peck_eis_get_log_capture(peck, EIS_LOG_PRIORITY_DEBUG);
		munit_assert_true(strv_find_substring(debugs, "Broken pipe", NULL));
	}

	return MUNIT_OK;
}
