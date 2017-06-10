#!/bin/sh
DEVICE="Wacom Intuos PT M 2"
STYLUS="$DEVICE Pen stylus"
TOUCH="$DEVICE Finger touch"
PAD="$DEVICE Pad pad"

xsetwacom --set "$STYLUS" MapToOutput "3840x2160+0+0"
xsetwacom --set "$PAD" Button 3 "key +ctl k -ctl"
xsetwacom --set "$PAD" Button 1 "key b"
xsetwacom --set "$PAD" Button 9 "key insert"
xsetwacom --set "$PAD" Button 8 "key x"

