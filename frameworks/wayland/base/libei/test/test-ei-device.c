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

#include <errno.h>
#include <linux/input.h>
#include <sys/socket.h>
#include <sys/types.h>

#include "util-io.h"
#include "util-memfile.h"
#include "util-memmap.h"
#include "util-munit.h"

#include "eierpecken.h"

#if HAVE_MEMFD_CREATE
DEFINE_UNREF_CLEANUP_FUNC(memfile);
DEFINE_UNREF_CLEANUP_FUNC(memmap);
#endif

MUNIT_TEST(test_ei_device_basics)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);

		/* The default value */
		munit_assert_int(eis_device_get_type(device), ==, EIS_DEVICE_TYPE_VIRTUAL);

		eis_device_configure_name(device, "string is freed");
		munit_assert_string_equal(eis_device_get_name(device), "string is freed");

		/* overwrite before eis_device_add() is possible */
		eis_device_configure_name(device, __func__);
		munit_assert_string_equal(eis_device_get_name(device), __func__);

		munit_assert_false(eis_device_has_capability(device, EIS_DEVICE_CAP_POINTER));
		munit_assert_false(eis_device_has_capability(device, EIS_DEVICE_CAP_KEYBOARD));
		munit_assert_false(
			eis_device_has_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(eis_device_has_capability(device, EIS_DEVICE_CAP_TOUCH));

		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER);
		munit_assert_true(eis_device_has_capability(device, EIS_DEVICE_CAP_POINTER));
		eis_device_configure_capability(device, EIS_DEVICE_CAP_KEYBOARD);
		munit_assert_true(eis_device_has_capability(device, EIS_DEVICE_CAP_KEYBOARD));

		eis_device_add(device);

		/* device is read-only now */
		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);
		munit_assert_false(
			eis_device_has_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE));

		eis_device_configure_name(device, "nope");
		munit_assert_string_equal(eis_device_get_name(device), __func__);
	}

	peck_dispatch_ei(peck);

	/* device creation and getters/setters test */
	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *device = ei_event_get_device(event);

		munit_assert_not_null(device);
		munit_assert_int(ei_device_get_type(device), ==, EI_DEVICE_TYPE_VIRTUAL);
		munit_assert_string_equal(ei_device_get_name(device), __func__);

		munit_assert_true(ei_device_has_capability(device, EI_DEVICE_CAP_POINTER));
		munit_assert_true(ei_device_has_capability(device, EI_DEVICE_CAP_KEYBOARD));
		munit_assert_false(
			ei_device_has_capability(device, EI_DEVICE_CAP_POINTER_ABSOLUTE));
		munit_assert_false(ei_device_has_capability(device, EI_DEVICE_CAP_TOUCH));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_passive_ei_device_type)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *phys = eis_seat_new_device(seat);

		eis_device_configure_type(phys, EIS_DEVICE_TYPE_PHYSICAL);
		munit_assert_int(eis_device_get_type(phys), ==, EIS_DEVICE_TYPE_PHYSICAL);
		eis_device_configure_capability(phys, EIS_DEVICE_CAP_POINTER);
		eis_device_configure_size(phys, 100, 100);
		eis_device_add(phys);

		/* noop after add */
		eis_device_configure_type(phys, EIS_DEVICE_TYPE_VIRTUAL);

		_unref_(eis_device) *virt = eis_seat_new_device(seat);
		eis_device_configure_type(virt, EIS_DEVICE_TYPE_VIRTUAL);
		eis_device_configure_capability(virt, EIS_DEVICE_CAP_POINTER);
		with_nonfatal_eis_bug(peck)
			eis_device_configure_size(virt,
						  200,
						  200); /* Has no effect on a virtual device */
		munit_assert_int(eis_device_get_type(virt), ==, EIS_DEVICE_TYPE_VIRTUAL);
		eis_device_add(virt);

		/* noop after add */
		eis_device_configure_type(virt, EIS_DEVICE_TYPE_PHYSICAL);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event_phys = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *phys = ei_event_get_device(event_phys);
		munit_assert_int(ei_device_get_type(phys), ==, EI_DEVICE_TYPE_PHYSICAL);
		munit_assert_int(ei_device_get_width(phys), ==, 100);
		munit_assert_int(ei_device_get_height(phys), ==, 100);

		_unref_(ei_event) *event_virt = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *virt = ei_event_get_device(event_virt);
		munit_assert_int(ei_device_get_type(virt), ==, EI_DEVICE_TYPE_VIRTUAL);
		munit_assert_int(ei_device_get_width(virt), ==, 0);
		munit_assert_int(ei_device_get_height(virt), ==, 0);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_set_name_multiple_devices)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *d1 = eis_seat_new_device(seat);
		eis_device_configure_name(d1, "first device");
		eis_device_configure_capability(d1, EIS_DEVICE_CAP_POINTER);
		eis_device_add(d1);

		_unref_(eis_device) *d2 = eis_seat_new_device(seat);
		/* Unnamed */
		eis_device_configure_capability(d2, EIS_DEVICE_CAP_POINTER);
		eis_device_add(d2);

		_unref_(eis_device) *d3 = eis_seat_new_device(seat);
		eis_device_configure_name(d3, "third device");
		eis_device_configure_capability(d3, EIS_DEVICE_CAP_POINTER);
		eis_device_add(d3);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *d1 = ei_event_get_device(e1);
		munit_assert_string_equal(ei_device_get_name(d1), "first device");

		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *d2 = ei_event_get_device(e2);
		munit_assert_string_equal(ei_device_get_name(d2), "unnamed device");

		_unref_(ei_event) *e3 = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *d3 = ei_event_get_device(e3);
		munit_assert_string_equal(ei_device_get_name(d3), "third device");
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_never_added)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_dispatch_until_stable(peck);

	/* Unref after remove */
	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		struct eis_device *device = eis_seat_new_device(seat);
		eis_device_remove(device);
		eis_device_unref(device);
	}

	peck_dispatch_until_stable(peck);

	/* device was never added, shouldn't show up */
	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	/* unref before remove.
	 *
	 * This would be invalid client code since you can't expect to have
	 * a ref after unref, but since we know the device is still here, we
	 * can test for the lib being correct.
	 */
	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		struct eis_device *device = eis_seat_new_device(seat);
		eis_device_unref(device);
		eis_device_remove(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_add_remove)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_dispatch_until_stable(peck);

	_unref_(ei_device) *device = NULL;
	_unref_(eis_device) *eis_device = NULL;

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		eis_device = eis_seat_new_device(seat);
		eis_device_configure_name(eis_device, __func__);
		eis_device_configure_capability(eis_device, EIS_DEVICE_CAP_POINTER);
		eis_device_add(eis_device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		device = ei_device_ref(ei_event_get_device(event));
	}

	with_server(peck) {
		eis_device_remove(eis_device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);

		munit_assert_ptr_equal(ei_event_get_device(event), device);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_close)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_DEVICES);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_close(device);

		device = peck_ei_get_default_touch(peck);
		ei_device_close(device);

		device = peck_ei_get_default_keyboard(peck);
		ei_device_close(device);

		device = peck_ei_get_default_pointer_absolute(peck);
		ei_device_close(device);

		peck_assert_no_ei_events(ei);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *e1 = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		struct eis_device *d1 = eis_event_get_device(e1);
		munit_assert_ptr_equal(d1, peck_eis_get_default_pointer(peck));

		_unref_(eis_event) *e2 = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		struct eis_device *d2 = eis_event_get_device(e2);
		munit_assert_ptr_equal(d2, peck_eis_get_default_touch(peck));

		_unref_(eis_event) *e3 = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		struct eis_device *d3 = eis_event_get_device(e3);
		munit_assert_ptr_equal(d3, peck_eis_get_default_keyboard(peck));

		_unref_(eis_event) *e4 = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		struct eis_device *d4 = eis_event_get_device(e4);
		munit_assert_ptr_equal(d4, peck_eis_get_default_pointer_absolute(peck));

		/* release in different order */
		eis_device_remove(d2);
		eis_device_remove(d1);
		eis_device_remove(d4);
		eis_device_remove(d3);

		peck_assert_no_eis_events(eis);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *e1 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		struct ei_device *d1 = ei_event_get_device(e1);
		munit_assert_ptr_equal(d1, peck_ei_get_default_touch(peck));

		_unref_(ei_event) *e2 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		struct ei_device *d2 = ei_event_get_device(e2);
		munit_assert_ptr_equal(d2, peck_ei_get_default_pointer(peck));

		_unref_(ei_event) *e3 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		struct ei_device *d3 = ei_event_get_device(e3);
		munit_assert_ptr_equal(d3, peck_ei_get_default_pointer_absolute(peck));

		_unref_(ei_event) *e4 = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		struct ei_device *d4 = ei_event_get_device(e4);
		munit_assert_ptr_equal(d4, peck_ei_get_default_keyboard(peck));

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_button_button)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_button_button(device, BTN_LEFT, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* double press is quietly ignored */
		ei_device_button_button(device, BTN_LEFT, true);
		ei_device_frame(device, peck_ei_now(peck));

		ei_device_button_button(device, BTN_RIGHT, true);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_button_button(device, BTN_RIGHT, false);
		ei_device_frame(device, peck_ei_now(peck));

		/* double release is quietly ignored */
		ei_device_button_button(device, BTN_RIGHT, false);
		ei_device_frame(device, peck_ei_now(peck));

		ei_device_button_button(device, BTN_LEFT, false);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *ld = peck_eis_next_event(eis, EIS_EVENT_BUTTON_BUTTON);
		munit_assert_int(eis_event_button_get_button(ld), ==, BTN_LEFT);
		munit_assert_true(eis_event_button_get_is_press(ld));

		_unref_(eis_event) *rd = peck_eis_next_event(eis, EIS_EVENT_BUTTON_BUTTON);
		munit_assert_int(eis_event_button_get_button(rd), ==, BTN_RIGHT);
		munit_assert_true(eis_event_button_get_is_press(rd));

		_unref_(eis_event) *ru = peck_eis_next_event(eis, EIS_EVENT_BUTTON_BUTTON);
		munit_assert_int(eis_event_button_get_button(ru), ==, BTN_RIGHT);
		munit_assert_false(eis_event_button_get_is_press(ru));

		_unref_(eis_event) *lu = peck_eis_next_event(eis, EIS_EVENT_BUTTON_BUTTON);
		munit_assert_int(eis_event_button_get_button(lu), ==, BTN_LEFT);
		munit_assert_false(eis_event_button_get_is_press(lu));

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_keyboard_key)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(device, KEY_Q, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* Double press is quietly ignored */
		ei_device_keyboard_key(device, KEY_Q, true);
		ei_device_frame(device, peck_ei_now(peck));

		ei_device_keyboard_key(device, KEY_Q, false);
		ei_device_frame(device, peck_ei_now(peck));

		/* Double release is quietly ignored */
		ei_device_keyboard_key(device, KEY_Q, false);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *press = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		munit_assert_int(eis_event_keyboard_get_key(press), ==, KEY_Q);
		munit_assert_true(eis_event_keyboard_get_key_is_press(press));

		_unref_(eis_event) *release = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		munit_assert_int(eis_event_keyboard_get_key(release), ==, KEY_Q);
		munit_assert_false(eis_event_keyboard_get_key_is_press(release));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_pointer_rel)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_pointer_motion(device, 1, 2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_pointer_motion(device, 0.3, 1.4);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_pointer_motion(device, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *first = peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
		munit_assert_double_equal(eis_event_pointer_get_dx(first), 1.0, 2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_dy(first), 2.0, 2 /* precision */);

		_unref_(eis_event) *second = peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
		munit_assert_double_equal(eis_event_pointer_get_dx(second), 0.3, 2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_dy(second), 1.4, 2 /* precision */);

		_unref_(eis_event) *third = peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
		munit_assert_double_equal(eis_event_pointer_get_dx(third), 100, 2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_dy(third), 200, 2 /* precision */);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_regions)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);

		/* nothing cares about the actual values, so we're just
		 * checking for correct passthrough here */
		_unref_(eis_region) *r1 = eis_device_new_region(device);
		eis_region_set_size(r1, 100, 200);
		eis_region_set_offset(r1, 300, 400);
		eis_region_set_mapping_id(r1, "oo oo eye dee");
		/* no scale, default to 1.0 */
		eis_region_add(r1);

		_unref_(eis_region) *r2 = eis_device_new_region(device);
		eis_region_set_size(r2, 500, 600);
		eis_region_set_offset(r2, 700, 800);
		eis_region_set_physical_scale(r2, 3.9);
		eis_region_add(r2);

		_unref_(eis_region) *r3 = eis_device_new_region(device);
		eis_region_set_size(r3, 900, 1000);
		eis_region_set_offset(r3, 1100, 1200);
		eis_region_set_physical_scale(r3, 0.3);
		eis_region_add(r3);

		/* Add the same region twice, should be ignored */
		eis_region_add(r3);
		eis_region_add(r3);
		eis_region_add(r3);

		eis_device_add(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer_absolute(peck);
		struct ei_region *r, *r2;

		r = ei_device_get_region(device, 0);
		munit_assert_int(ei_region_get_width(r), ==, 100);
		munit_assert_int(ei_region_get_height(r), ==, 200);
		munit_assert_int(ei_region_get_x(r), ==, 300);
		munit_assert_int(ei_region_get_y(r), ==, 400);
		munit_assert_double_equal(ei_region_get_physical_scale(r), 1.0, 2 /* precision */);
		munit_assert_string_equal(ei_region_get_mapping_id(r), "oo oo eye dee");

		r2 = ei_device_get_region_at(device, 300, 400);
		munit_assert_ptr_equal(r, r2);
		r2 = ei_device_get_region_at(device, 350, 450);
		munit_assert_ptr_equal(r, r2);

		r = ei_device_get_region(device, 1);
		munit_assert_int(ei_region_get_width(r), ==, 500);
		munit_assert_int(ei_region_get_height(r), ==, 600);
		munit_assert_int(ei_region_get_x(r), ==, 700);
		munit_assert_int(ei_region_get_y(r), ==, 800);
		munit_assert_double_equal(ei_region_get_physical_scale(r), 3.9, 2 /* precision */);
		munit_assert_null(ei_region_get_mapping_id(r));

		r2 = ei_device_get_region_at(device, 750, 850);
		munit_assert_ptr_equal(r, r2);

		r = ei_device_get_region(device, 2);
		munit_assert_int(ei_region_get_width(r), ==, 900);
		munit_assert_int(ei_region_get_height(r), ==, 1000);
		munit_assert_int(ei_region_get_x(r), ==, 1100);
		munit_assert_int(ei_region_get_y(r), ==, 1200);
		munit_assert_double_equal(ei_region_get_physical_scale(r), 0.3, 2 /* precision */);
		munit_assert_null(ei_region_get_mapping_id(r));

		r2 = ei_device_get_region_at(device, 1999, 2199);
		munit_assert_ptr_equal(r, r2);
		munit_assert_ptr_null(
			ei_device_get_region_at(device, 2000, 2200)); /* at the edge */

		munit_assert_ptr_null(ei_device_get_region(device, 3));
		munit_assert_ptr_null(ei_device_get_region_at(device, 0, 100));
	}

	return MUNIT_OK;
}

