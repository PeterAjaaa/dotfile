#!/bin/sh
# Please change your video name to match yours.
xwinwrap -g 1366x768 -ni -s -nf -b -un -ov -fdt -argb -- mpv --mute=yes --no-audio --no-osc --no-osd-bar --quiet --screen=0 --geometry=1366x768+0+0 -wid %WID --loop 416-stary-cocoon.mp4 --hwdec
