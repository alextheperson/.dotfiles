{ ... }: {
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

      # Set default widths for some apps
      {
        matches = [{ app-id = "kitty"; }];
        default-column-width.proportion = 1.0 / 3.0;
      }

      {
        matches = [{ app-id = "floorp"; }];
        default-column-width.proportion = 2.0 / 3.0;
      }

      # Change behavior for floating widows
      {
        matches = [{ title = "plzfloat"; }];
        default-column-width.fixed = 700;
        default-window-height.fixed = 500;
        min-width = 700;
        max-width = 700;
        min-height = 500;
        max-height = 500;
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

      # Set sizes and position for some quick-access apps
      {
        matches = [{ title = "btop"; }];
        min-width = 1500;
        max-width = 1500;
        min-height = 1000;
        max-height = 1000;
        open-floating = true;
      }

      {
        matches = [{ title = "rink"; }];
        default-floating-position = {
          x = 3;
          y = 3;
          relative-to = "bottom-right";
        };
      }

    ];

    layer-rules = [ ];
  };
}
