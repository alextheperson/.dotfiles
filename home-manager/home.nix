{ config, pkgs, inputs, ... }:
{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.packages = (with pkgs; [
    # Utils
    cliphist
    wayclip
    rofi-wayland
    libnotify
    playerctl
    brightnessctl
    fzf
    clang
    jq
    unzip
    zip
    libsecret
    git-credential-manager
    dconf

    # TUI Utils
    btop
    neofetch
    streamrip
    ncpamixer
    pom

    # GUI Apps
    seahorse
    kiwix
    kdePackages.filelight
    webcord
    prusa-slicer
    thunderbird
    kicad
    superTuxKart
    xonotic
    scribus
  ]) ++ (with inputs; [
    nix-alien.packages.aarch64-linux.default
    todo-rs.packages.aarch64-linux.default
  ]);


  imports = [
    ./development
    ./desktop
    ./dmm.nix
    ./rink
    ./art
  ];

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
