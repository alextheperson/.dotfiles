{ pkgs, config, ... }: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Wayland, X, etc. support for session vars
  # systemd.user.sessionVariables = config.home-manager.users.alex.home.sessionVariables;

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    theme.package = pkgs.gnome-themes-extra;
    # iconTheme.name = "Adwaita";
    font.name = "Liberation Sans 11";
    # cursorTheme.name = "Adwaita";
    # cursorTheme.size = 24;
    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme = 1
    '';
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";

    nvim.enable = false;
    waybar.enable = false;
    kitty.enable = false;
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
