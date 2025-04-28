#!/bin/bash

# Terminate instance
killall polybar

# Launch instance
polybar -c ~/.config/polybar/config.ini main &
