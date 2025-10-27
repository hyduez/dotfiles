#!/bin/bash

DISPLAY_NUM=1
BRIGHTNESS_VCP=10
STEP=5
MAX_BRIGHTNESS=100

ACTION=$1

get_current_brightness() {
  /usr/bin/ddcutil getvcp $BRIGHTNESS_VCP --display $DISPLAY_NUM 2>/dev/null | grep -oP 'current value =\s*\K\d+'
}

if ! command -v ddcutil &>/dev/null; then
  exit 1
fi

CURRENT_BRIGHTNESS=$(get_current_brightness)

if ! [[ "$CURRENT_BRIGHTNESS" =~ ^[0-9]+$ ]]; then
  exit 1
fi

case "$ACTION" in
up)
  NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + STEP))
  if [ "$NEW_BRIGHTNESS" -gt "$MAX_BRIGHTNESS" ]; then
    NEW_BRIGHTNESS=$MAX_BRIGHTNESS
  fi
  ;;
down)
  NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - STEP))
  if [ "$NEW_BRIGHTNESS" -lt 0 ]; then
    NEW_BRIGHTNESS=0
  fi
  ;;
*)
  exit 1
  ;;
esac

/usr/bin/ddcutil setvcp $BRIGHTNESS_VCP $NEW_BRIGHTNESS --display $DISPLAY_NUM
