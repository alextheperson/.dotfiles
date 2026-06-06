#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
powerDraw="NOBAT"
if [ -f /sys/class/power_supply/macsmc-battery/energy_now ]; then
  powerDraw="$(echo $(($(cat /sys/class/power_supply/macsmc-battery/power_now) / 1000000)) | sed 's/-//' | sed -e :a -e 's/^.\{0,2\}$/0&/;ta')"
fi
if [ -f /sys/class/power_supply/BAT0/energy_now ]; then
  powerDraw="$(echo $(($(cat /sys/class/power_supply/BAT0/power_now) / 1000000)) | sed -e :a -e 's/^.\{1,3\}$/0&/;ta')"
fi

cat <<EOF
{ "text":"${powerDraw}W", "tooltip":"Power Draw: ${powerDraw}W"}  
EOF
