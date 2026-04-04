{ ...
}: (
  let
    launcher = "vicinae toggle";
    terminal = "kitty";
    terminalQuickAccess = "kitten quick-access-terminal";
    locker = "swaylock";
    todoList = "pkill -f \"waybar -c /home/alex/.config/waybar/todo-config.json\" --signal 10";

    toggleApplication = name: "pkill ${name} || kitty --title 'plzfloat ${name}' ${name}";
  in
  {
    programs.niri.settings.binds =
      {

        # Most keybinds can use Shift to move the current window/workspace instead of changing focus.
        # Ctrl and Alt are left to add other variation (like types of screenshots)
        # Ctrl will frequently refer to monitors

        # Mod-Shift-/, which is usually the same as Mod-?,
        # shows a list of important hotkeys.
        "Mod+Shift+Slash" = {
          action.show-hotkey-overlay = [ ];
        };


        # Suggested binds for running programs: terminal, app launcher, screen locker.
        "Mod+apostrophe" = {
          action.spawn-sh = terminal;
          hotkey-overlay.title = "Open Terminal";
        };

        "Mod+grave" = {
          action.spawn-sh = terminalQuickAccess;
          hotkey-overlay.title = "Open QAT";
        };
        "Mod+R" = {
          action.spawn-sh = launcher;
          hotkey-overlay.title = "Application Launcher";
        };
        "Mod+Space" = {
          action.spawn-sh = launcher;
          hotkey-overlay.title = "Application Launcher";
        };
        "Super+Alt+L" = {
          action.spawn-sh = locker;
          hotkey-overlay.title = "Lock the Screen";
        };

        # Example volume keys mappings for PipeWire & WirePlumber.
        # The allow-when-locked=true property makes them work even when the session is locked.
        "XF86AudioRaiseVolume" = {
          action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          allow-when-locked = true;
        };
        "XF86AudioLowerVolume" = {
          action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          allow-when-locked = true;
        };
        "XF86AudioMute" = {
          action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          allow-when-locked = true;
        };
        "XF86AudioMicMute" = {
          action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          allow-when-locked = true;
        };

        "XF86MonBrightnessUp" = {
          action.spawn-sh = "brightnessctl -e4 -n0 set 5%+";
          allow-when-locked = true;
        };

        "XF86MonBrightnessDown" = {
          action.spawn-sh = "brightnessctl -e4 -n0 set 5%-";
          allow-when-locked = true;
        };


        "XF86AudioNext" = {
          action.spawn-sh = "playerctl next";
          allow-when-locked = true;
        };


        "XF86AudioPause" = {
          action.spawn-sh = "playerctl play-pause";
          allow-when-locked = true;
        };
        "XF86AudioPlay" = {
          action.spawn-sh = "playerctl play-pause";
          allow-when-locked = true;
        };
        "XF86AudioPrev" = {
          action.spawn-sh = "playerctl previous";
          allow-when-locked = true;
        };

        "XF86LaunchA" = {
          action.toggle-overview = [ ];
        };
        "XF86Search" = {
          action.spawn-sh = launcher;
        };
        "XF86Sleep" = {
          action.spawn-sh = locker;
        };

        # Open/close the Overview: a zoomed-out view of workspaces and windows.
        # You can also move the mouse into the top-left hot corner,
        # or do a four-finger swipe up on a touchpad.
        "Mod+O" = {
          action.toggle-overview = [ ];
          hotkey-overlay = {
            title = "Toggle Overview";
          };
          repeat = false;
        };

        "Mod+C" = {
          action.close-window = [ ];
          hotkey-overlay = {
            title = "Close Window";
          };
        };

        "Mod+H" = {
          action.focus-column-left-or-last = [ ];
          hotkey-overlay = {
            title = "Focus Column";
          };
        };
        "Mod+J" = {
          action.focus-window-or-workspace-down = [ ];
        };
        "Mod+K" = {
          action.focus-window-or-workspace-up = [ ];
        };
        "Mod+L" = {
          action.focus-column-right-or-first = [ ];
        };

        "Mod+Tab" = {
          action.focus-column-right-or-first = [ ];
        };

        "Mod+Shift+H" = {
          action.move-column-left = [ ];
          hotkey-overlay = {
            title = "Move Column";
          };
        };
        "Mod+Shift+J" = {
          action.move-window-down-or-to-workspace-down = [ ];
        };
        "Mod+Shift+K" = {
          action.move-window-up-or-to-workspace-up = [ ];
        };
        "Mod+Shift+L" = {
          action.move-column-right = [ ];
        };

        "Mod+Comma" = {
          action.focus-column-first = [ ];
          hotkey-overlay = {
            title = "Focus the First Columnn";
          };
        };
        "Mod+Period" = {
          action.focus-column-last = [ ];
          hotkey-overlay = {
            title = "Focus the Last Column";
          };
        };
        "Mod+Shift+Comma" = {
          action.move-column-to-first = [ ];
          hotkey-overlay = {
            title = "Move Column to Beginning";
          };
        };
        "Mod+Shift+Period" = {
          action.move-column-to-last = [ ];
          hotkey-overlay = {
            title = "Move Column to End";
          };
        };

        "Mod+Ctrl+H" = {
          action.focus-monitor-left = [ ];
          hotkey-overlay = {
            title = "Focus Monitor";
          };
        };
        "Mod+Ctrl+J" = {
          action.focus-monitor-down = [ ];
        };
        "Mod+Ctrl+K" = {
          action.focus-monitor-up = [ ];
        };
        "Mod+Ctrl+L" = {
          action.focus-monitor-right = [ ];
        };

        "Mod+Shift+Ctrl+H" = {
          action.move-column-to-monitor-left = [ ];
          hotkey-overlay = {
            title = "Move Column to Monitor";
          };
        };
        "Mod+Shift+Ctrl+J" = {
          action.move-column-to-monitor-down = [ ];
        };
        "Mod+Shift+Ctrl+K" = {
          action.move-column-to-monitor-up = [ ];
        };
        "Mod+Shift+Ctrl+L" = {
          action.move-column-to-monitor-right = [ ];
        };

        "Mod+U" = {
          action.focus-workspace-down = [ ];
          hotkey-overlay = {
            title = "Focus Next Workspace";
          };
        };
        "Mod+I" = {
          action.focus-workspace-up = [ ];
          hotkey-overlay = {
            title = "Focus Previous Workspace";
          };
        };
        "Mod+Shift+U" = {
          action.move-column-to-workspace-down = [ ];
          hotkey-overlay = {
            title = "Move Column to Next Workspace";
          };
        };
        "Mod+Shift+I" = {
          action.move-column-to-workspace-up = [ ];
          hotkey-overlay = {
            title = "Move Column to Previous Workspace";
          };
        };

        "Mod+Ctrl+Shift+U" = {
          action.move-workspace-down = [ ];
          hotkey-overlay = {
            title = "Move Workspace Down";
          };
        };
        "Mod+Ctrl+Shift+I" = {
          action.move-workspace-up = [ ];
          hotkey-overlay = {
            title = "Move Workspace Up";
          };
        };

        # You can bind mouse wheel scroll ticks using the following syntax.
        # These binds will change direction based on the natural-scroll setting.
        #
        # To avoid scrolling through workspaces really fast, you can use
        # the cooldown-ms property. The bind will be rate-limited to this value.
        # You can set a cooldown on any bind, but it's most useful for the wheel.
        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = [ ];
          cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = [ ];
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          action.move-column-to-workspace-down = [ ];
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          action.move-column-to-workspace-up = [ ];
          cooldown-ms = 150;
        };

        "Mod+WheelScrollRight" = {
          action.focus-column-right-or-first = [ ];
        };
        "Mod+WheelScrollLeft" = {
          action.focus-column-left-or-last = [ ];
        };
        "Mod+Ctrl+WheelScrollRight" = {
          action.move-column-right = [ ];
        };
        "Mod+Ctrl+WheelScrollLeft" = {
          action.move-column-left = [ ];
        };

        # Usually scrolling up and down with Shift in applications results in
        # horizontal scrolling; these binds replicate that.
        "Mod+Shift+WheelScrollDown" = {
          action.focus-column-right = [ ];
        };
        "Mod+Shift+WheelScrollUp" = {
          action.focus-column-left = [ ];
        };
        "Mod+Ctrl+Shift+WheelScrollDown" = {
          action.move-column-right = [ ];
        };
        "Mod+Ctrl+Shift+WheelScrollUp" = {
          action.move-column-left = [ ];
        };

        # Similarly, you can bind touchpad scroll "ticks".
        # Touchpad scrolling is continuous, so for these binds it is split into
        # discrete intervals.
        # These binds are also affected by touchpad's natural-scroll, so these
        # example binds are "inverted", since we have natural-scroll enabled for
        # touchpads by default.
        # Mod+TouchpadScrollDown { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+"; }
        # Mod+TouchpadScrollUp   {spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-"; }

        "Mod+1" = {
          action.focus-workspace = 1;
          hotkey-overlay = {
            title = "Switch to Workspace";
          };
        };
        "Mod+2" = {
          action.focus-workspace = 2;
        };
        "Mod+3" = {
          action.focus-workspace = 3;
        };
        "Mod+4" = {
          action.focus-workspace = 4;
        };
        "Mod+5" = {
          action.focus-workspace = 5;
        };
        "Mod+6" = {
          action.focus-workspace = 6;
        };
        "Mod+7" = {
          action.focus-workspace = 7;
        };
        "Mod+8" = {
          action.focus-workspace = 8;
        };
        "Mod+9" = {
          action.focus-workspace = 9;
        };
        "Mod+0" = {
          action.focus-workspace = 10;
        };
        "Mod+Shift+1" = {
          action.move-column-to-workspace = 1;
          hotkey-overlay = {
            title = "Move to Workspace";
          };
        };
        "Mod+Shift+2" = {
          action.move-column-to-workspace = 2;
        };
        "Mod+Shift+3" = {
          action.move-column-to-workspace = 3;
        };
        "Mod+Shift+4" = {
          action.move-column-to-workspace = 4;
        };
        "Mod+Shift+5" = {
          action.move-column-to-workspace = 5;
        };
        "Mod+Shift+6" = {
          action.move-column-to-workspace = 6;
        };
        "Mod+Shift+7" = {
          action.move-column-to-workspace = 7;
        };
        "Mod+Shift+8" = {
          action.move-column-to-workspace = 8;
        };
        "Mod+Shift+9" = {
          action.move-column-to-workspace = 9;
        };
        "Mod+Shift+0" = {
          action.move-column-to-workspace = 10;
        };

        # The following binds move the focused window in and out of a column.
        # If the window is alone, they will consume it into the nearby column to the side.
        # If the window is already in a column, they will expel it out.
        "Mod+BracketLeft" = {
          action.consume-or-expel-window-left = [ ];
          hotkey-overlay = {
            title = "Into/Out of Column Left";
          };
        };
        "Mod+BracketRight" = {
          action.consume-or-expel-window-right = [ ];
          hotkey-overlay = {
            title = "Into/Out of Column Right";
          };
        };

        "Mod+W" = {
          action.switch-preset-column-width = [ ];
          hotkey-overlay = {
            title = "Switch Width";
          };
        };
        "Mod+Shift+W" = {
          action.switch-preset-window-height = [ ];
          hotkey-overlay = {
            title = "Switch Height";
          };
        };
        "Mod+F" = {
          action.maximize-column = [ ];
          hotkey-overlay = {
            title = "Maximise";
          };
        };

        # Finer width adjustments.
        # This command can also:
        # * set width in pixels: "1000"
        # * adjust width in pixels: "-5" or "+5"
        # * set width as a percentage of screen width: "25%"
        # * adjust width as a percentage of screen width: "-10%" or "+10%"
        # Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
        # set-column-width "100" will make the column occupy 200 physical screen pixels.
        "Mod+Minus" = {
          action.set-column-width = "-10%";
          hotkey-overlay = {
            title = "Decrease Column Width";
          };
        };
        "Mod+Equal" = {
          action.set-column-width = "+10%";
          hotkey-overlay = {
            title = "Increase Column Width";
          };
        };

        # Finer height adjustments when in column with other windows.
        "Mod+Shift+Minus" = {
          action.set-window-height = "-10%";
          hotkey-overlay = {
            title = "Decrease Window Height";
          };
        };
        "Mod+Shift+Equal" = {
          action.set-window-height = "+10%";
          hotkey-overlay = {
            title = "Increase Window Height";
          };
        };

        # Move the focused window between the floating and the tiling layout.
        "Mod+N" = {
          action.toggle-window-floating = [ ];
          hotkey-overlay = {
            title = "Toggle Floating";
          };
        };

        "Mod+T" = {
          action.spawn-sh = todoList;
          hotkey-overlay = {
            title = "Toggle Todo List";
          };
        };

        "Mod+P" = {
          action.screenshot = [ ];
          hotkey-overlay = {
            title = "Take Screenshot";
          };
        };
        "Mod+Ctrl+P" = {
          action.screenshot-screen = [ ];
          hotkey-overlay = {
            title = "Take Monitor Screenshot";
          };
        };
        "Mod+Alt+P" = {
          action.screenshot-window = [ ];
          hotkey-overlay = {
            title = "Take Window Screenshot";
          };
        };

        "Mod+S" = {
          action.spawn-sh = toggleApplication "rink";
          hotkey-overlay = {
            title = "Toggle Rink";
          };
        };

        "Mod+M" = {
          action.spawn-sh = toggleApplication "btop";
          hotkey-overlay = {
            title = "Toggle BTop";
          };
        };

        # Applications such as remote-desktop clients and software KVM switches may
        # request that niri stops processing the keyboard shortcuts defined here
        # so they may, for example, forward the key presses as-is to a remote machine.
        # It's a good idea to bind an escape hatch to toggle the inhibitor,
        # so a buggy application can't hold your session hostage.
        #
        # The allow-inhibiting=false property can be applied to other binds as well,
        # which ensures niri always processes them, even when an inhibitor is active.
        "Mod+Escape" = {
          action.toggle-keyboard-shortcuts-inhibit = [ ];
          allow-inhibiting = false;
          hotkey-overlay = {
            title = "Stop Keybind Inhibiting";
          };
        };

        "Mod+V" = {
          action.center-column = [ ];
        };

        # The quit action will show a confirmation dialog to avoid accidental exits.
        "Mod+Shift+C" = {
          action.quit = [ ];
        };

        # Powers off the monitors. To turn them back on, do any input like
        # moving the mouse or pressing any other key.
        "Mod+Shift+P" = {
          action.power-off-monitors = [ ];
        };
      };

  }
)