/* Same test as test_ei_device_regions_touch but for absmotion */
MUNIT_TEST(test_ei_device_regions_absmotion)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);

		/* nothing cares about the actual values, so we're just
		 * checking for correct passthrough here */
		_unref_(eis_region) *r1 = eis_device_new_region(device);
		eis_region_set_size(r1, 100, 200);
		eis_region_set_offset(r1, 300, 400);
		eis_region_add(r1);

		_unref_(eis_region) *r2 = eis_device_new_region(device);
		eis_region_set_size(r2, 500, 600);
		eis_region_set_offset(r2, 700, 800);
		eis_region_add(r2);

		_unref_(eis_region) *r3 = eis_device_new_region(device);
		eis_region_set_size(r3, 900, 1000);
		eis_region_set_offset(r3, 1100, 1200);
		eis_region_add(r3);

		eis_device_add(device);
		eis_device_resume(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer_absolute(peck);
		ei_device_start_emulating(device, 0);
		/* valid */
		ei_device_pointer_motion_absolute(device, 301, 401);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		ei_device_pointer_motion_absolute(device, 401, 401);
		ei_device_frame(device, peck_ei_now(peck));

		/* valid */
		ei_device_pointer_motion_absolute(device, 701, 801);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		ei_device_pointer_motion_absolute(device, 1201, 801);
		ei_device_frame(device, peck_ei_now(peck));

		/* valid */
		ei_device_pointer_motion_absolute(device, 1101, 1201);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		ei_device_pointer_motion_absolute(device, 2000, 1201);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *e1 =
			peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION_ABSOLUTE);
		munit_assert_double_equal(eis_event_pointer_get_absolute_x(e1),
					  301,
					  2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_absolute_y(e1),
					  401,
					  2 /* precision */);

		_unref_(eis_event) *e2 =
			peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION_ABSOLUTE);
		munit_assert_double_equal(eis_event_pointer_get_absolute_x(e2),
					  701,
					  2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_absolute_y(e2),
					  801,
					  2 /* precision */);

		_unref_(eis_event) *e3 =
			peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION_ABSOLUTE);
		munit_assert_double_equal(eis_event_pointer_get_absolute_x(e3),
					  1101,
					  2 /* precision */);
		munit_assert_double_equal(eis_event_pointer_get_absolute_y(e3),
					  1201,
					  2 /* precision */);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

