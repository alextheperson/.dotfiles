{ config, pkgs, inputs, ... }:
{
  imports = [
    ./keybinds.nix
    ./rules.nix
    ./layout.nix
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    package = pkgs.unstable.niri;

    enable = true;
    settings = {
      debug = {
        render-drm-device = "/dev/dri/renderD128";
      };

      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };

      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { sh = "waybar -c ~/.config/waybar/todo-config.jsonc"; }
        { sh = "vicinae server"; }

        # I hate this oh so much. However, pandora does not quit
        # when I close niri, and I need to wait a bit before
        # trying to re-open it
        { sh = "pkill pandora; sleep 0.01s; pandora"; }
      ];

      prefer-no-csd = true;
      screenshot-path = "~/Documents/pictures/screenshots/screenshot at %Y-%m-%d %H-%M-%S.png";

      input = {
        keyboard = {
          xkb = {
            # You can set rules, model, layout, variant, and options.
            # For more information, see xkeyboard-config(7).

            # For example:
            layout = "us";
            variant = "dvorak-mac";
            options = "caps:swapescape,lv3:ralt_switch";
          };
        };

        # Next sections include libinput settings.
        # Omitting settings disables them, or leaves them at their default values.
        touchpad = {
          tap = false;
          accel-speed = 0.35;
          accel-profile = "flat";
          scroll-method = "two-finger";
          natural-scroll = false;
          # dwt = true;
          # disabled-on-external-mouse
        };

        warp-mouse-to-focus.enable = true;

        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "100%";
        };
      };

      cursor = {
        theme = config.home.pointerCursor.name;
        size = config.home.pointerCursor.size;
      };

      # Serafina Display
      outputs."eDP-1" = {
        mode = {
          width = 3456;
          height = 2160;
          refresh = 59.940;
        };
        scale = 1.15;
        transform = {
          flipped = false;
          rotation = 0;
        };
        # position x=1280 y=0
      };

      # Iorek Display
      outputs."LVDS-1" = {
        mode = {
          width = 1366;
          height = 768;
          refresh = 60.013;
        };
        scale = 0.86;
        transform = {
          flipped = false;
          rotation = 0;
        };
        # position x=1280 y=0
      };

      # Animation settings.
      # The wiki explains how to configure individual animations:
      # https://github.com/YaLTeR/niri/wiki/Configuration:-Animations
      animations = {
        # Slow down all animations by this factor. Values below 1 speed them up instead.
        slowdown = 0.5;
      };
      overview = {
        backdrop-color = "#11111b";
        workspace-shadow.enable = false;
      };
    };
  };
}
