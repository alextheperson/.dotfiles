{ config, pkgs, inputs, ... }:
{
  imports = [
    ./keybinds.nix
    ./window-rules.nix
    ./layout.nix
  ];

  programs.niri = {
    # package = pkgs.niri-unstable;

    enable = true;
    # package = pkgs.niri-unstable;
    settings =
      {
        debug = {
          render-drm-device = "/dev/dri/renderD128";
        };

        spawn-at-startup = [
          { argv = [ "waybar" ]; }
          { argv = [ "kitty" ]; }
          { argv = [ "floorp" ]; }
          { argv = [ "waybar" "-c" "/home/alex/.config/waybar/todo-config.jsonc" ]; }
          { argv = [ "wbg" "/home/alex/.config/wallpapers/0001.png" ]; }
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
            tap = true;
            accel-speed = 0.35;
            accel-profile = "flat";
            scroll-method = "two-finger";
            natural-scroll = false;
            # disabled-on-external-mouse
          };

          warp-mouse-to-focus.enable = true;

          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "100%";
          };
        };

        # You can configure outputs by their name, which you can find
        # by running `niri msg outputs` while inside a niri instance.
        # The built-in laptop monitor is usually called "eDP-1".
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

        # Animation settings.
        # The wiki explains how to configure individual animations:
        # https://github.com/YaLTeR/niri/wiki/Configuration:-Animations
        animations = {
          # Slow down all animations by this factor. Values below 1 speed them up instead.
          slowdown = 0.5;
        };

        # Open the Firefox picture-in-picture player as floating by default.
      };
  };

  # I somehow broke the systemd unit for niri, so I have
  # to re-create it in order for it to (sort-of) load.
  # systemd.user.services.niri = {
  #   Unit = {
  #     Description = "A scrollable-tiling Wayland compositor";
  #     BindsTo = "graphical-session.target";
  #     Before = "graphical-session.target";
  #     Wants = "graphical-session-pre.target";
  #     After = "graphical-session-pre.target";
  #
  #     # Wants = "xdg-desktop-autostart.target";
  #     # Before = "xdg-desktop-autostart.target";
  #   };
  #
  #   Service = {
  #     Slice = "session.slice";
  #     Type = "notify";
  #     ExecStart = "${pkgs.niri}/bin/niri --session";
  #   };
  # };
}
