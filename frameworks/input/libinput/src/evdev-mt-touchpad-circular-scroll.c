/*
 * Copyright © 2026 Mikio Braun
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

#include "evdev-mt-touchpad.h"

/* Physical width of the ring zone. A human finger is roughly 10mm wide;
 * 8mm gives a comfortable target without eating the inner pointer area
 * on small pads. */
#define CIRCULAR_SCROLL_RING_WIDTH_MM 8.0

/* Near dead-centre the polar angle is meaningless: atan2 swings by π
 * across a one-pixel crossing of the origin, and small noise on dx or
 * dy produces wild angle deltas. Within this radius of the centre we
 * pause scroll emission and re-baseline on exit. 1.5mm is large enough
 * to absorb the singularity but small enough to be invisible during
 * normal ring use. */
#define CIRCULAR_SCROLL_DEAD_ZONE_RADIUS_MM 1.5

static inline const char *
circular_state_to_str(enum tp_circular_scroll_touch_state state)
{
	switch (state) {
	CASE_RETURN_STRING(CIRCULAR_SCROLL_TOUCH_STATE_NONE);
	CASE_RETURN_STRING(CIRCULAR_SCROLL_TOUCH_STATE_INNER);
	CASE_RETURN_STRING(CIRCULAR_SCROLL_TOUCH_STATE_RING);
	}
	return NULL;
}

/* Is the given point on the outer ring? Uses squared distance to avoid a
 * sqrt on every event. */
static bool
tp_circular_scroll_point_on_ring(const struct tp_dispatch *tp,
				 const struct device_coords *point)
{
	int32_t dx = point->x - tp->scroll.circular.center.x;
	int32_t dy = point->y - tp->scroll.circular.center.y;
	int32_t dist_sq = dx * dx + dy * dy;

	return dist_sq >= tp->scroll.circular.ring_threshold_sq;
}

/* Signed angular delta in (-π, π]. Handles wraparound across ±π. */
static double
circular_scroll_angle_delta(double prev, double curr)
{
	double d = curr - prev;
	if (d > M_PI)
		d -= 2.0 * M_PI;
	else if (d < -M_PI)
		d += 2.0 * M_PI;
	return d;
}

static double
tp_circular_scroll_angle(const struct tp_dispatch *tp,
			 const struct device_coords *point)
{
	double dx = point->x - tp->scroll.circular.center.x;
	double dy = point->y - tp->scroll.circular.center.y;
	return atan2(dy, dx);
}

static void
tp_circular_scroll_reset_touch(struct tp_touch *t)
{
	t->scroll.circular.state = CIRCULAR_SCROLL_TOUCH_STATE_NONE;
	/* NAN signals "no valid baseline angle"; the next frame in
	 * RING state will set a fresh baseline without emitting. */
	t->scroll.circular.prev_angle = NAN;
}

