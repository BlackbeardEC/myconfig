#!/bin/sh

# Import the colors
#. "${HOME}/.cache/wal/colors.sh"
# . "${HOME}/.Xcolors"

bg=$(xrdb -query | grep -E "^\*\.background" | cut -d':' -f2 | sed -e 's/^[[:space:]]*//')
fg=$(xrdb -query | grep -E "^\*\.foreground" | cut -d':' -f2 | sed -e 's/^[[:space:]]*//')

#dmenu_run -i -l 10 -nb "$color0" -nf "$color5" -sb "$color3" -sf "$color15"
dmenu_run -i -l 10 -nb "$bg" -nf "$fg" -sb "$fg" -sf "$bg"
