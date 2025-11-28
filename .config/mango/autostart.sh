#!/bin/bash

set +e

dbus-update-activation-environment display i3sock swaysock wayland_display xdg_current_desktop=mango &

wl-clip-persist --clipboard regular --reconnect-tries 0 &
wl-paste --type text --watch cliphist store &

pipewire &
mako &
swww-daemon --no-cache --format xrgb &
$HOME/.config/mango/scripts/wallpaper.sh &
