#!/usr/bin/bash

ARG=$1

if [ $ARG ]; then
  if [ $ARG = "region" ]; then
    grim -l 0 -g "$(slurp)" - | wl-copy -t image/png
    exit 1
  fi

  if [ $ARG = "full-copy" ]; then
    grim - | wl-copy -t image/png
    exit 1
  fi

  if [ $ARG = "full" ]; then
    grim $HOME/Pictures/screenshots/$(date +%Y-%m-%d-%H-%M-%S).png
    exit 1
  fi
fi

echo "You must entry a valid option! (region, full, full-copy)"
exit 1
