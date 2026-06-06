#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

rosewater="#F4DBD6"
flamingo="#F0C6C6"
pink="#F5BDE6"
mauve="#C6A0F6"
red="#ED8796"
maroon="#EE99A0"
peach="#F5A97F"
yellow="#EED49F"
green="#A6DA95"
teal="#8BD5CA"
sky="#91D7E3"
sapphire="#7DC4E4"
blue="#8AADF4"
lavender="#B7BDF8"
text="#CAD3F5"
subtext1="#B8C0E0"
subtext0="#A5ADCB"
overlay2="#939AB7"
overlay1="#8087A2"
overlay0="#6E738D"
surface2="#5B6078"
surface1="#494D64"
surface0="#363A4F"
base="#24273A"
mantle="#1E2030"
crust="#181926"

todoText="$(
  todo list ~ -d --format pango |
    # Convert the color names to catppuccin colors
    sed "s/\"black\"/\"$crust\"/g" |
    sed "s/\"red\"/\"$red\"/g" |
    sed "s/\"green\"/\"$green\"/g" |
    sed "s/\"yellow\"/\"$yellow\"/g" |
    sed "s/\"blue\"/\"$blue\"/g" |
    sed "s/\"magenta\"/\"$peach\"/g" |
    sed "s/\"cyan\"/\"$sky\"/g" |
    sed "s/\"white\"/\"$text\"/g" |
    # This converts newlines to \n, then escapes double-quotes
    sed ':a;N;$!ba;s/\n/\\n/g' | sed 's#"#\\"#g'

)"

echo "{\"text\": \"\\n$todoText\", \"class\": \"todo\"}"
