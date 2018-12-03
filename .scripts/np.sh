#!/bin/bash
# a 'now playing' script I call from weechat.

np=$(exec mpc current)

echo "/me is now playing:" $np
