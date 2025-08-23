#!/bin/sh
if [ -f /sys/class/power_supply/macsmc-battery/energy_now ]; then
  powerDraw="󰠰 $(($(cat /sys/class/power_supply/macsmc-battery/power_now) / 1000000))w"
fi

cat <<EOF
{ "text":"$powerDraw", "tooltip":"power Draw $powerDraw"}  
EOF
