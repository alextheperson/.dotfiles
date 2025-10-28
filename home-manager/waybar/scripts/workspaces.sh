#!/bin/sh

# example:
# ▀ ▀▀ ▀▀▀
# █ ███ ██ ██
# ▅▅ ▅▅▅ ▅
#
while true; do
display=""

window_data=$(niri msg --json windows)
active_workspace=$(niri msg --json workspaces | jq '.[] | if .is_focused == true then .id else empty end')
workspaces=($((active_workspace - 1)) $active_workspace $((active_workspace + 1)))

# Sort all windows by their horizontal position, then filter out everything not on the correct workspace or not at the top of a column. Then return the width
ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | if (.workspace_id == ${workspaces[0]} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) then (.layout | .tile_size | .[0] / 476 | floor) else empty end"))
display="$display "

for window in "${ids[@]}"; do
  for _ in $(seq 1 $window); do
    display="$display▀"
  done
  display="$display "
done
display="$display\n"

ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | if (.workspace_id == ${workspaces[1]} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) then .id else empty end"))
display="$display "
for id in "${ids[@]}"; do
  width=$(echo $window_data | jq ".[] | if .id == $id then (.layout | .tile_size | .[0] / 476 | floor) else empty end")
  column=$(echo $window_data | jq ".[] | if .id == $id then (.layout | .pos_in_scrolling_layout | .[0]) else empty end")
  active=$(echo $window_data | jq ".[] | if .workspace_id == ${workspaces[1]} and (.layout | .pos_in_scrolling_layout | .[0]) == $column and .is_focused then true else empty end")
  if [[ "$active" == "true" ]]; then
    display="$display<span color=\\\"#8AADF4\\\">"
  fi

  for _ in $(seq 1 $width); do
    display="$display█"
  done

  if [[ "$active" == "true" ]]; then
    display="$display</span>"
  fi

  display="$display "
done
display="$display\n"

ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | if (.workspace_id == ${workspaces[2]} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) then (.layout | .tile_size | .[0] / 476 | floor) else empty end"))
display="$display "

for window in "${ids[@]}"; do
  for _ in $(seq 1 $window); do
    display="$display▅"
  done
  display="$display "
done

echo "{\"text\": \"$display\", \"class\": \"workspace\"}"

sleep 0.1

done