/* Same test as test_ei_device_regions_absmotion but for touch */
MUNIT_TEST(test_ei_device_regions_touch)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_TOUCH);

		/* nothing cares about the actual values, so we're just
		 * checking for correct passthrough here */
		_unref_(eis_region) *r1 = eis_device_new_region(device);
		eis_region_set_size(r1, 100, 200);
		eis_region_set_offset(r1, 300, 400);
		eis_region_add(r1);

		_unref_(eis_region) *r2 = eis_device_new_region(device);
		eis_region_set_size(r2, 500, 600);
		eis_region_set_offset(r2, 700, 800);
		eis_region_add(r2);

		_unref_(eis_region) *r3 = eis_device_new_region(device);
		eis_region_set_size(r3, 900, 1000);
		eis_region_set_offset(r3, 1100, 1200);
		eis_region_add(r3);

		eis_device_add(device);
		eis_device_resume(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_touch(peck);
		ei_device_start_emulating(device, 0);

		/* valid */
		_unref_(ei_touch) *t1 = ei_device_touch_new(device);
		ei_touch_down(t1, 301, 401);
		ei_touch_up(t1);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		_unref_(ei_touch) *t2 = ei_device_touch_new(device);
		peck_ei_disable_fatal_bug(peck);
		ei_touch_down(t2, 401, 401);
		ei_touch_up(t2);
		peck_ei_enable_fatal_bug(peck);
		ei_device_frame(device, peck_ei_now(peck));

		/* valid */
		_unref_(ei_touch) *t3 = ei_device_touch_new(device);
		ei_touch_down(t3, 701, 801);
		ei_touch_up(t3);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		_unref_(ei_touch) *t4 = ei_device_touch_new(device);
		peck_ei_disable_fatal_bug(peck);
		ei_touch_down(t4, 1201, 801);
		ei_touch_up(t4);
		peck_ei_enable_fatal_bug(peck);
		ei_device_frame(device, peck_ei_now(peck));

		/* valid */
		_unref_(ei_touch) *t5 = ei_device_touch_new(device);
		ei_touch_down(t5, 1101, 1201);
		ei_touch_up(t5);
		ei_device_frame(device, peck_ei_now(peck));

		/* ignored */
		_unref_(ei_touch) *t6 = ei_device_touch_new(device);
		peck_ei_disable_fatal_bug(peck);
		ei_touch_down(t6, 2000, 1201);
		ei_touch_up(t6);
		peck_ei_enable_fatal_bug(peck);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *t1d = peck_eis_next_event(eis, EIS_EVENT_TOUCH_DOWN);
		munit_assert_double_equal(eis_event_touch_get_x(t1d), 301, 2 /* precision */);
		munit_assert_double_equal(eis_event_touch_get_y(t1d), 401, 2 /* precision */);

		_unref_(eis_event) *t1u = peck_eis_next_event(eis, EIS_EVENT_TOUCH_UP);
		munit_assert_ptr_not_null(t1u);

		_unref_(eis_event) *t2d = peck_eis_next_event(eis, EIS_EVENT_TOUCH_DOWN);
		munit_assert_double_equal(eis_event_touch_get_x(t2d), 701, 2 /* precision */);
		munit_assert_double_equal(eis_event_touch_get_y(t2d), 801, 2 /* precision */);

		_unref_(eis_event) *t2u = peck_eis_next_event(eis, EIS_EVENT_TOUCH_UP);
		munit_assert_ptr_not_null(t2u);

		_unref_(eis_event) *t3d = peck_eis_next_event(eis, EIS_EVENT_TOUCH_DOWN);
		munit_assert_double_equal(eis_event_touch_get_x(t3d), 1101, 2 /* precision */);
		munit_assert_double_equal(eis_event_touch_get_y(t3d), 1201, 2 /* precision */);

		_unref_(eis_event) *t3u = peck_eis_next_event(eis, EIS_EVENT_TOUCH_UP);
		munit_assert_ptr_not_null(t3u);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_regions_ref_unref)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);

		/* region never added */
		struct eis_region *r1 = eis_device_new_region(device);
		eis_region_unref(r1);
		eis_device_add(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer_absolute(peck);
		munit_assert_ptr_null(ei_device_get_region(device, 0));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_regions_late_add)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_POINTER_ABSOLUTE);

		eis_device_add(device);

		/* region added after device_add -> ignored */
		_unref_(eis_region) *r1 = eis_device_new_region(device);
		eis_region_set_size(r1, 100, 200);

		/* Bug: eis_region_add: device already (dis)connected */
		with_nonfatal_eis_bug(peck) eis_region_add(r1);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer_absolute(peck);
		munit_assert_ptr_null(ei_device_get_region(device, 0));
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_pointer_abs)
{
	_unref_(peck) *peck = peck_new();
	struct ei_device *device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		device = peck_ei_get_default_pointer_absolute(peck);

		for (int i = 0; i < 10; i++) {
			ei_device_pointer_motion_absolute(device, 1 * i, 2 + i);
			ei_device_frame(device, peck_ei_now(peck));
		}
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		for (int i = 0; i < 10; i++) {
			_unref_(eis_event) *e =
				peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION_ABSOLUTE);
			munit_assert_double_equal(eis_event_pointer_get_absolute_x(e),
						  1.0 * i,
						  2 /* precision */);
			munit_assert_double_equal(eis_event_pointer_get_absolute_y(e),
						  2.0 + i,
						  2 /* precision */);
		}
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		/* We know our default device has one region */
		struct ei_region *r = ei_device_get_region(device, 0);
		uint32_t maxx = ei_region_get_x(r) + ei_region_get_width(r);
		uint32_t maxy = ei_region_get_y(r) + ei_region_get_height(r);

		/* outside of pointer range, expect to be discarded */
		ei_device_pointer_motion_absolute(device, maxx + 1, maxy / 2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_pointer_motion_absolute(device, maxx / 2, maxy + 1);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		peck_assert_no_eis_events(eis);

		/* Don't auto-handle the DEVICE_CLOSED event */
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
		peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	}

	with_client(peck) {
		ei_device_close(device);
		/* absmotion after remove must not trigger an event */
		with_nonfatal_ei_bug(peck) ei_device_pointer_motion_absolute(device, 100, 200);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *stop =
			peck_eis_next_event(eis, EIS_EVENT_DEVICE_STOP_EMULATING);
		_unref_(eis_event) *closed = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_scroll)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_scroll_delta(device, 1.1, 2.2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_discrete(device, 3, 4);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *first = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);
		munit_assert_double_equal(eis_event_scroll_get_dx(first), 1.1, 2 /* precision */);
		munit_assert_double_equal(eis_event_scroll_get_dy(first), 2.2, 2 /* precision */);

		_unref_(eis_event) *second = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DISCRETE);
		munit_assert_int(eis_event_scroll_get_discrete_dx(second), ==, 3);
		munit_assert_int(eis_event_scroll_get_discrete_dy(second), ==, 4);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_scroll_stop)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_scroll_delta(device, 1.1, 2.2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_stop(device, true, false);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_stop(device, false, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* This should not generate an event */
		ei_device_scroll_stop(device, true, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* But scrolling again will re-enable stopping */
		ei_device_scroll_delta(device, 3.3, 4.4);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_stop(device, true, true);
		ei_device_frame(device, peck_ei_now(peck));

		ei_device_scroll_delta(device, 3.3, 4.4);
		/* This one is a client bug and shouldn't trigger an event */
		ei_device_scroll_stop(device, false, false);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *scroll = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		_unref_(eis_event) *first = peck_eis_next_event(eis, EIS_EVENT_SCROLL_STOP);
		munit_assert(eis_event_scroll_get_stop_x(first));
		munit_assert(!eis_event_scroll_get_stop_y(first));

		_unref_(eis_event) *second = peck_eis_next_event(eis, EIS_EVENT_SCROLL_STOP);
		munit_assert(!eis_event_scroll_get_stop_x(second));
		munit_assert(eis_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */

		_unref_(eis_event) *again = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		_unref_(eis_event) *fourth = peck_eis_next_event(eis, EIS_EVENT_SCROLL_STOP);
		munit_assert(eis_event_scroll_get_stop_x(fourth));
		munit_assert(eis_event_scroll_get_stop_y(fourth));

		_unref_(eis_event) *again_again = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_scroll_cancel)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_scroll_delta(device, 1.1, 2.2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_cancel(device, true, false);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_cancel(device, false, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* This should not generate an event */
		ei_device_scroll_cancel(device, true, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* But scrolling again will re-enable stopping */
		ei_device_scroll_delta(device, 3.3, 4.4);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_cancel(device, true, true);
		ei_device_frame(device, peck_ei_now(peck));

		ei_device_scroll_delta(device, 3.3, 4.4);
		/* This one is a client bug and shouldn't trigger an event */
		ei_device_scroll_cancel(device, false, false);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *scroll = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		_unref_(eis_event) *first = peck_eis_next_event(eis, EIS_EVENT_SCROLL_CANCEL);
		munit_assert(eis_event_scroll_get_stop_x(first));
		munit_assert(!eis_event_scroll_get_stop_y(first));

		_unref_(eis_event) *second = peck_eis_next_event(eis, EIS_EVENT_SCROLL_CANCEL);
		munit_assert(!eis_event_scroll_get_stop_x(second));
		munit_assert(eis_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */

		_unref_(eis_event) *again = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		_unref_(eis_event) *fourth = peck_eis_next_event(eis, EIS_EVENT_SCROLL_CANCEL);
		munit_assert(eis_event_scroll_get_stop_x(fourth));
		munit_assert(eis_event_scroll_get_stop_y(fourth));

		_unref_(eis_event) *again_again = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_scroll_stop_cancel)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	/* cancel after stop is fine, stop after cancel is ignored */
	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_pointer(peck);
		ei_device_scroll_delta(device, 1.1, 2.2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_stop(device, true, false);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_cancel(device, true, false);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_scroll_cancel(device, false, true);
		ei_device_frame(device, peck_ei_now(peck));

		/* This should not generate an event */
		ei_device_scroll_stop(device, true, true);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *scroll = peck_eis_next_event(eis, EIS_EVENT_SCROLL_DELTA);

		_unref_(eis_event) *stop = peck_eis_next_event(eis, EIS_EVENT_SCROLL_STOP);
		munit_assert(eis_event_scroll_get_stop_x(stop));
		munit_assert(!eis_event_scroll_get_stop_y(stop));

		_unref_(eis_event) *first = peck_eis_next_event(eis, EIS_EVENT_SCROLL_CANCEL);
		munit_assert(eis_event_scroll_get_stop_x(first));
		munit_assert(!eis_event_scroll_get_stop_y(first));

		_unref_(eis_event) *second = peck_eis_next_event(eis, EIS_EVENT_SCROLL_CANCEL);
		munit_assert(!eis_event_scroll_get_stop_x(second));
		munit_assert(eis_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_touch)
{
	_unref_(peck) *peck = peck_new();
	struct ei_device *device = NULL;
	uint32_t maxx = 0, maxy = 0;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		device = peck_ei_get_default_touch(peck);
		/* We know our default device has one region */

		struct ei_region *r = ei_device_get_region(device, 0);
		maxx = ei_region_get_x(r) + ei_region_get_width(r);
		maxy = ei_region_get_y(r) + ei_region_get_height(r);

		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 1, 2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t, 200, 500);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_up(t);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 1, 2);
		uint32_t tid = eis_event_touch_get_id(down);

		_unref_(eis_event) *motion = peck_eis_touch_motion(eis, 200, 500);
		munit_assert_uint32(eis_event_touch_get_id(motion), ==, tid);

		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		munit_assert_uint32(eis_event_touch_get_id(up), ==, tid);

		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		/* outside clip range, expect touch to be dropped */
		with_nonfatal_ei_bug(peck)
		{
			ei_touch_down(t, maxx + 1, maxy / 2);
			ei_device_frame(device, peck_ei_now(peck));
			/* ignored because the touch down was out of range */
			ei_touch_motion(t, maxx + 1, maxy / 3);
			ei_device_frame(device, peck_ei_now(peck));
			/* ignored because the touch down was out of range */
			ei_touch_up(t);
		}
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		/* outside clip range, expect touch to be dropped */
		with_nonfatal_ei_bug(peck)
		{
			ei_touch_down(t, maxx / 2, maxy + 1);
			ei_device_frame(device, peck_ei_now(peck));
			/* ignored because the touch down was out of range */
			ei_touch_motion(t, maxx / 3, maxy + 1);
			ei_device_frame(device, peck_ei_now(peck));
			/* ignored because the touch down was out of range */
			ei_touch_up(t);
		}
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		/* outside allowed range, generates a touch up */
		with_nonfatal_ei_bug(peck) ei_touch_motion(t, maxx + 1, 200);
		ei_device_frame(device, peck_ei_now(peck));
		/* touch is already considered up */
		with_nonfatal_ei_bug(peck) ei_touch_up(t);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 200);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 100);
		ei_device_frame(device, peck_ei_now(peck));
		/* client forgets to touch up, touch_unref takes care of it */
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 100);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		/* touch only allocated, not actually set down */
		_unref_(ei_touch) *t1 = ei_device_touch_new(device);

		/* touch never set down */
		_unref_(ei_touch) *t2 = ei_device_touch_new(device);
		with_nonfatal_ei_bug(peck) ei_touch_up(t2);
		ei_device_frame(device, peck_ei_now(peck));

		/* touch never set down */
		_unref_(ei_touch) *t3 = ei_device_touch_new(device);
		with_nonfatal_ei_bug(peck) ei_touch_motion(t3, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_up(t3);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);
	with_server(peck) {
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		/* touch re-used */
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_up(t);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_down(t, 200, 300);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_motion(t, 300, 400);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_up(t);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 200);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		/* double-down, double-up */
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_down(t, 200, 300); /* ignored */
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t, 300, 400);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_up(t);
		ei_device_frame(device, peck_ei_now(peck));
		with_nonfatal_ei_bug(peck) ei_touch_up(t); /* ignored */
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 200);
		_unref_(eis_event) *motion = peck_eis_touch_motion(eis, 300, 400);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_touch_cancel)
{
	_unref_(peck) *peck = peck_new();
	struct ei_device *device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		device = peck_ei_get_default_touch(peck);
		/* We know our default device has one region */
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 1, 2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t, 200, 500);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_cancel(t);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 1, 2);
		uint32_t tid = eis_event_touch_get_id(down);

		_unref_(eis_event) *motion = peck_eis_touch_motion(eis, 200, 500);
		munit_assert_uint32(eis_event_touch_get_id(motion), ==, tid);

		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		munit_assert_uint32(eis_event_touch_get_id(up), ==, tid);
		munit_assert_true(eis_event_touch_get_is_cancel(up));

		peck_assert_no_eis_events(eis);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		/* up + cancel, latter is ignored */
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t, 300, 400);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_up(t);
		with_nonfatal_ei_bug(peck) ei_touch_cancel(t); /* ignored */
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 200);
		_unref_(eis_event) *motion = peck_eis_touch_motion(eis, 300, 400);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		munit_assert_false(eis_event_touch_get_is_cancel(up));
		peck_assert_no_eis_events(eis);
	}

	with_client(peck) {
		/* cancel + up, latter is ignored */
		_unref_(ei_touch) *t = ei_device_touch_new(device);
		ei_touch_down(t, 100, 200);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t, 300, 400);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_cancel(t);
		with_nonfatal_ei_bug(peck) ei_touch_up(t); /* ignored */
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down = peck_eis_touch_down(eis, 100, 200);
		_unref_(eis_event) *motion = peck_eis_touch_motion(eis, 300, 400);
		_unref_(eis_event) *up = peck_eis_touch_up(eis);
		munit_assert_true(eis_event_touch_get_is_cancel(up));
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_multitouch)
{
	_unref_(peck) *peck = peck_new();
	struct ei_device *device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		device = peck_ei_get_default_touch(peck);
		_unref_(ei_touch) *t1 = ei_device_touch_new(device);
		_unref_(ei_touch) *t2 = ei_device_touch_new(device);
		ei_touch_down(t1, 1, 2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t1, 2, 3);
		ei_device_frame(device, peck_ei_now(peck));

		ei_touch_down(t2, 3, 4);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_motion(t2, 4, 5);
		ei_device_frame(device, peck_ei_now(peck));

		ei_touch_up(t2);
		ei_touch_up(t1);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down1 = peck_eis_touch_down(eis, 1, 2);
		uint32_t tid1 = eis_event_touch_get_id(down1);

		_unref_(eis_event) *motion1 = peck_eis_touch_motion(eis, 2, 3);
		munit_assert_uint32(eis_event_touch_get_id(motion1), ==, tid1);

		_unref_(eis_event) *down2 = peck_eis_touch_down(eis, 3, 4);
		uint32_t tid2 = eis_event_touch_get_id(down2);
		munit_assert_uint32(tid2, !=, tid1);

		_unref_(eis_event) *motion2 = peck_eis_touch_motion(eis, 4, 5);
		munit_assert_uint32(eis_event_touch_get_id(motion2), ==, tid2);

		_unref_(eis_event) *up2 = peck_eis_touch_up(eis);
		munit_assert_uint32(eis_event_touch_get_id(up2), ==, tid2);

		_unref_(eis_event) *up1 = peck_eis_touch_up(eis);
		munit_assert_uint32(eis_event_touch_get_id(up1), ==, tid1);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_touch_up_after_paused)
{
	_unref_(peck) *peck = peck_new();
	_unref_(ei_device) *device = NULL;
	_unref_(eis_device) *eis_device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	_unref_(ei_touch) *t1 = NULL;
	_unref_(ei_touch) *t2 = NULL;

	with_client(peck) {
		device = ei_device_ref(peck_ei_get_default_touch(peck));
		t1 = ei_device_touch_new(device);
		t2 = ei_device_touch_new(device);
		ei_touch_down(t1, 1, 2);
		ei_touch_down(t2, 3, 4);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down1 = peck_eis_touch_down(eis, 1, 2);
		_unref_(eis_event) *down2 = peck_eis_touch_down(eis, 3, 4);

		peck_assert_no_eis_events(eis); /* drain the frame */

		eis_device = eis_device_ref(eis_event_get_device(down1));
		eis_device_pause(eis_device);
	}

	/* No ei dispatch here */
	peck_dispatch_eis(peck);

	with_client(peck) {
		/* These events will arrive when the device is paused and
		 * are discarded by EIS */
		ei_touch_up(t1);
		ei_touch_up(t2);
		ei_device_frame(device, peck_ei_now(peck));
		ei_touch_unref(t1);
		ei_touch_unref(t2);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *pause = peck_ei_next_event(ei, EI_EVENT_DEVICE_PAUSED);
	}

	with_server(peck) {
		/* touch up and empty frame were discarded */
		peck_assert_no_eis_events(eis);
		eis_device_resume(eis_device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		ei_device_start_emulating(device, 123);

		/* The C API doesn't allow us to set a touch id
		 * so we can't really test for the correct behavior.
		 * All we can do is exercise most of the code by creating
		 * new touches and hope.
		 */
		t1 = ei_device_touch_new(device);
		t2 = ei_device_touch_new(device);
		ei_touch_down(t1, 1, 2);
		ei_touch_down(t2, 3, 4);
		ei_device_frame(device, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *down1 = peck_eis_touch_down(eis, 1, 2);
		_unref_(eis_event) *down2 = peck_eis_touch_down(eis, 3, 4);
		peck_assert_no_eis_events(eis); /* drain the frame */
	}

	peck_dispatch_until_stable(peck);

	return MUNIT_OK;
}

#if HAVE_MEMFD_CREATE
MUNIT_TEST(test_ei_keymap_invalid)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);

		const char data[5] = { 1, 2, 3, 4, 5 };
		_unref_(memfile) *fd = memfile_new(data, sizeof(data));

		munit_assert_ptr_null(eis_device_new_keymap(device,
							    EIS_KEYMAP_TYPE_XKB + 1,
							    memfile_get_fd(fd),
							    memfile_get_size(fd)));
		munit_assert_ptr_null(eis_device_new_keymap(device,
							    EIS_KEYMAP_TYPE_XKB - 1,
							    memfile_get_fd(fd),
							    memfile_get_size(fd)));
		munit_assert_ptr_null(eis_device_new_keymap(device,
							    EIS_KEYMAP_TYPE_XKB,
							    -1,
							    memfile_get_size(fd)));
		munit_assert_ptr_null(
			eis_device_new_keymap(device, EIS_KEYMAP_TYPE_XKB, memfile_get_fd(fd), 0));

		/* Valid keymap, valgrind checks only */
		_unref_(eis_keymap) *unused = eis_device_new_keymap(device,
								    EIS_KEYMAP_TYPE_XKB,
								    memfile_get_fd(fd),
								    memfile_get_size(fd));
		munit_assert_ptr_not_null(unused);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_keymap_set)
{
	_unref_(peck) *peck = peck_new();
	const char data[5] = { 1, 2, 3, 4, 5 };
	_unref_(memfile) *fd1 = memfile_new(data, sizeof(data));
	_unref_(eis_keymap) *keymap = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_seat *seat = peck_eis_get_default_seat(peck);
		_unref_(eis_device) *device = eis_seat_new_device(seat);
		eis_device_configure_name(device, __func__);
		eis_device_configure_capability(device, EIS_DEVICE_CAP_KEYBOARD);

		keymap = eis_device_new_keymap(device,
					       EIS_KEYMAP_TYPE_XKB,
					       memfile_get_fd(fd1),
					       memfile_get_size(fd1));
		eis_keymap_add(keymap);
		munit_assert_ptr_equal(eis_device_keyboard_get_keymap(device), keymap);

		/* Not possible to overwrite a keymap on a device once it's set */
		_unref_(memfile) *fd2 = memfile_new(data, sizeof(data));
		_unref_(eis_keymap) *overwrite = eis_device_new_keymap(device,
								       EIS_KEYMAP_TYPE_XKB,
								       memfile_get_fd(fd2),
								       memfile_get_size(fd2));
		with_nonfatal_eis_bug(peck) eis_keymap_add(overwrite);
		munit_assert_ptr_equal(eis_device_keyboard_get_keymap(device), keymap);

		eis_device_add(device);

		/* Still impossible to overwrite after add */
		_unref_(eis_keymap) *ignored = eis_device_new_keymap(device,
								     EIS_KEYMAP_TYPE_XKB,
								     memfile_get_fd(fd2),
								     memfile_get_size(fd2));
		with_nonfatal_eis_bug(peck) eis_keymap_add(ignored);
		munit_assert_ptr_equal(eis_device_keyboard_get_keymap(device), keymap);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_DEVICE_ADDED);
		struct ei_device *ei_device = ei_event_get_device(event);
		struct ei_keymap *ei_keymap = ei_device_keyboard_get_keymap(ei_device);

		int fd = ei_keymap_get_fd(ei_keymap);
		munit_assert_int(fd, !=, -1);
		munit_assert_uint(ei_keymap_get_size(ei_keymap), ==, memfile_get_size(fd1));
		munit_assert_uint(ei_keymap_get_type(ei_keymap), ==, EI_KEYMAP_TYPE_XKB);

		_unref_(memmap) *keymap =
			memmap_new(ei_keymap_get_fd(ei_keymap), ei_keymap_get_size(ei_keymap));
		char *buf = memmap_get_data(keymap);
		munit_assert_true(memcmp(buf, data, memmap_get_size(keymap)) == 0);
		ei_device_close(ei_device);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *event = peck_eis_next_event(eis, EIS_EVENT_DEVICE_CLOSED);
		struct eis_device *d = eis_event_get_device(event);

		/* Rejecting a device does not unset the keymap because
		 * you're not supposed to do anything with the device anyway */
		struct eis_keymap *km = eis_device_keyboard_get_keymap(d);
		munit_assert_ptr_equal(keymap, km);
	}

	return MUNIT_OK;
}
#endif

