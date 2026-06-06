#! /usr/bin/env nix-shell
#! nix-shell -i bash -p playerctl

album_art=$(playerctl metadata mpris:artUrl)

if [[ -z $album_art ]]; then
  # no player, we should die.
  exit
fi
curl -s "${album_art}" --output "/tmp/cover.jpeg"
echo "/tmp/cover.jpeg"
