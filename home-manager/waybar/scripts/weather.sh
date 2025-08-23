#!/bin/sh
text="$(curl -s "wttr.in/Easthampton?format=1" | sed 's/ //g')"
tooltip="$(curl -s "wttr.in/Easthampton?0T" |
    sed 's/\\/\\\\/g' |
    sed ':a;N;$!ba;s/\n/\\n/g' |
    sed 's/"/\\"/g')"

if ! grep -q "Unknown location" <<< "$text"; then
    echo "{\"text\": \"$text\", \"tooltip\": \"<tt>$tooltip</tt>\", \"class\": \"weather\"}"
fi