MUNIT_TEST(test_ei_keyboard_modifiers)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_device *kbd = peck_eis_get_default_keyboard(peck);
		eis_device_keyboard_send_xkb_modifiers(kbd, 0x1, 0x2, 0x4, 0x8);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *event = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_MODIFIERS);

		uint32_t depressed, locked, latched, group;
		depressed = ei_event_keyboard_get_xkb_mods_depressed(event);
		latched = ei_event_keyboard_get_xkb_mods_latched(event);
		locked = ei_event_keyboard_get_xkb_mods_locked(event);
		group = ei_event_keyboard_get_xkb_group(event);

		munit_assert_uint(depressed, ==, 0x1);
		munit_assert_uint(latched, ==, 0x2);
		munit_assert_uint(locked, ==, 0x4);
		munit_assert_uint(group, ==, 0x8);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_frame_timestamp)
{
	_unref_(peck) *peck = peck_new();
	uint64_t ts1 = 0, ts2 = 0;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		ts1 = peck_ei_now(peck);
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(device, KEY_Q, true);
		ei_device_frame(device, ts1);

		ts2 = peck_ei_now(peck);
		ei_device_keyboard_key(device, KEY_Q, false);
		ei_device_frame(device, ts2);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *kbd1 = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame1 = peck_eis_next_event(eis, EIS_EVENT_FRAME);
		_unref_(eis_event) *kbd2 = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame2 = peck_eis_next_event(eis, EIS_EVENT_FRAME);

		uint64_t timestamp = eis_event_get_time(frame1);
		munit_assert_uint64(timestamp, ==, ts1);
		munit_assert_uint64(timestamp, ==, eis_event_get_time(kbd1));

		timestamp = eis_event_get_time(frame2);
		munit_assert_uint64(timestamp, ==, ts2);
		munit_assert_uint64(timestamp, ==, eis_event_get_time(kbd2));

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_no_empty_frames)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		ei_device_frame(device, peck_ei_now(peck)); /* Expect to be filtered */
		ei_device_keyboard_key(device, KEY_Q, true);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_frame(device, peck_ei_now(peck)); /* Expect to be filtered */
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *kbd = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame = peck_eis_next_event(eis, EIS_EVENT_FRAME);
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_buffered_frame)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *kbd = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(kbd, KEY_Q, true);

		struct ei_device *pointer = peck_ei_get_default_pointer(peck);
		ei_device_pointer_motion(pointer, 1.0, 2.0);
	}

	peck_dispatch_until_stable(peck);

	/* No event visible yet, frame hasn't been sent */
	with_server(peck) {
		peck_assert_no_eis_events(eis);
	}

	/* Flush in inverse order to original events */
	with_client(peck) {
		struct ei_device *pointer = peck_ei_get_default_pointer(peck);
		ei_device_frame(pointer, peck_ei_now(peck));

		struct ei_device *keyboard = peck_ei_get_default_keyboard(peck);
		ei_device_frame(keyboard, peck_ei_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *rel = peck_eis_next_event(eis, EIS_EVENT_POINTER_MOTION);
		_unref_(eis_event) *frame1 = peck_eis_next_event(eis, EIS_EVENT_FRAME);

		_unref_(eis_event) *kbd = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame2 = peck_eis_next_event(eis, EIS_EVENT_FRAME);

		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_flush_frame)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(device, KEY_Q, true);
		/* Missing call to ei_device_frame() */
		with_nonfatal_ei_bug(peck) ei_device_stop_emulating(device);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_event) *kbd = peck_eis_next_event(eis, EIS_EVENT_KEYBOARD_KEY);
		_unref_(eis_event) *frame = peck_eis_next_event(eis, EIS_EVENT_FRAME);
		_unref_(eis_event) *stop =
			peck_eis_next_event(eis, EIS_EVENT_DEVICE_STOP_EMULATING);
		peck_assert_no_eis_events(eis);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_ei_device_remove_no_stop_emulating_event)
{
	_unref_(peck) *peck = peck_new();

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		struct ei_device *device = peck_ei_get_default_keyboard(peck);
		ei_device_keyboard_key(device, KEY_Q, true);
		ei_device_frame(device, peck_ei_now(peck));
		ei_device_keyboard_key(device, KEY_Q, false);
		ei_device_frame(device, peck_ei_now(peck));
	}
	peck_dispatch_until_stable(peck);

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_keyboard(peck);
		eis_device_remove(device);
	}
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *removed = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_passive_ei_device_start_stop_emulating)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);

	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);

	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
		eis_device_stop_emulating(device);
	}
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_passive_ei_device_stop_emulating_when_removing)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_DEFAULT_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_CLIENT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_BIND_SEAT);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);

	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTOSEAT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_ADDED_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_RESUMED);

	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
		eis_device_remove(device);
	}
	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
		_unref_(ei_event) *close = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
	}

	return MUNIT_OK;
}

