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

#include <fcntl.h>
#include <unistd.h>

#include "util-munit.h"
#include "util-strings.h"
#include "util-time.h"

#include "eierpecken.h"

MUNIT_TEST(test_ei_ref_unref)
{
	struct ei *ei = ei_new(NULL);

	struct ei *refd = ei_ref(ei);
	munit_assert_ptr_equal(ei, refd);

	struct ei *unrefd = ei_unref(ei);
	munit_assert_ptr_null(unrefd);
	unrefd = ei_unref(ei);
	munit_assert_ptr_null(unrefd);

	/* memleak only shows up in valgrind */

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_unref_immediately)
{
	struct peck *peck = peck_new();
	peck_unref(peck);

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_immediately)
{
	_unref_(peck) *peck = peck_new();

	/* Client is immediately rejected */
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_REJECT_CLIENT);
	peck_dispatch_until_stable(peck);

	/* Expect the client to get a disconnect event */
	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_unref_self_immediately)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_dispatch_until_stable(peck);

	/* Disconnect before server processed CONNECT */
	with_client(peck) {
		peck_drop_ei(peck);
		ei_unref(ei);
	}

	peck_dispatch_until_stable(peck);

	/* Expect the client to get a disconnect event */
	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_self_immediately)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_dispatch_until_stable(peck);

	/* Disconnect before server processed CONNECT */
	with_client(peck) {
		ei_disconnect(ei);
	}

	peck_dispatch_until_stable(peck);

	/* Expect the client to get a disconnect event */
	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_connect)
{
	_unref_(peck) *peck = peck_new();
	_unref_(eis_client) *client = NULL;

	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		eis_dispatch(eis);
		_unref_(eis_event) *e = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		client = eis_client_ref(eis_event_get_client(e));
		eis_client_connect(client);
	}

	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *e = peck_ei_next_event(ei, EI_EVENT_CONNECT);
	}

	with_server(peck) {
		eis_client_disconnect(client);
	}

	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *e = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_unref_self_after_connect)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		peck_drop_ei(peck);
		ei_unref(ei);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_self_after_connect)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		ei_disconnect(ei);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_seat)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *connect = peck_ei_next_event(ei, EI_EVENT_CONNECT);
		_unref_(ei_event) *seat = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
	}

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *seat = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_self_after_seat)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *connect = peck_ei_next_event(ei, EI_EVENT_CONNECT);
		_unref_(ei_event) *seat = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		/* Disconnect from client */
		ei_disconnect(ei);

		/* There is no way to disconnect from the server without
		 * destroying the context, so we don't care about the actual
		 * events here
		 */
	}

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_bind_before_received)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* We have *not* called eis_dispatch, so the seat bind hasn't been
	 * processed by the server yet */
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *seat_removed = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_self_after_bind_before_received)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
		/* Disconnect before the server can process the bind event */
		ei_disconnect(ei);
	}

	peck_dispatch_eis(peck);

	with_server(peck) {
		/* Server got the bind event but client disconnected
		 * immediately after */
		_unref_(eis_event) *bind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		_unref_(eis_event) *unbind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(
			eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_TOUCH));
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_bind_after_received)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* Receive the Bind event but don't actually add any devices,
	 * disconnect the client instead */
	peck_dispatch_eis(peck);

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *seat_removed = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_self_after_bind_after_received)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		struct ei_seat *seat = ei_event_get_seat(event);
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* Make sure server sees Bind, then disconnect from server */
	peck_dispatch_eis(peck);

	with_client(peck) {
		ei_disconnect(ei);
	}

	peck_dispatch_eis(peck);

	with_server(peck) {
		_unref_(eis_event) *bind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		_unref_(eis_event) *unbind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(
			eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_TOUCH));
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_unbind_before_received)
{
	_unref_(peck) *peck = peck_new();
	_unref_(ei_seat) *seat = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		seat = ei_seat_ref(ei_event_get_seat(event));
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);

	/* server has the Bind event now */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		ei_seat_unbind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* No server dispatch here so the server isn't aware of the
	 * ei_seat_unbind() call. Disconnect the client
	 */
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	with_client(peck) {
		ei_dispatch(ei);
		_unref_(ei_event) *seat_removed = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_disconnect_after_unbind_after_received)
{
	_unref_(peck) *peck = peck_new();
	_unref_(ei_seat) *seat = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_SEAT_ADDED);
		seat = ei_seat_ref(ei_event_get_seat(event));
		ei_seat_bind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* server has the Bind event now */
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		ei_seat_unbind_capabilities(seat, EI_DEVICE_CAP_POINTER, NULL);
	}

	/* Dispatch, server is aware of the ei_seat_unbind() */
	peck_dispatch_eis(peck);
	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	peck_dispatch_ei(peck);
	with_client(peck) {
		_unref_(ei_event) *seat_removed = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);

		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_client_is_sender)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_SENDER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		struct eis_client *client = eis_event_get_client(connect);
		munit_assert_true(eis_client_is_sender(client));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_client_is_receiver)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *connect = peck_eis_next_event(eis, EIS_EVENT_CLIENT_CONNECT);
		struct eis_client *client = eis_event_get_client(connect);
		munit_assert_false(eis_client_is_sender(client));
	}

	return MUNIT_OK;
}

