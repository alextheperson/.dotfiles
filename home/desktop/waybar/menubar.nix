{ performanceCores, efficiencyCores, hasNotch }:
let
  modules = import ./modules.nix { inherit performanceCores efficiencyCores; };
in

# Add a secondary top bar if there is a notch
(if hasNotch then
  [{
    layer = "top";
    position = "top";
    height = 19;
    name = "notch-buffer";
    reload_style_on_change = true;
  }] else [ ]) ++
[
  {
    layer = "top";
    position = "top";
    height = 23;
    name = if hasNotch then "top-bar-notch" else "top-bar";
    reload_style_on_change = true;
    modules-left = [
      "custom/logo"
      "cpu"
      "memory"
      "custom/powerDraw"
      "network#speed"
      "temperature"
    ];
    modules-center = [
        "clock"
        "custom/weather"
    ];
    modules-right = [
      "idle_inhibitor"
      "backlight"
      "pulseaudio"
      "bluetooth"
      "network#info"
      "battery"
    ];
    inherit (modules) "custom/logo" cpu memory temperature disk "custom/powerDraw" "network#speed" clock"custom/weather" idle_inhibitor backlight pulseaudio bluetooth "network#info" battery;
  }
  {
    layer = "top";
    position = "bottom";
    height = 33;
    name = "bottom-bar";
    reload_style_on_change = true;
    modules-left = [
      "wlr/taskbar"
    ];
    modules-center = [
      "custom/workspaces"
    ];
    modules-right = [
      "image#album-art"
      "mpris"
    ];
    inherit (modules) "wlr/taskbar" "custom/workspaces" "image#album-art" mpris;
  }
]
