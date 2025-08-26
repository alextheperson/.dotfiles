{ config, pkgs, catppuccin, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.packages = with pkgs; [
    cliphist
    wayclip

    rofi-wayland
    libnotify

    hyprpaper
    hyprpicker

    neofetch
    btop

    fzf
    clang
    jq
    unzip

    kiwix
    webcord
    blender
    floorp
    prusa-slicer
    thunderbird
    kicad
    # inputs.dmm.packages.aarch64-linux.default
  ];

  imports = [
    ./shell.nix
    ./waybar.nix
    ./hypr.nix
  ];

  services.blueman-applet.enable = true;
  services.mako = {
    enable = true;
    anchor = "bottom-right";
    borderSize = 2;
    borderRadius = 18;
    defaultTimeout = 30000;
  };

  programs.git = {
    enable = true;
    userEmail = "git@alexsol.is";
    userName = "Alex Solis";
    extraConfig = {
      credential = {
        helper = "store";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  gtk = {
    enable = true;
    theme.name = "Adwaita";
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
    hyprlock.enable = false;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
