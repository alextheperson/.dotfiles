{ inputs, config, lib, pkgs, ... }: {
  programs.niri.settings = {
    window-rules = [
      # Add slight corner radii to all windows
      {
        geometry-corner-radius = {
          top-left = 2.0;
          top-right = 2.0;
          bottom-left = 2.0;
          bottom-right = 2.0;
        };
        clip-to-geometry = true;
      }

      # Change kitty to be thin by default
      {
        matches = [{ app-id = "kitty"; }];
        default-column-width.proportion = 1.0 / 3.0;
      }
      # Change behavior for floating widows
      {
        matches = [{ title = "open-floating"; }];
        open-floating = true;
      }

      {
        matches = [{ is-floating = true; }];
        focus-ring = {
          enable = false;
        };
        border = {
          enable = true;
          width = 2;
          active.color = "#f5a97f";
          inactive.color = "#5b6078";
          urgent.color = "#ed8796";
        };
      }

      {
        # This is needed for small screens so that btop has enough space.
        matches = [{ title = "btop"; }];
        min-width = 720;
      }
    ];

    layer-rules = [ ];
  };

  # This is a terrible hack: https://github.com/sodiboo/niri-flake/issues/1721#issuecomment-4428164218
    xdg.configFile.niri-config.source = let
      inherit (inputs.niri.lib.internal) validated-config-for;
      inherit (config.programs.niri) finalConfig package;
    in
      lib.mkForce (
        validated-config-for pkgs package ''
          ${finalConfig}

          window-rule {
            background-effect {
              blur true
            }
          }

          layer-rule {
            // The notifications have a margin which makes blur look ugly
            exclude namespace="notifications"
            // Otherwise niri always blurs the area of the todo-list even when hidden
            exclude namespace="todo-bar" layer="bottom"
            background-effect {
              blur true
              xray false
            }
          }

          blur {
            passes 2
            offset 3
            noise 0.05
            saturation 0.75
          }
        ''
      );

}
