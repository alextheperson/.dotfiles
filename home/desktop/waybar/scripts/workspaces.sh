#! /usr/bin/env nix-shell
#! nix-shell -i bash -p niri jq

# EXAMPLE OUTPUT:
# ▀ ▀▀ ▀▀▀
# █ ███ ██ ██
# ▅▅ ▅▅▅ ▅

# ============
# |  Config  |
# ============
# The color of the currently focused window
active_window_color="#8AADF4"
# how many pixels are in each char
width_divisor=$((350))

# This is a "continuous" waybar module
while true; do

display=""

window_data=$(niri msg --json windows)
workspace_data=$(niri msg --json workspaces)

# The workspace IDs do not corrospond to their position.
active_workspace=$(echo $workspace_data | jq '.[] | if .is_focused == true then .id else empty end')
active_workspace_idx=$(echo $workspace_data | jq '.[] | if .is_focused == true then .idx else empty end')

# Get the two adjacent workspaces
previous_workspace=$(echo $workspace_data | jq ".[] | if .idx == $((active_workspace_idx - 1)) then .id else empty end") 
next_workspace=$(echo $workspace_data | jq ".[] | if .idx == $((active_workspace_idx + 1)) then .id else empty end")

# Display the top (previous) workspace
if [[ "$previous_workspace" != "" ]]; then
  # Sort all windows by their horizontal position, then select only windows in the correct workspace at the top of their column. Finally, get the widths of the window and divides them by the $width_divisor
  widths=($(echo $window_data | jq "sort_by(.layout.pos_in_scrolling_layout.[0]) | .[] | select(.workspace_id == $previous_workspace and (.layout.pos_in_scrolling_layout.[1]) == 1) | (.layout.tile_size.[0] / $width_divisor | floor)"))
  display="$display "

  for window in "${widths[@]}"; do
    for _ in $(seq 1 $window); do
      display="$display▀"
    done
    display="$display "
  done
fi
display="$display\n"

# Display the middle (focused) workspace
if [[ "$active_workspace" != "" ]]; then
  # Get the ids of all the windows in the workspace, sorted by their horizontal positions
  ids=($(echo $window_data | jq "sort_by(.layout | .pos_in_scrolling_layout | .[0]) | .[] | select(.workspace_id == $active_workspace and (.layout | .pos_in_scrolling_layout | .[1]) == 1) | .id"))
  display="$display "

  for id in "${ids[@]}"; do
    # Get the width of the current window
    width=$(echo $window_data | jq ".[] | select(.id == $id) | .layout.tile_size.[0] / $width_divisor | floor")

    # Determine if the current window is the active window
    is_active=$(echo $window_data | jq ".[] | if .id == $id and .is_focused then true else empty end")

    if [[ "$is_active" == "true" ]]; then
      display="$display<span color=\\\"$active_window_color\\\">"
    fi

    for _ in $(seq 1 $width); do
      display="$display█"
    done

    if [[ "$is_active" == "true" ]]; then
      display="$display</span>"
    fi

    display="$display "
  done
fi
display="$display\n"

# Display the bottom (next) workspace
if [[ "$next_workspace" != "" ]]; then
  # Sort all windows by their horizontal position, then select only windows in the correct workspace at the top of their column. Finally, get the widths of the window and divides them by the $width_divisor
  widths=($(echo $window_data | jq "sort_by(.layout.pos_in_scrolling_layout.[0]) | .[] | select(.workspace_id == $next_workspace and (.layout.pos_in_scrolling_layout.[1]) == 1) | (.layout.tile_size.[0] / $width_divisor | floor)"))
  display="$display "

  for window in "${widths[@]}"; do
    for _ in $(seq 1 $window); do
      display="$display▅"
    done
    display="$display "
  done
fi

echo "{\"text\": \"$display\", \"class\": \"workspace\"}"

sleep 0.1

done
