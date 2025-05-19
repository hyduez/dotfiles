#!/bin/bash

# Define power menu options
options="\n\n󰩈"

# Display Rofi menu and store the selected option
selected_option=$(echo -e "$options" | rofi -dmenu -config ~/.config/rofi/power.rasi)

# Perform actions based on the selected option
case "$selected_option" in
"")
  loginctl poweroff
  ;;
"")
  loginctl reboot
  ;;
"󰩈")
  bspc quit
  ;;
*)
  echo "Dismissed"
  ;;
esac
