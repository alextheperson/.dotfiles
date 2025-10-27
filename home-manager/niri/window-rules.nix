{ ... }: {
  programs.niri.settings.window-rules = [
    {
      matches = [{ app-id = "kitty"; }];
      default-column-width.proportion = 1.0 / 3.0;
    }
    {
      matches = [{ app-id = "floorp"; }];
      default-column-width.proportion = 2.0 / 3.0;
    }
    {
      geometry-corner-radius = {
        top-left = 2.0;
        top-right = 2.0;
        bottom-left = 2.0;
        bottom-right = 2.0;
      };
      clip-to-geometry = true;
    }
    {
      # This app-id regular expression will work for both:
      # - host Firefox (app-id is "firefox")
      # - Flatpak Firefox (app-id is "org.mozilla.firefox")
      matches = [{ app-id = "floorp"; title = "^Picture-in-Picture$"; }];
      open-floating = true;
    }
  ];

}
