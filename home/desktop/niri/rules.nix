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
}
