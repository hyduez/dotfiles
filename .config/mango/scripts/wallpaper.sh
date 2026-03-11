#!/bin/bash

wallpapersDir="$HOME/.config/wallpapers"

wallpapers=("$wallpapersDir"/*)

while true; do

  if [ ${#wallpapers[@]} -eq 0 ]; then
    wallpapers=("$wallpapersDir"/*)
  fi

  wallpaperIndex=$((RANDOM % ${#wallpapers[@]}))
  selectedWallpaper="${wallpapers[$wallpaperIndex]}"

  /usr/bin/swww img "$selectedWallpaper"
  unset "wallpapers[$wallpaperIndex]"
  wallpapers=("${wallpapers[@]}")

  sleep 30m
done
