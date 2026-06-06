#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

# Maybe I will have a better idea for this later,
# right now, if you want to specify a location,
# you can stick it in '~/.location', and it will
# use that instead.
if [[ -f ~/.location ]]; then
  location="$(head -n 1 ~/.location)"
else
  location=""
fi


text="$(curl -s "wttr.is/$location?m&format=1" |
    sed 's/  / /g' |
    # Replace Emojis with Nerd Font Characters    
    sed 's/☀️//g' |
    sed 's/☁️//g' |
    sed 's/⛅️//g' |
    sed 's/🌤️//g' |
    sed 's/⛈//g' |
    sed 's/✨//g' |
    sed 's/❄️//g' |
    sed 's/🌑//g' |
    sed 's/🌒//g' |
    sed 's/🌓//g' |
    sed 's/🌔//g' |
    sed 's/🌕//g' |
    sed 's/🌖//g' |
    sed 's/🌗//g' |
    sed 's/🌘//g' |
    sed 's/🌦//g' |
    sed 's/🌧//g' |
    sed 's/🌨//g' |
    sed 's/🌩//g' |
    sed 's/🌫//g')"

tooltip="$(curl -s "wttr.is/$location?0Tm" |
    sed 's/\\/\\\\/g' |
    sed ':a;N;$!ba;s/\n/\\n/g' |
    sed 's/"/\\"/g')"

if [[ $text =~ "ERR" || $text =~ "location not found" ]]; then
    echo "{\"text\": \" ????\", \"tooltip\": \"<tt>Could not fetch the weather.</tt>\", \"class\": \"weather\"}"
else
    echo "{\"text\": \"$text\", \"tooltip\": \"<tt>$tooltip</tt>\", \"class\": \"weather\"}"
fi

