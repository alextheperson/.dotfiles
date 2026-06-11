{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    fonts = {
      serif = {
        package = pkgs.merriweather;
        name = "Merriweather";
      };

      sansSerif = {
        package = pkgs.merriweather-sans;
        name = "Merriweather Sans";
      };

      # If I want, make it all monospace
      # serif = config.stylix.fonts.monospace;
      # sansSerif = config.stylix.fonts.monospace;

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };

    # This dosen't totally work though, so you might still need to set dark
    # mode manually on some apps
    polarity = "dark";

    targets.waybar.enable = false;
    targets.kitty.enable = false;
    targets.neovim.enable = false;
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 24;
  };
}