/* Same as test_ei_device_button_button() but for a passive context */
MUNIT_TEST(test_passive_ei_device_button_button)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_button_button(device, BTN_LEFT, true);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_button_button(device, BTN_RIGHT, true);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_button_button(device, BTN_RIGHT, false);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_button_button(device, BTN_LEFT, false);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *ld = peck_ei_next_event(ei, EI_EVENT_BUTTON_BUTTON);
		munit_assert_int(ei_event_button_get_button(ld), ==, BTN_LEFT);
		munit_assert_true(ei_event_button_get_is_press(ld));

		_unref_(ei_event) *rd = peck_ei_next_event(ei, EI_EVENT_BUTTON_BUTTON);
		munit_assert_int(ei_event_button_get_button(rd), ==, BTN_RIGHT);
		munit_assert_true(ei_event_button_get_is_press(rd));

		_unref_(ei_event) *ru = peck_ei_next_event(ei, EI_EVENT_BUTTON_BUTTON);
		munit_assert_int(ei_event_button_get_button(ru), ==, BTN_RIGHT);
		munit_assert_false(ei_event_button_get_is_press(ru));

		_unref_(ei_event) *lu = peck_ei_next_event(ei, EI_EVENT_BUTTON_BUTTON);
		munit_assert_int(ei_event_button_get_button(lu), ==, BTN_LEFT);
		munit_assert_false(ei_event_button_get_is_press(lu));
	}

	return MUNIT_OK;
}