/* Emulates the XWayland behavior for calling
 * xdotool mousemove_relative -- -1 10
 */
MUNIT_TEST(test_xdotool_rel_motion)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_pointer_motion(device, -1, 10);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_close(device);
		ei_unref(ei);
		peck_drop_ei(peck);
	}

	peck_dispatch_eis(peck);

	with_server(peck) {
		_unref_(eis_event) *motion = peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
		_unref_(eis_event) *stop =
			peck_eis_next_event(eis, EIS_EVENT_DEVICE_STOP_EMULATING);
		_unref_(eis_event) *close = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		_unref_(eis_event) *unbind = peck_eis_next_event(eis, EIS_EVENT_SEAT_BIND);
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(
			eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(eis_event_seat_has_capability(unbind, EIS_DEVICE_CAP_TOUCH));
		_unref_(eis_event) *disconnect =
			peck_eis_next_event(eis, EIS_EVENT_CLIENT_DISCONNECT);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_exceed_write_buffer)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_dispatch_until_stable(peck);

	uint64_t toffset = peck_ei_now(peck);
	unsigned int count = 10000; /* Large enough to require several flushes */
	struct eis_event *events[count];

	peck_drain_eis(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		for (unsigned int i = 0; i < count / 2; i++) {
			ei_device_pointer_motion(device, -1, 10);
			ei_device_frame(device, toffset + i);
		}
	}

	peck_dispatch_eis(peck);

	unsigned int before_buffer = 0;
	with_server(peck) {
		struct eis_event *next;
		while ((next = eis_get_event(eis))) {
			events[before_buffer++] = next;
			munit_assert_uint(before_buffer, <=, count);
		}
	}

	unsigned int nevents = before_buffer;
	if (before_buffer < count) {
		/* We sent >socket buffersize events, so we don't expect to receive all of those */
		/* Calling dispatch (on both) should flush some more */
		peck_dispatch_until_stable(peck);

		with_server(peck) {
			struct eis_event *next;
			while ((next = eis_get_event(eis))) {
				events[nevents++] = next;

				munit_assert_uint(nevents, <=, count);

				if (nevents % 50 == 0)
					peck_dispatch_ei(peck);

				_unref_(eis_event) *next = eis_peek_event(eis);
				if (!next)
					peck_dispatch_eis(peck);
			}
		}
	};

	munit_assert_uint(nevents, ==, count);

	for (unsigned int i = 0; i < count; i += 2) {
		_unref_(eis_event) *motion = events[i];
		_unref_(eis_event) *frame = events[i + 1];

		uint64_t time = eis_event_get_time(frame);

		munit_assert_string_equal(peck_eis_event_name(motion),
					  peck_eis_event_type_name(EIS_EVENT_POINTER_MOTION));
		munit_assert_string_equal(peck_eis_event_name(frame),
					  peck_eis_event_type_name(EIS_EVENT_FRAME));
		munit_assert_int64(time, ==, toffset + i / 2);
	}

	/* Our events are as expected but we never got EAGAIN on
	 * the buffer, so let's count this test as skipped */
	if (before_buffer == count)
		return MUNIT_SKIP;

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_exceed_write_buffer_cleanup)
{
	_unref_(peck) *peck = peck_new();
	struct ei *ei = peck_get_ei(peck);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_dispatch_until_stable(peck);

	uint64_t toffset = peck_ei_now(peck);
	unsigned int count = 10000; /* Large enough to require several flushes */

	peck_drain_eis(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		for (unsigned int i = 0; i < count / 2; i++) {
			ei_device_pointer_motion(device, -1, 10);
			ei_device_frame(device, toffset + i);
		}
	}

	peck_dispatch_eis(peck);

	unsigned int before_buffer = 0;
	with_server(peck) {
		struct eis_event *next;
		while ((next = eis_get_event(eis))) {
			munit_assert_uint(before_buffer, <=, count);
			eis_event_unref(next);
		}
	}

	/* Our events are as expected but we never got EAGAIN on
	 * the buffer, so let's count this test as skipped */
	if (before_buffer == count)
		return MUNIT_SKIP;

	/* Make sure cleanup is handled properly */
	peck_drop_ei(peck);
	ei_unref(ei);

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_invalid_object_ids)
{
	_unref_(peck) *peck = peck_new();
	_unref_(eis_device) *eis_device = NULL;
	_unref_(eis_device) *dummy = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		eis_device = eis_seat_new_device(seat);
		eis_device_configure_name(eis_device, __func__);
		eis_device_configure_capability(eis_device, EIS_DEVICE_CAP_POINTER);
		eis_device_add(eis_device);
		eis_device_resume(eis_device);
	}

	/* Client has device now, remove it from server but don't tell client yet */
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		eis_device_pause(eis_device);
		eis_device_remove(eis_device);
	}
	peck_dispatch_eis(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_start_emulating(device, 0);
		ei_device_pointer_motion(device, -1, 1);
		ei_device_frame(device, ei_now(ei));
		ei_device_stop_emulating(device);
	}

	/* This call should trigger invalid object messages */
	peck_dispatch_eis(peck);

	/* This call should receive the invalid object messages */
	peck_dispatch_ei(peck);

	/* Create a second device to test the defunct cleaning code, this one is
	 * just used to send messages that will trigger ei_dispatch() */
	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		dummy = eis_seat_new_device(seat);
		eis_device_configure_name(dummy, __func__);
		eis_device_configure_capability(dummy, EIS_DEVICE_CAP_POINTER);
		eis_device_add(dummy);
		eis_device_resume(dummy);
	}

	peck_dispatch_until_stable(peck);

	/* trigger the defunct object code - we can't actually test anything here
	 * beyond hoping it crashes if there's a bug */
	peck_ei_add_time_offset(peck, s2us(6));

	for (int i = 0; i < 30; i++) {
		with_server(peck) {
			eis_device_pause(dummy);
			eis_device_resume(dummy);
		}
		peck_dispatch_ei(peck);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_ping)
{
	_unref_(peck) *peck = peck_new();
	_unref_(ei_ping) *ping = NULL;
	int userdata = 123;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);

	peck_dispatch_until_stable(peck);

	peck_drain_ei(peck);

	/* Create a ping object without having our own ref, object
	 * is kept alive until the returned pong event is destroyed */
	with_client(peck) {
		_unref_(ei_ping) *ping = ei_new_ping(ei);
		ei_ping_set_user_data(ping, &userdata);
		ei_ping(ping);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e = peck_ei_next_event(ei, EI_EVENT_PONG);
		struct ei_ping *pong = ei_event_pong_get_ping(e);
		munit_assert_not_null(pong);
		munit_assert_ptr_equal(ei_ping_get_user_data(pong), &userdata);
	}

	peck_dispatch_until_stable(peck);

	/* Create a ping object this time keeping our own ref, object
	 * is kept alive until the returned pong event is destroyed */
	with_client(peck) {
		ping = ei_new_ping(ei);
		ei_ping_set_user_data(ping, &userdata);
		ei_ping(ping);
		/* Keep the ref */
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e = peck_ei_next_event(ei, EI_EVENT_PONG);
		struct ei_ping *pong = ei_event_pong_get_ping(e);
		munit_assert_ptr_equal(pong, ping);
		munit_assert_int64(ei_ping_get_id(pong), ==, ei_ping_get_id(ping));
		munit_assert_ptr_equal(ei_ping_get_user_data(pong), &userdata);
	}

	/* unref after the event above, in case that blows things up */
	ping = ei_ping_unref(ping);

	peck_mark(peck);

	/* Send two pings, one we keep the ref to, one floating, then disconnect
	 * immediately */
	with_client(peck) {
		ping = ei_new_ping(ei);
		ei_ping(ping);

		_unref_(ei_ping) *floating = ei_new_ping(ei);
		ei_ping(floating);
	}

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_event *e;
		while ((e = ei_peek_event(ei))) {
			bool found = ei_event_get_type(e) == EI_EVENT_PONG;
			ei_event_unref(e);

			if (found)
				break;
			_unref_(ei_event) *ev = ei_get_event(ei);
		}

		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_PONG);
		struct ei_ping *pong = ei_event_pong_get_ping(e1);
		munit_assert_ptr_equal(pong, ping);

		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_PONG);
		pong = ei_event_pong_get_ping(e2);
		munit_assert_ptr_not_equal(pong, ping);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_ping_delayed_pong)
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

	with_client(peck) {
		peck_drain_ei(peck);

		/* We send two ping events, one before and one after the frame */
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		_unref_(ei_ping) *ping1 = ei_new_ping(ei);
		_unref_(ei_ping) *ping2 = ei_new_ping(ei);
		ping_id_1 = ei_ping_get_id(ping1);
		ping_id_2 = ei_ping_get_id(ping2);
		ei_ping(ping1);
		ei_device_keyboard_key(device, 123, true);
		ei_device_frame(device, ei_now(ei));
		ei_ping(ping2);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		/* check events arrive in the right order, without processing them */
		struct eis_event *ping1 = peck_eis_next_event(eis, EIS_EVENT_SYNC);
		_unref_(eis_event) *key = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame = peck_eis_next_event(eis, EIS_EVENT_FRAME);
		struct eis_event *ping2 = peck_eis_next_event(eis, EIS_EVENT_SYNC);

		eis_event_unref(ping1);

		/* Send the modifiers event as if it was processed between the two pings. */
		eis_device_keyboard_send_xkb_modifiers(eis_event_get_device(key),
						       0x1,
						       0x2,
						       0x3,
						       0x4);

		eis_event_unref(ping2);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *pong1 = peck_ei_next_event(ei, EI_EVENT_PONG);
		_unref_(ei_event) *mods = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_MODIFIERS);
		_unref_(ei_event) *pong2 = peck_ei_next_event(ei, EI_EVENT_PONG);

		struct ei_ping *ping1 = ei_event_pong_get_ping(pong1);
		struct ei_ping *ping2 = ei_event_pong_get_ping(pong2);

		munit_assert_int64(ping_id_1, ==, ei_ping_get_id(ping1));
		munit_assert_int64(ping_id_2, ==, ei_ping_get_id(ping2));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_ping_within_frame)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);

	peck_dispatch_until_stable(peck);

	peck_drain_ei(peck);

	/* We send two ping events, one before and one after the frame */
	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_keyboard(peck);

		ei_device_keyboard_key(device, 123, true);

		{
			_unref_(ei_ping) *ping = ei_new_ping(ei);
			ei_ping(ping);
		}

		ei_device_frame(device, ei_now(ei));

		{
			_unref_(ei_ping) *ping = ei_new_ping(ei);
			ei_ping(ping);
		}
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *key = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);

		/* The first ping happens here, let's send an event and that
		 * must arrive before the second pong to the client */

		struct eis_device *device = eis_event_get_device(key);
		eis_device_keyboard_send_xkb_modifiers(device, 0x1, 0x2, 0x3, 0x4);

		_unref_(eis_event) *frame = peck_eis_next_event(eis, EIS_EVENT_FRAME);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_PONG);
		_unref_(ei_event) *modifiers = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_MODIFIERS);
		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_PONG);
	}

	peck_dispatch_until_stable(peck);

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_ping_after_disconnect)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSTART);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);

	peck_dispatch_until_stable(peck);

	peck_drain_ei(peck);
	peck_drain_eis(peck);

	with_server(peck) {
		struct eis_client *client = peck_eis_get_default_client(peck);
		eis_client_disconnect(client);
	}

	with_client(peck) {
		_unref_(ei_ping) *ping = ei_new_ping(ei);
		ei_ping(ping);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *pong = peck_ei_next_event(ei, EI_EVENT_PONG);
		_unref_(ei_event) *device_removed = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		_unref_(ei_event) *seat_removed = peck_ei_next_event(ei, EI_EVENT_SEAT_REMOVED);
		_unref_(ei_event) *disconnect = peck_ei_next_event(ei, EI_EVENT_DISCONNECT);

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}