void
tp_circular_scroll_init(struct tp_dispatch *tp, struct evdev_device *device)
{
	if (!evdev_device_has_model_quirk(device, QUIRK_MODEL_CIRCULAR_TOUCHPAD))
		return;

	/* Center in device coordinates (the usable area midpoint). */
	tp->scroll.circular.center.x =
		(device->abs.absinfo_x->maximum + device->abs.absinfo_x->minimum) / 2;
	tp->scroll.circular.center.y =
		(device->abs.absinfo_y->maximum + device->abs.absinfo_y->minimum) / 2;

	/* Convert the 8mm ring width into device units by asking the
	 * evdev helper for a vector from (0,0) to (RING_WIDTH,RING_WIDTH) mm
	 * and taking the magnitude along one axis. */
	struct phys_coords ring_mm = {
		.x = CIRCULAR_SCROLL_RING_WIDTH_MM,
		.y = CIRCULAR_SCROLL_RING_WIDTH_MM,
	};
	struct device_coords ring_offset = evdev_device_mm_to_units(device, &ring_mm);

	int32_t radius_x =
		(device->abs.absinfo_x->maximum - device->abs.absinfo_x->minimum) / 2;
	int32_t radius_y =
		(device->abs.absinfo_y->maximum - device->abs.absinfo_y->minimum) / 2;
	int32_t radius = min(radius_x, radius_y);
	int32_t inner_radius = max(radius - ring_offset.x, radius / 2);

	tp->scroll.circular.ring_threshold_sq = inner_radius * inner_radius;

	/* Reference radius for the "virtual scroll wheel" model: the middle
	 * of the ring zone. The scroll signal we emit is the arc length on a
	 * circle of this radius, not the arc on the finger's actual (varying)
	 * path. Using a fixed reference keeps scroll angle-based: same
	 * angular rotation produces the same scroll regardless of where
	 * within the ring the finger currently sits, preserving the
	 * "rotate tighter near the centre to scroll faster" feel. */
	int32_t ring_ref_radius = (radius + inner_radius) / 2;
	tp->scroll.circular.ring_reference_radius = ring_ref_radius;

	/* Convert the dead-zone radius to device units the same way as
	 * the ring width. The X axis component is taken as the radius;
	 * for square pads the X and Y projections are identical. */
	struct phys_coords dead_mm = {
		.x = CIRCULAR_SCROLL_DEAD_ZONE_RADIUS_MM,
		.y = CIRCULAR_SCROLL_DEAD_ZONE_RADIUS_MM,
	};
	struct device_coords dead_zone = evdev_device_mm_to_units(device, &dead_mm);
	tp->scroll.circular.dead_zone_radius_sq = dead_zone.x * dead_zone.x;

	struct tp_touch *t;
	tp_for_each_touch(tp, t)
		tp_circular_scroll_reset_touch(t);
}

void
tp_remove_circular_scroll(struct tp_dispatch *tp)
{
	/* Nothing to tear down — no timers, no allocations. */
}

void
tp_circular_scroll_handle_state(struct tp_dispatch *tp, usec_t time)
{
	struct tp_touch *t;

	if (tp->scroll.method != LIBINPUT_CONFIG_SCROLL_CIRCULAR)
		return;

	tp_for_each_touch(tp, t) {
		enum tp_circular_scroll_touch_state prev_state;

		if (!t->dirty)
			continue;

		prev_state = t->scroll.circular.state;

		switch (t->state) {
		case TOUCH_NONE:
		case TOUCH_HOVERING:
			break;
		case TOUCH_BEGIN:
			/* Intent lock: whichever zone the touch starts in
			 * is where it stays for its entire lifetime. This
			 * prevents accidental mode-flipping mid-gesture
			 * and lets the inner disc be used as a normal
			 * pointer area even when the finger strays
			 * briefly into the ring. */
			if (tp_circular_scroll_point_on_ring(tp, &t->point)) {
				t->scroll.circular.state =
					CIRCULAR_SCROLL_TOUCH_STATE_RING;
				t->scroll.circular.prev_angle =
					tp_circular_scroll_angle(tp, &t->point);
			} else {
				t->scroll.circular.state =
					CIRCULAR_SCROLL_TOUCH_STATE_INNER;
			}
			break;
		case TOUCH_UPDATE:
			/* State is locked from TOUCH_BEGIN. Do nothing. */
			break;
		case TOUCH_MAYBE_END:
		case TOUCH_END:
			tp_circular_scroll_reset_touch(t);
			break;
		}

		if (prev_state != t->scroll.circular.state)
			evdev_log_debug(
				tp->device,
				"circular-scroll: touch %d %s → %s\n",
				t->index,
				circular_state_to_str(prev_state),
				circular_state_to_str(t->scroll.circular.state));
	}
}