/* Same as test_passive_ei_device_pointer_rel() but for a passive context */
MUNIT_TEST(test_passive_ei_device_keyboard_key)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_keyboard(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_keyboard(peck);
		eis_device_keyboard_key(device, KEY_Q, true);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_keyboard_key(device, KEY_Q, false);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *press = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_KEY);
		munit_assert_int(ei_event_keyboard_get_key(press), ==, KEY_Q);
		munit_assert_true(ei_event_keyboard_get_key_is_press(press));

		_unref_(ei_event) *release = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_KEY);
		munit_assert_int(ei_event_keyboard_get_key(release), ==, KEY_Q);
		munit_assert_false(ei_event_keyboard_get_key_is_press(release));
	}

	return MUNIT_OK;
}

/* Same as test_ei_device_pointer_rel() but for a passive context */
MUNIT_TEST(test_passive_ei_device_pointer_rel)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 1234;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_pointer_motion(device, 1, 2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_pointer_motion(device, 0.3, 1.4);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_pointer_motion(device, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_POINTER_MOTION);
		munit_assert_double_equal(ei_event_pointer_get_dx(first), 1.0, 2 /* precision */);
		munit_assert_double_equal(ei_event_pointer_get_dy(first), 2.0, 2 /* precision */);

		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_POINTER_MOTION);
		munit_assert_double_equal(ei_event_pointer_get_dx(second), 0.3, 2 /* precision */);
		munit_assert_double_equal(ei_event_pointer_get_dy(second), 1.4, 2 /* precision */);

		_unref_(ei_event) *third = peck_ei_next_event(ei, EI_EVENT_POINTER_MOTION);
		munit_assert_double_equal(ei_event_pointer_get_dx(third), 100, 2 /* precision */);
		munit_assert_double_equal(ei_event_pointer_get_dy(third), 200, 2 /* precision */);
	}

	return MUNIT_OK;
}

