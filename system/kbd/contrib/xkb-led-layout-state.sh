#!/bin/sh

set -eu

STATE_FILE=${TMPDIR:-/tmp}/xkb-led-layout-state.$(id -u).state

usage() {
	cat <<EOF
Usage:
  xkb-led-layout-state.sh [--bind] [--state-file FILE] LAYOUTS
  xkb-led-layout-state.sh LEFT_BRIGHTNESS RIGHT_BRIGHTNESS LAYOUTS
  xkb-led-layout-state.sh --restore [--state-file FILE]

Arguments:
  LEFT_BRIGHTNESS   path to the brightness file for kbd-shiftllock
  RIGHT_BRIGHTNESS  path to the brightness file for kbd-shiftrlock
  LAYOUTS           comma-separated layout labels, 1 to 4 entries

Examples:
  xkb-led-layout-state.sh us,ru,fr
  xkb-led-layout-state.sh --bind us,ru,fr
  xkb-led-layout-state.sh \\
    /sys/class/leds/enp8s0-0::lan/brightness \\
    /sys/class/leds/enp8s0-1::lan/brightness \\
    us,ru,fr
  xkb-led-layout-state.sh --restore

Without explicit brightness files, the script tries to:
  1. reuse LEDs already bound to kbd-shiftllock/kbd-shiftrlock
  2. otherwise pick the first two LED devices that support both triggers

With --bind, the script stores previous triggers in:
  $STATE_FILE
and rebinds the selected LEDs to:
  kbd-shiftllock
  kbd-shiftrlock
EOF
}

current_trigger() {
	awk '
		{
			for (i = 1; i <= NF; i++) {
				if ($i ~ /^\[/) {
					gsub(/^\[/, "", $i);
					gsub(/\]$/, "", $i);
					print $i;
					exit;
				}
			}
		}
	' "$1/trigger"
}

supports_trigger() {
	grep -q -w "$2" "$1/trigger"
}

read_brightness() {
	value=$(cat "$1")
	case "$value" in
		0) echo 0 ;;
		*) echo 1 ;;
	esac
}

save_binding_state() {
	: > "$STATE_FILE"
	printf '%s %s\n' "$LEFT_LED" "$(current_trigger "$LEFT_LED")" >> "$STATE_FILE"
	printf '%s %s\n' "$RIGHT_LED" "$(current_trigger "$RIGHT_LED")" >> "$STATE_FILE"
}

restore_binding_state() {
	if [ ! -r "$STATE_FILE" ]; then
		echo "State file not found: $STATE_FILE" >&2
		exit 1
	fi

	while read -r led_dir trigger; do
		if [ -z "$led_dir" ] || [ -z "$trigger" ]; then
			echo "Corrupted state file: $STATE_FILE" >&2
			exit 1
		fi
		printf '%s\n' "$trigger" > "$led_dir/trigger"
		echo "restored $(basename "$led_dir") -> $trigger"
	done < "$STATE_FILE"
}

