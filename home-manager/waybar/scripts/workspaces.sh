#!/bin/sh

# example:
# ▀ ▀▀ ▀▀▀
# █ ███ ██ ██
# ▅▅ ▅▅▅ ▅
#
while true; do
display=""

window_data=$(niri msg --json windows)
workspace_data=$(niri msg --json workspaces)

# The workspace Ids do not corrospond to their indicies.
active_workspace=$(echo $workspace_data | jq '.[] | if .is_focused == true then .id else empty end')
active_workspace_idx=$(echo $workspace_data | jq '.[] | if .is_focused == true then .idx else empty end')

previous_workspace=$(echo $workspace_data | jq ".[] | if .idx == $((active_workspace_idx - 1)) then .id else empty end")
next_workspace=$(echo $workspace_data | jq ".[] | if .idx == $((active_workspace_idx + 1)) then .id else empty end")

if [[ previous_workspace != "" ]]; then
  # Sort all windows by their horizontal position, then filter out everything not on the correct workspace or not at the top of a column. Then return the width
  ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | if (.workspace_id == ${previous_workspace} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) then (.layout | .tile_size | .[0] / 476 | floor) else empty end"))
  display="$display "

  for window in "${ids[@]}"; do
    for _ in $(seq 1 $window); do
      display="$display▀"
    done
    display="$display "
  done
fi
display="$display\n"

if [[ active_workspace != "" ]]; then
  ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | select(.workspace_id == ${active_workspace} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) | .id"))
  display="$display "

  workspace_size=$(echo $window_data | jq "[.[] | select(.workspace_id == ${active_workspace} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) | .layout .window_size .[0]] | add")

  for id in "${ids[@]}"; do
    width=$(echo $window_data | jq ".[] | if .id == $id then (.layout | .tile_size | .[0] / 476 | floor) else empty end")
    column=$(echo $window_data | jq ".[] | if .id == $id then (.layout | .pos_in_scrolling_layout | .[0]) else empty end")
    active=$(echo $window_data | jq ".[] | if .workspace_id == ${active_workspace} and (.layout | .pos_in_scrolling_layout | .[0]) == $column and .is_focused then true else empty end")
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
fi
display="$display\n"

if [[ next_workspace != "" ]]; then
ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | if (.workspace_id == ${next_workspace} and (.layout | .pos_in_scrolling_layout | .[1]) == 1) then (.layout | .tile_size | .[0] / 476 | floor) else empty end"))
display="$display "

for window in "${ids[@]}"; do
  for _ in $(seq 1 $window); do
    display="$display▅"
  done
  display="$display "
done
fi

echo "{\"text\": \"$display\", \"class\": \"workspace\"}"

sleep 0.1

done