/* Same as test_ei_device_pointer_abs() but for a passive context */
MUNIT_TEST(test_passive_ei_device_pointer_abs)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);
	struct eis_device *device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER_ABSOLUTE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer_absolute(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		device = peck_eis_get_default_pointer_absolute(peck);

		for (int i = 0; i < 10; i++) {
			eis_device_pointer_motion_absolute(device, 1 * i, 2 + i);
			eis_device_frame(device, peck_eis_now(peck));
		}
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		for (int i = 0; i < 10; i++) {
			_unref_(ei_event) *e =
				peck_ei_next_event(ei, EI_EVENT_POINTER_MOTION_ABSOLUTE);
			munit_assert_double_equal(ei_event_pointer_get_absolute_x(e),
						  1.0 * i,
						  2 /* precision */);
			munit_assert_double_equal(ei_event_pointer_get_absolute_y(e),
						  2.0 + i,
						  2 /* precision */);
		}
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		/* We know our default device has one region */
		struct eis_region *r = eis_device_get_region(device, 0);
		uint32_t maxx = eis_region_get_x(r) + eis_region_get_width(r);
		uint32_t maxy = eis_region_get_y(r) + eis_region_get_height(r);

		/* outside of pointer range, expect to be discarded */
		eis_device_pointer_motion_absolute(device, maxx + 1, maxy / 2.0);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_pointer_motion_absolute(device, maxx / 2.0, maxy + 1);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		eis_device_remove(device);
		/* absmotion after remove must not trigger an event */
		eis_device_pointer_motion_absolute(device, 100, 200);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
		_unref_(ei_event) *closed = peck_ei_next_event(ei, EI_EVENT_DEVICE_REMOVED);
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_scroll_delta but for a passive context */
MUNIT_TEST(test_passive_ei_device_scroll_delta)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_scroll_delta(device, 1.1, 2.2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_discrete(device, 3, 4);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);
		munit_assert_double_equal(ei_event_scroll_get_dx(first), 1.1, 2 /* precision */);
		munit_assert_double_equal(ei_event_scroll_get_dy(first), 2.2, 2 /* precision */);

		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_SCROLL_DISCRETE);
		munit_assert_int(ei_event_scroll_get_discrete_dx(second), ==, 3);
		munit_assert_int(ei_event_scroll_get_discrete_dy(second), ==, 4);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_scroll_stop but for a passive context */
MUNIT_TEST(test_passive_ei_device_scroll_stop)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 456;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_scroll_delta(device, 1.1, 2.2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_stop(device, true, false);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_stop(device, false, true);
		eis_device_frame(device, peck_eis_now(peck));

		/* This should not generate an event */
		eis_device_scroll_stop(device, true, true);
		eis_device_frame(device, peck_eis_now(peck));

		/* But scrolling again will re-enable stopping */
		eis_device_scroll_delta(device, 3.3, 4.4);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_stop(device, true, true);
		eis_device_frame(device, peck_eis_now(peck));

		eis_device_scroll_delta(device, 3.3, 4.4);
		/* This one is a client bug and shouldn't trigger an event */
		eis_device_scroll_stop(device, false, false);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *scroll = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_SCROLL_STOP);
		munit_assert(ei_event_scroll_get_stop_x(first));
		munit_assert(!ei_event_scroll_get_stop_y(first));

		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_SCROLL_STOP);
		munit_assert(!ei_event_scroll_get_stop_x(second));
		munit_assert(ei_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */

		_unref_(ei_event) *again = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		_unref_(ei_event) *fourth = peck_ei_next_event(ei, EI_EVENT_SCROLL_STOP);
		munit_assert(ei_event_scroll_get_stop_x(fourth));
		munit_assert(ei_event_scroll_get_stop_y(fourth));

		_unref_(ei_event) *again_again = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_scroll_cancel but for a passive context */
MUNIT_TEST(test_passive_ei_device_scroll_cancel)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 546;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_scroll_delta(device, 1.1, 2.2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_cancel(device, true, false);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_cancel(device, false, true);
		eis_device_frame(device, peck_eis_now(peck));

		/* This should not generate an event */
		eis_device_scroll_cancel(device, true, true);
		eis_device_frame(device, peck_eis_now(peck));

		/* But scrolling again will re-enable stopping */
		eis_device_scroll_delta(device, 3.3, 4.4);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_cancel(device, true, true);
		eis_device_frame(device, peck_eis_now(peck));

		eis_device_scroll_delta(device, 3.3, 4.4);
		/* This one is a client bug and shouldn't trigger an event */
		eis_device_scroll_cancel(device, false, false);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *scroll = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_SCROLL_CANCEL);
		munit_assert(ei_event_scroll_get_stop_x(first));
		munit_assert(!ei_event_scroll_get_stop_y(first));

		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_SCROLL_CANCEL);
		munit_assert(!ei_event_scroll_get_stop_x(second));
		munit_assert(ei_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */

		_unref_(ei_event) *again = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		_unref_(ei_event) *fourth = peck_ei_next_event(ei, EI_EVENT_SCROLL_CANCEL);
		munit_assert(ei_event_scroll_get_stop_x(fourth));
		munit_assert(ei_event_scroll_get_stop_y(fourth));

		_unref_(ei_event) *again_again = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_scroll_stop_cancel but for a passive context */
MUNIT_TEST(test_passive_ei_device_scroll_stop_cancel)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_POINTER);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 456;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	/* cancel after stop is fine, stop after cancel is ignored */
	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_pointer(peck);
		eis_device_scroll_delta(device, 1.1, 2.2);
		eis_device_frame(device, peck_eis_now(peck));
		peck_mark(peck);
		eis_device_scroll_stop(device, true, false);
		peck_mark(peck);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_cancel(device, true, false);
		peck_mark(peck);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_scroll_cancel(device, false, true);
		eis_device_frame(device, peck_eis_now(peck));
		peck_mark(peck);

		/* This should not generate an event */
		eis_device_scroll_stop(device, true, true);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *scroll = peck_ei_next_event(ei, EI_EVENT_SCROLL_DELTA);

		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_SCROLL_STOP);
		munit_assert(ei_event_scroll_get_stop_x(stop));
		munit_assert(!ei_event_scroll_get_stop_y(stop));

		_unref_(ei_event) *first = peck_ei_next_event(ei, EI_EVENT_SCROLL_CANCEL);
		munit_assert(ei_event_scroll_get_stop_x(first));
		munit_assert(!ei_event_scroll_get_stop_y(first));

		_unref_(ei_event) *second = peck_ei_next_event(ei, EI_EVENT_SCROLL_CANCEL);
		munit_assert(!ei_event_scroll_get_stop_x(second));
		munit_assert(ei_event_scroll_get_stop_y(second));

		/* third one doesn't trigger an event */
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_touch but for a passive context */
MUNIT_TEST(test_passive_ei_device_touch)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);
	struct eis_device *device = NULL;
	uint32_t maxx = 0, maxy = 0;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		device = peck_eis_get_default_touch(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		device = peck_eis_get_default_touch(peck);
		/* We know our default device has one region */

		struct eis_region *r = eis_device_get_region(device, 0);
		maxx = eis_region_get_x(r) + eis_region_get_width(r);
		maxy = eis_region_get_y(r) + eis_region_get_height(r);

		eis_device_start_emulating(device, ++sequence);

		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 1, 2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t, 200, 500);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 1, 2);
		uint32_t tid = ei_event_touch_get_id(down);

		_unref_(ei_event) *motion = peck_ei_touch_motion(ei, 200, 500);
		munit_assert_uint32(ei_event_touch_get_id(motion), ==, tid);

		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		munit_assert_uint32(ei_event_touch_get_id(up), ==, tid);
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		/* outside clip range, expect touch to be dropped */
		with_nonfatal_eis_bug(peck) eis_touch_down(t, maxx + 1, maxy / 2);
		eis_device_frame(device, peck_eis_now(peck));
		/* ignored because the touch down was out of range */
		eis_touch_motion(t, maxx + 1, maxy / 3);
		eis_device_frame(device, peck_eis_now(peck));
		/* ignored because the touch down was out of range */
		with_nonfatal_eis_bug(peck) eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		/* outside clip range, expect touch to be dropped */
		with_nonfatal_eis_bug(peck) eis_touch_down(t, maxx / 2, maxy + 1);
		eis_device_frame(device, peck_eis_now(peck));
		/* ignored because the touch down was out of range */
		eis_touch_motion(t, maxx / 3, maxy + 1);
		eis_device_frame(device, peck_eis_now(peck));
		/* ignored because the touch down was out of range */
		with_nonfatal_eis_bug(peck) eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		/* outside allowed range, generates a touch up */
		with_nonfatal_eis_bug(peck) eis_touch_motion(t, maxx + 1, 200);
		eis_device_frame(device, peck_eis_now(peck));
		/* touch is already considered up */
		with_nonfatal_eis_bug(peck) eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 200);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 100);
		eis_device_frame(device, peck_eis_now(peck));
		/* client forgets to touch up, touch_unref takes care of it */
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 100);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		/* touch only allocated, not actually set down */
		struct eis_touch *t1 = eis_device_touch_new(device);

		/* touch never set down */
		_unref_(eis_touch) *t2 = eis_device_touch_new(device);
		with_nonfatal_eis_bug(peck) eis_touch_up(t2);
		eis_device_frame(device, peck_eis_now(peck));

		/* touch never set down */
		_unref_(eis_touch) *t3 = eis_device_touch_new(device);
		with_nonfatal_eis_bug(peck) eis_touch_motion(t3, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_up(t3);
		eis_device_frame(device, peck_eis_now(peck));

		with_nonfatal_eis_bug(peck) eis_touch_unref(t1);
	}

	peck_dispatch_until_stable(peck);
	with_client(peck) {
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		/* touch re-used */
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_down(t, 200, 300);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_motion(t, 300, 400);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 200);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		/* double-down, double-up */
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_down(t, 200, 300); /* ignored */
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t, 300, 400);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_up(t); /* ignored */
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 200);
		_unref_(ei_event) *motion = peck_ei_touch_motion(ei, 300, 400);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_touch_cancel but for a passive context */