int
tp_circular_scroll_post_events(struct tp_dispatch *tp, usec_t time)
{
	struct tp_touch *t;

	if (tp->scroll.method != LIBINPUT_CONFIG_SCROLL_CIRCULAR)
		return 0;

	tp_for_each_touch(tp, t) {
		double angle, delta;
		int32_t dx, dy, r_sq;
		struct device_float_coords fraw = { 0.0, 0.0 };
		struct normalized_coords normalized;

		if (!t->dirty)
			continue;

		if (t->scroll.circular.state != CIRCULAR_SCROLL_TOUCH_STATE_RING)
			continue;

		if (t->palm.state != PALM_NONE || tp_thumb_ignored(tp, t))
			continue;

		/* If the finger is inside the centre dead zone the polar
		 * angle is unreliable (atan2 swings by π across a one-pixel
		 * crossing of the origin). Pause scroll and invalidate the
		 * baseline so the next frame outside the dead zone re-anchors
		 * without emitting a spike. */
		dx = t->point.x - tp->scroll.circular.center.x;
		dy = t->point.y - tp->scroll.circular.center.y;
		r_sq = dx * dx + dy * dy;
		if (r_sq < tp->scroll.circular.dead_zone_radius_sq) {
			t->scroll.circular.prev_angle = NAN;
			continue;
		}

		angle = tp_circular_scroll_angle(tp, &t->point);

		/* Re-baseline after a dead-zone visit (or touch-down via
		 * reset_touch): record the current angle but don't emit
		 * this frame, so the next frame computes a clean delta. */
		if (isnan(t->scroll.circular.prev_angle)) {
			t->scroll.circular.prev_angle = angle;
			continue;
		}

		delta = circular_scroll_angle_delta(t->scroll.circular.prev_angle,
						    angle);
		t->scroll.circular.prev_angle = angle;

		if (delta == 0.0)
			continue;

		/* Model the ring as a virtual scroll wheel whose axis is the
		 * pad centre and whose rim sits at ring_reference_radius.
		 * The signal we feed downstream is the arc length this frame
		 * traced on that virtual rim, measured in device units. This
		 * is the same "finger travelled N device units" signal that
		 * 2fg scroll produces, so the existing motion-filter pipeline
		 * normalises it by device resolution and emits matching
		 * finger-source axis events — no scaling constant needed
		 * here, and the feel is consistent with 2fg across pad sizes.
		 *
		 * Clockwise rotation (increasing atan2 angle with y growing
		 * downward) maps directly to positive vertical scroll, which
		 * is libinput's "scroll down" convention. */
		fraw.y = delta * tp->scroll.circular.ring_reference_radius;

		normalized = tp_filter_motion_unaccelerated(tp, &fraw, time);

		evdev_notify_axis_finger(tp->device,
					 time,
					 bit(LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL),
					 &normalized);
	}

	/* Return 0: we don't own the whole frame. Pointer motion for
	 * non-ring touches is suppressed upstream via our
	 * tp_circular_scroll_touch_active() hook — same mechanism
	 * edge-scroll uses. */
	return 0;
}

void
tp_circular_scroll_stop_events(struct tp_dispatch *tp, usec_t time)
{
	struct tp_touch *t;
	const struct normalized_coords zero = { 0.0, 0.0 };

	if (tp->scroll.method != LIBINPUT_CONFIG_SCROLL_CIRCULAR)
		return;

	tp_for_each_touch(tp, t) {
		if (t->scroll.circular.state == CIRCULAR_SCROLL_TOUCH_STATE_RING) {
			evdev_notify_axis_finger(
				tp->device,
				time,
				bit(LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL),
				&zero);
		}
		tp_circular_scroll_reset_touch(t);
	}
}

bool
tp_circular_scroll_is_active(const struct tp_dispatch *tp)
{
	struct tp_touch *t;

	tp_for_each_touch(tp, t) {
		switch (t->scroll.circular.state) {
		case CIRCULAR_SCROLL_TOUCH_STATE_RING:
			return true;
		case CIRCULAR_SCROLL_TOUCH_STATE_NONE:
		case CIRCULAR_SCROLL_TOUCH_STATE_INNER:
			break;
		}
	}

	return false;
}

bool
tp_circular_scroll_touch_active(const struct tp_dispatch *tp, const struct tp_touch *t)
{
	if (tp->scroll.method != LIBINPUT_CONFIG_SCROLL_CIRCULAR)
		return true; /* touch is eligible for normal pointer motion */

	/* Touches on the ring are owned by scroll; inner touches are free
	 * to drive pointer motion. */
	switch (t->scroll.circular.state) {
	case CIRCULAR_SCROLL_TOUCH_STATE_RING:
		return false;
	case CIRCULAR_SCROLL_TOUCH_STATE_INNER:
	case CIRCULAR_SCROLL_TOUCH_STATE_NONE:
		return true;
	}
	return true;
}
