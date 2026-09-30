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

#include "eierpecken.h"

MUNIT_TEST(test_ei_seat_bind_unbind)
{
	_unref_(peck) *peck = peck_new();
	_unref_(ei_seat) *seat = NULL;
	_unref_(ei_device) *dev1 = NULL;
	_unref_(ei_device) *dev2 = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		seat = ei_seat_ref(ei_event_get_seat(event));
		ei_seat_bind_capabilities(seat,
					  EI_DEVICE_CAP_POINTER,
					  EI_DEVICE_CAP_KEYBOARD,
					  NULL);
	}

	/* server has the Bind event now and creates devices */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *discard1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *discard2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);

		dev1 = ei_device_ref(ei_event_get_device(e1));
		dev2 = ei_device_ref(ei_event_get_device(e2));

		ei_seat_unbind_capabilities(seat,
					    EI_DEVICE_CAP_POINTER,
					    EI_DEVICE_CAP_KEYBOARD,
					    NULL);
	}

	/* Dispatch, server is aware of the ei_seat_unbind() */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);

		struct ei_device *d1 = ei_event_get_device(e1);
		struct ei_device *d2 = ei_event_get_device(e2);

		munit_assert(d1 != d2);
		munit_assert(d1 == dev1 || d1 == dev2);
		munit_assert(d2 == dev1 || d2 == dev2);

		_unref_(ei_event) *eseat = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		struct ei_seat *s = ei_event_get_seat(eseat);
		munit_assert_ptr_equal(s, seat);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_seat_bind_unbind_noref)
{
	_unref_(peck) *peck = peck_new();
	struct ei_seat *seat = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		seat = ei_seat_ref(ei_event_get_seat(event));
		ei_seat_bind_capabilities(seat,
					  EI_DEVICE_CAP_POINTER,
					  EI_DEVICE_CAP_KEYBOARD,
					  NULL);
	}

	/* server has the Bind event now and creates devices */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *discard1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *discard2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);

		/* Drop our ref before unbinding. This is technically wrong -
		 * must not use seat after unref, but we know there's at least
		 * one ref inside libei for this seat, so this tests ensures
		 * we don't rely on a caller ref to keep everything alive. */
		ei_seat_unref(seat);
		ei_seat_unbind_capabilities(seat,
					    EI_DEVICE_CAP_POINTER,
					    EI_DEVICE_CAP_KEYBOARD,
					    NULL);
	}

	/* Dispatch, server is aware of the ei_seat_unbind() */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *eseat = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_seat_bind_unbind_immediately)
{
	_unref_(peck) *peck = peck_new();
	struct ei_seat *seat = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat,
					  EI_DEVICE_CAP_POINTER,
					  EI_DEVICE_CAP_KEYBOARD,
					  NULL);
		ei_seat_unbind_capabilities(seat,
					    EI_DEVICE_CAP_POINTER,
					    EI_DEVICE_CAP_KEYBOARD,
					    NULL);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *e3 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		_unref_(ei_event) *e4 = peck_ei_next_event(ei, EI_EVENT_DEVICE_RESUMED);
		_unref_(ei_event) *e5 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *e6 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *e7 = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_seat_request_device)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_seat *seat = peck_ei_get_default_seat(peck);
		ei_seat_request_device_with_capabilities(seat,
							 EI_DEVICE_CAP_POINTER,
							 EI_DEVICE_CAP_KEYBOARD,
							 NULL);
		ei_seat_request_device_with_capabilities(seat,
							 EI_DEVICE_CAP_TOUCH,
							 EI_DEVICE_CAP_POINTER_ABSOLUTE,
							 NULL);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *e1 = peck_eis_next_event(eis, EIS_EVENT_SEAT_DEVICE_REQUESTED);
		_unref_(eis_event) *e2 = peck_eis_next_event(eis, EIS_EVENT_SEAT_DEVICE_REQUESTED);

		munit_assert(eis_event_seat_has_capability(e1, EIS_DEVICE_CAP_POINTER));
		munit_assert(eis_event_seat_has_capability(e1, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert(!eis_event_seat_has_capability(e1, EIS_DEVICE_CAP_TOUCH));
		munit_assert(!eis_event_seat_has_capability(e1, EIS_DEVICE_CAP_POINTER_ABSOLUTE));

		munit_assert(!eis_event_seat_has_capability(e2, EIS_DEVICE_CAP_POINTER));
		munit_assert(!eis_event_seat_has_capability(e2, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert(eis_event_seat_has_capability(e2, EIS_DEVICE_CAP_TOUCH));
		munit_assert(eis_event_seat_has_capability(e2, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
	}

	return MUNIT_OK;
}
