{ config, pkgs, inputs, ... }:
{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.packages = (with pkgs; [
    # Utils
    libnotify
    brightnessctl
    unzip
    zip
    libsecret
    git-credential-manager

    # TUI Utils
    btop
    ncpamixer
    bluetui

    # GUI Apps
    seahorse
    kiwix
    webcord
    prusa-slicer
    thunderbird
    kicad
    libreoffice-qt6-fresh
    obs-studio

    floorp-bin
    cinny-desktop
  ]) ++ (with pkgs.unstable; [
    # Unstable pkgs
  ]) ++ (with inputs; [
    nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.default
    todo-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
  ]);


  imports = [
    ./development
    ./desktop
    ./rink
    ./art
    ./fonts
    ./dmm.nix
    ./games.nix
    (import ./desktop/waybar/waybar.nix { performanceCores = 8; efficiencyCores = 2; hasNotch = true; })
  ];

  xdg.desktopEntries.nmtui = {
    name = "NMTui";
    genericName = "Network Manager";
    exec = "sudo nmtui";
    terminal = true;
    categories = [ "Network" ];
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