autodetect_leds() {
	LEFT_LED=
	RIGHT_LED=

	for led_dir in /sys/class/leds/*; do
		[ -r "$led_dir/trigger" ] || continue
		case "$(current_trigger "$led_dir")" in
			kbd-shiftllock) LEFT_LED=$led_dir ;;
			kbd-shiftrlock) RIGHT_LED=$led_dir ;;
		esac
	done

	if [ -n "${LEFT_LED:-}" ] && [ -n "${RIGHT_LED:-}" ]; then
		return
	fi

	for led_dir in /sys/class/leds/*; do
		[ -r "$led_dir/trigger" ] || continue
		supports_trigger "$led_dir" kbd-shiftllock || continue
		supports_trigger "$led_dir" kbd-shiftrlock || continue

		if [ -z "${LEFT_LED:-}" ]; then
			LEFT_LED=$led_dir
			continue
		fi

		if [ -z "${RIGHT_LED:-}" ] && [ "$led_dir" != "$LEFT_LED" ]; then
			RIGHT_LED=$led_dir
			break
		fi
	done

	if [ -z "${LEFT_LED:-}" ] || [ -z "${RIGHT_LED:-}" ]; then
		echo "Unable to find two LED devices supporting kbd-shiftllock and kbd-shiftrlock" >&2
		exit 1
	fi
}

parse_layouts() {
	OLD_IFS=$IFS
	IFS=,
	set -- $1
	IFS=$OLD_IFS

	count=$#
	if [ "$count" -lt 1 ] || [ "$count" -gt 4 ]; then
		echo "Expected 1 to 4 layout labels" >&2
		exit 1
	fi

	layout1=$1
	layout2=${2-}
	layout3=${3-}
	layout4=${4-}
}

emit_layout_state() {
	left=$(read_brightness "$LEFT_BRIGHTNESS")
	right=$(read_brightness "$RIGHT_BRIGHTNESS")
	state="${left}${right}"

	layout=
	index=

	case "$count:$state" in
		1:00|1:10|1:01|1:11)
			index=1
			layout=$layout1
			;;
		2:00|2:11)
			index=1
			layout=$layout1
			;;
		2:10|2:01)
			index=2
			layout=$layout2
			;;
		3:00|3:11)
			index=1
			layout=$layout1
			;;
		3:10)
			index=2
			layout=$layout2
			;;
		3:01)
			index=3
			layout=$layout3
			;;
		4:00)
			index=1
			layout=$layout1
			;;
		4:10)
			index=2
			layout=$layout2
			;;
		4:11)
			index=3
			layout=$layout3
			;;
		4:01)
			index=4
			layout=$layout4
			;;
		*)
			echo "Unexpected state: $state" >&2
			exit 1
			;;
	esac

	printf 'left_led=%s right_led=%s state=%s shiftllock=%s shiftrlock=%s layout[%s]=%s\n' \
		"$LEFT_BRIGHTNESS" "$RIGHT_BRIGHTNESS" "$state" "$left" "$right" "$index" "$layout"
}

BIND=0
RESTORE=0

while [ "$#" -gt 0 ]; do
	case "$1" in
		--bind)
			BIND=1
			shift
			;;
		--restore)
			RESTORE=1
			shift
			;;
		--state-file)
			[ "$#" -ge 2 ] || { usage >&2; exit 1; }
			STATE_FILE=$2
			shift 2
			;;
		-h|--help)
			usage
			exit 0
			;;
		--)
			shift
			break
			;;
		-*)
			usage >&2
			exit 1
			;;
		*)
			break
			;;
	esac
done

if [ "$RESTORE" -eq 1 ]; then
	[ "$#" -eq 0 ] || { usage >&2; exit 1; }
	restore_binding_state
	exit 0
fi

case "$#" in
	1)
		LAYOUTS_CSV=$1
		autodetect_leds
		LEFT_BRIGHTNESS=$LEFT_LED/brightness
		RIGHT_BRIGHTNESS=$RIGHT_LED/brightness
		;;
	3)
		LEFT_BRIGHTNESS=$1
		RIGHT_BRIGHTNESS=$2
		LAYOUTS_CSV=$3
		LEFT_LED=$(dirname "$LEFT_BRIGHTNESS")
		RIGHT_LED=$(dirname "$RIGHT_BRIGHTNESS")
		;;
	*)
		usage >&2
		exit 1
		;;
esac

[ -r "$LEFT_BRIGHTNESS" ] || { echo "Unable to read $LEFT_BRIGHTNESS" >&2; exit 1; }
[ -r "$RIGHT_BRIGHTNESS" ] || { echo "Unable to read $RIGHT_BRIGHTNESS" >&2; exit 1; }

parse_layouts "$LAYOUTS_CSV"

if [ "$BIND" -eq 1 ]; then
	save_binding_state
	printf '%s\n' kbd-shiftllock > "$LEFT_LED/trigger"
	printf '%s\n' kbd-shiftrlock > "$RIGHT_LED/trigger"
	echo "bound $(basename "$LEFT_LED") -> kbd-shiftllock"
	echo "bound $(basename "$RIGHT_LED") -> kbd-shiftrlock"
fi

emit_layout_state