MUNIT_TEST(test_passive_ei_device_touch_cancel)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);
	struct eis_device *device = NULL;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 123;

	with_server(peck) {
		device = peck_eis_get_default_touch(peck);
		eis_device_start_emulating(device, sequence);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
	}

	with_server(peck) {
		device = peck_eis_get_default_touch(peck);

		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 1, 2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t, 200, 500);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_cancel(t);
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 1, 2);
		uint32_t tid = ei_event_touch_get_id(down);

		_unref_(ei_event) *motion = peck_ei_touch_motion(ei, 200, 500);
		munit_assert_uint32(ei_event_touch_get_id(motion), ==, tid);

		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		munit_assert_uint32(ei_event_touch_get_id(up), ==, tid);
		munit_assert_true(ei_event_touch_get_is_cancel(up));
		peck_assert_no_ei_events(ei);
	}

	peck_dispatch_until_stable(peck);

	with_server(peck) {
		/* up + cancel, latter is ignored */
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t, 300, 400);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_up(t);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_cancel(t); /* ignored */
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 200);
		_unref_(ei_event) *motion = peck_ei_touch_motion(ei, 300, 400);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		munit_assert_false(ei_event_touch_get_is_cancel(up));
		peck_assert_no_ei_events(ei);
	}

	with_server(peck) {
		/* cancel + up, latter is ignored */
		_unref_(eis_touch) *t = eis_device_touch_new(device);
		eis_touch_down(t, 100, 200);
		eis_device_frame(device, peck_eis_now(peck));
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t, 300, 400);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_cancel(t);
		eis_device_frame(device, peck_eis_now(peck));
		with_nonfatal_eis_bug(peck) eis_touch_up(t); /* ignored */
		eis_device_frame(device, peck_eis_now(peck));
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *down = peck_ei_touch_down(ei, 100, 200);
		_unref_(ei_event) *motion = peck_ei_touch_motion(ei, 300, 400);
		_unref_(ei_event) *up = peck_ei_touch_up(ei);
		munit_assert_true(ei_event_touch_get_is_cancel(up));
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

/* same as test_ei_device_multitouch but for a passive context */
MUNIT_TEST(test_passive_ei_device_multitouch)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_TOUCH);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	peck_dispatch_until_stable(peck);

	uint32_t sequence = 345;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_touch(peck);
		_unref_(eis_touch) *t1 = eis_device_touch_new(device);
		_unref_(eis_touch) *t2 = eis_device_touch_new(device);
		eis_device_start_emulating(device, sequence);
		eis_touch_down(t1, 1, 2);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t1, 2, 3);
		eis_device_frame(device, peck_eis_now(peck));

		eis_touch_down(t2, 3, 4);
		eis_device_frame(device, peck_eis_now(peck));
		eis_touch_motion(t2, 4, 5);
		eis_device_frame(device, peck_eis_now(peck));

		eis_touch_up(t2);
		eis_touch_up(t1);
		eis_device_frame(device, peck_eis_now(peck));

		eis_device_stop_emulating(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);

		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);

		_unref_(ei_event) *down1 = peck_ei_touch_down(ei, 1, 2);
		uint32_t tid1 = ei_event_touch_get_id(down1);

		_unref_(ei_event) *motion1 = peck_ei_touch_motion(ei, 2, 3);
		munit_assert_uint32(ei_event_touch_get_id(motion1), ==, tid1);

		_unref_(ei_event) *down2 = peck_ei_touch_down(ei, 3, 4);
		uint32_t tid2 = ei_event_touch_get_id(down2);
		munit_assert_uint32(tid2, !=, tid1);

		_unref_(ei_event) *motion2 = peck_ei_touch_motion(ei, 4, 5);
		munit_assert_uint32(ei_event_touch_get_id(motion2), ==, tid2);

		_unref_(ei_event) *up2 = peck_ei_touch_up(ei);
		munit_assert_uint32(ei_event_touch_get_id(up2), ==, tid2);

		_unref_(ei_event) *up1 = peck_ei_touch_up(ei);
		munit_assert_uint32(ei_event_touch_get_id(up1), ==, tid1);

		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_passive_ei_frame_timestamp)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);
	uint64_t ts1 = 0, ts2 = 0;

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 345;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_keyboard(peck);
		eis_device_start_emulating(device, sequence);

		ts1 = peck_eis_now(peck);
		eis_device_keyboard_key(device, KEY_Q, true);
		eis_device_frame(device, ts1);

		ts2 = peck_eis_now(peck);
		eis_device_keyboard_key(device, KEY_Q, false);
		eis_device_frame(device, ts2);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
		_unref_(ei_event) *kbd1 = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_KEY);
		_unref_(ei_event) *frame1 = peck_ei_next_event(ei, EI_EVENT_FRAME);
		_unref_(ei_event) *kbd2 = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_KEY);
		_unref_(ei_event) *frame2 = peck_ei_next_event(ei, EI_EVENT_FRAME);

		uint64_t timestamp = ei_event_get_time(frame1);
		munit_assert_uint64(timestamp, ==, ts1);
		munit_assert_uint64(timestamp, ==, ei_event_get_time(kbd1));

		timestamp = ei_event_get_time(frame2);
		munit_assert_uint64(timestamp, ==, ts2);
		munit_assert_uint64(timestamp, ==, ei_event_get_time(kbd2));

		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}

MUNIT_TEST(test_passive_ei_flush_frame)
{
	_unref_(peck) *peck = peck_new_context("mode", PECK_EI_RECEIVER);

	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_NONE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_HANDLE_SYNC);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ACCEPT_ALL);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_RESUME_DEVICE);
	peck_enable_eis_behavior(peck, PECK_EIS_BEHAVIOR_ADD_KEYBOARD);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_NONE);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_SYNC);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_HANDLE_CONNECT);
	peck_enable_ei_behavior(peck, PECK_EI_BEHAVIOR_AUTODEVICES);
	peck_dispatch_until_stable(peck);

	uint32_t sequence = 678;

	with_server(peck) {
		struct eis_device *device = peck_eis_get_default_keyboard(peck);
		eis_device_start_emulating(device, sequence);
		eis_device_keyboard_key(device, KEY_Q, true);
		/* Missing call to ei_device_frame() */
		with_nonfatal_eis_bug(peck) eis_device_stop_emulating(device);
	}

	peck_dispatch_until_stable(peck);

	with_client(peck) {
		_unref_(ei_event) *start = peck_ei_next_event(ei, EI_EVENT_DEVICE_START_EMULATING);
		munit_assert_uint(ei_event_emulating_get_sequence(start), ==, sequence);
		_unref_(ei_event) *kbd = peck_ei_next_event(ei, EI_EVENT_KEYBOARD_KEY);
		_unref_(ei_event) *frame = peck_ei_next_event(ei, EI_EVENT_FRAME);
		_unref_(ei_event) *stop = peck_ei_next_event(ei, EI_EVENT_DEVICE_STOP_EMULATING);
		peck_assert_no_ei_events(ei);
	}

	return MUNIT_OK;
}
