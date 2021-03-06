#!/usr/bin/env bash
# Youtube search handler

readonly optsfile=$XDG_CONFIG_HOME/dmenu/dmenucolors
readonly images="$(mktemp -d /tmp/yt.XXXX)"
readonly requests=25
declare type=video

query() {
  local key input
  [[ $type == "video" ]] && input="$1" || input="${1#*\!pl}"
  read -r key < "/home/lulz/.local/share/youtube/key"

  curl -s "https://www.googleapis.com/youtube/v3/search?q=${input// /+}&type=$type&part=snippet&maxResults=$requests&key=$key"
}

parse() {
  jshon -CQ -e items -a -e snippet -e title -uppe id -e "$type"Id -uppe snippet -e thumbnails -e high -e url -u 
}

buildmenu() {
  local name url i=0

  while {
    read -r name
    read -r blob
    read -r url 
  } do
    curl -s "$url" -o "$images/$i" &
    printf '%s\n' "$blob" > "$images/$name-url"
    printf 'IMG:%q\t%s\n' "$images/$i" "$name"
    ((++i))
  done
}

handle() {
  local selection url
  while read -r selection; do
    read -r url < "$images/$selection-url"
    [[ $url ]] && mpv "ytdl://$url" &
  done
}

[[ "$1" == save ]] && exec "$XDG_DATA_HOME"/youtube/savepl
[[ "$1" == *pl* ]] && type="playlist"

# Grab theming
[[ -s $optsfile ]] && source "$optsfile"

opts+=(-p "Select video" -l 10)

result=$(echo "" | dmenu)

## Main pipeline
query "$result" | parse | buildmenu | dmenu "${opts[@]}" | handle

