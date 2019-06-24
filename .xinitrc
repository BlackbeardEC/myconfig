#exec mpd &
feh --bg-scale ~/wall.png &

###############
## iw-gaps
#exec i3

###############
## BSPWM
sxhkd &

# moved polybar startup to $HOME/.config/polybar/launch.sh
# as suggested in polybar wiki and added script to bspwmrc
#polybar main -q &
#polybar -r --config=/home/blackbeard/.config/polybar/config.space top -q &
#polybar -r --config=/home/blackbeard/.config/polybar/config.space bottom -q &

###############
## Restore previous pywal colors
exec wal -R &

exec bspwm -c /home/blackbeard/.config/bspwm/bspwmrc

################
## DWM
#make -C /home/blackbeard/suckless/dwm
#exec /home/blackbeard/suckless/dwmstatus/dwmstatus &
#exec /home/blackbeard/suckless/dwm/dwm

