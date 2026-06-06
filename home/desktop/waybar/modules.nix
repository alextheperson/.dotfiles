{ performanceCores, efficiencyCores }: {
  # ===== Hardware Info =====
  disk = {
    interval = 30;
    format = " {percentage_used}%";
    tooltip-format = "{used} / {total}\n{free} ({percentage_free}%) free";
    path = "/";
  };
  memory = {
    format = " {percentage}%";
    tooltip-format = "Memory\n{used}/{total} ({percentage}%)\n{avail} available\nSwap\n{swapUsed}/{swapTotal} ({swapPercentage}%)\n{swapAvail} available";
  };

  cpu = (
    let
      # Generate strings for the CPU core graph
      performanceCoresString = builtins.concatStringsSep "" (builtins.genList (x: ''{icon${builtins.toString x}}'') performanceCores);
      efficiencyCoresString = builtins.concatStringsSep "" (builtins.genList (x: ''{icon${builtins.toString (x + performanceCores)}}'') efficiencyCores);
    in
    {
      interval = 1;
      format = "<span background=\"#24273a\">${performanceCoresString}<span color=\"#b7bdf8\">${efficiencyCoresString}</span></span>  {usage:2}%";
      format-icons = [
        "▁"
        "▂"
        "▃"
        "▄"
        "▅"
        "▆"
        "▇"
        "█"
      ];
      markup = true;
      tooltip-format = "{load}%\t{frequency}\nCore 0\t{usage0}\nCore 1\t{usage1}\nCore 2\t{usage2}\nCore 3\t{usage3}\nCore 4\t{usage4}\nCore 5\t{usage5}\nCore 6\t{usage6}\nCore 7\t{usage7}\nCore 8\t{usage8}\nCore 9\t{usage9}";
    }
  );
  temperature = {
    format = " {temperatureC}°C";
    format-critical = " {temperatureC}°C";
    interval = 1;
    critical-threshold = 80;
  };
  battery = {
    interval = 1;
    states = {
      full = 100;
      good = 80;
      warning = 20;
      critical = 5;
    };
    format = "{time:.11} {icon} {capacity}%";
    format-full = "{icon} {capacity}%";
    format-charging = "{time:.11} 󰂄 {capacity}%";
    format-plugged = " {capacity}%";
    format-icons = [
      "󰂎"
      "󰁺"
      "󰁻"
      "󰁼"
      "󰁽"
      "󰁾"
      "󰁿"
      "󰂀"
      "󰂁"
      "󰂂"
      "󰁹"
    ];
  };
  backlight = {
    # This seems to work on Serafina, though the backlight there is called "apple-panel-bl"
    device = "intel_backlight";
    format = "{icon} {percent}%";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
  };

  # ===== Network =====
  "network#speed" = {
    "format-wifi" = " {bandwidthDownBits}  {bandwidthUpBits}";
    format-ethernet = " ";
    format-disconnected = " ";
    tooltip-format = "{ipaddr}\nTotal:\t{bandwidthTotalBytes}\t{bandwidthUpBits}\n\t{bandwidthDownBits}\n";
  };
  "network#info" = {
    format-wifi = "  {essid}";
    format-ethernet = " ";
    format-disconnected = " ";
    tooltip-format = "{ipaddr}";
    tooltip-format-wifi = "{essid} {frequency}GHz ({signalStrength}%)   | {ipaddr}";
    tooltip-format-ethernet = "{ifname}   | {ipaddr}";
  };
  bluetooth = {
    format-on = "";
    format-off = "󰂲";
    format-disabled = "󰂲";
    format-connected = "󰂴";
    format-connected-battery = "󰂴 {device_battery_percentage}%";
    format-no-controller = "";
    tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
    tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
  };

  # ===== Window Layout =====
  "wlr/taskbar" = {
    format = "{icon} <b>{name:.12}  {short_state}</b> \n {title:.15}";
    icon-size = 25;
    tooltip-format = "{title}";
    active-first = true;
    ignore-list = [
      "kitty"
    ];
    on-click = "activate";
    on-click-middle = "close";
    markup = true;
    rewrite = {
      "&" = "&amp;";
    };
  };
  "cffi/niri-taskbar" = {
    module_path = ".config/waybar-cffi/niri-taskbar.so";
    notifications = {
      enable = true;
    };
    show_all_outputs = true;
  };
  "custom/workspaces" = {
    exec = "~/.config/waybar/scripts/workspaces.sh";
    restart-interval = 60;
    return-type = "json";
    format = "{}";
  };

  # ===== Audio =====
  "image#album-art" = {
    exec = "~/.config/waybar/scripts/album-art.sh";
    size = 33;
    interval = 5;
  };
  mpris = {
    format = "  {status_icon} {title} - {album}  \n  {artist}  ";
    status-icons = {
      playing = "";
      paused = "";
      stopped = "";
    };
  };
  pulseaudio = {
    format = "{icon} {volume}%";
    format-bluetooth = "󰂰 {volume}%";
    format-muted = " {volume}%";
    format-icons = {
      headphones = "";
      bluetooth = "󰥰";
      handsfree = "";
      headset = "󱡬";
      phone = "";
      portable = "";
      car = "";
      default = [
        "󰓃"
      ];
    };
    tooltip-format = "{icon} {volume}%\n{desc}";
  };

  # ===== Custom =====
  "custom/logo" = {
    format = "{}";
    return-type = "json";
    exec = "~/.config/waybar/scripts/whoami.sh";
    interval = 3600;
    tooltip = false;
  };
  "custom/weather" = {
    format = "{}";
    return-type = "json";
    exec = "~/.config/waybar/scripts/weather.sh";
    interval = 10;
    tooltip = true;
  };
  "custom/powerDraw" = {
    format = " {}w";
    interval = 1;
    exec = "~/.config/waybar/scripts/powerdraw.sh";
    return-type = "json";
  };
  "custom/todo" = {
    exec = "~/.config/waybar/scripts/todo.sh";
    interval = 1;
    return-type = "json";
    format = "{}";
  };

  # ===== Misc =====
  clock = {
    format = "{:%H:%M:%S %a %d-%b-%y}";
    interval = 1;
    tooltip-format = "\n<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    calendar-weeks-pos = "right";
    today-format = "<span color='#7645AD'><b><u>{}</u></b></span>";
    format-calendar = "<span color='#aeaeae'><b>{}</b></span>";
    format-calendar-weeks = "<span color='#aeaeae'><b>W{:%V}</b></span>";
    format-calendar-weekdays = "<span color='#aeaeae'><b>{}</b></span>";
  };
  idle_inhibitor = {
    format = "{icon}";
    format-icons = {
      activated = "󱜤 ";
      deactivated = "󰌢 ";
    };
  };
}
