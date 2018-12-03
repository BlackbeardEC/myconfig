#!/bin/bash
#
#
#
#
#

TMP=out.mkv
FILE=$1
DELAY=2
QMAX=10 

if [ $1 ]
then
    echo -n "Recording begins in "
    while [ "$DELAY" -gt 0 ]; do
        echo -n $DELAY".."
        let DELAY=$DELAY-1
        sleep 1
    done
    notify-send "Window is now being recorded.\nStop by pressing SHIFT+Alt+X."
    
    ffmpeg -f x11grab -s "1920x1080" -r 30 -i $DISPLAY -c:v libx264 -preset "ultrafast" -crf 10 -y "$TMP" 
else
    echo 'Usage: ' $0 "OutPutFilename 
    *NOTE: .webm will be appended to filename"
fi

notify-send "Desktop is no longer being recorded.\nVideo is now being converted to webm."

ffmpeg -i "$TMP" -c:v libvpx -qmin 1 -qmax $QMAX -preset "ultrafast" -c:a libvorbis "$FILE".webm
rm -f "$TMP"
