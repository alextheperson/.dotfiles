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

    # GUI Apps
    seahorse
    kdePackages.filelight
    webcord
    thunderbird
    libreoffice-qt6-fresh

    floorp-bin
  ]) ++ (with pkgs.unstable; [
    # Unstable pkgs
  ]) ++ (with inputs; [
    nix-alien.packages.${pkgs.system}.default
    todo-rs.packages.${pkgs.system}.default
  ]);


  imports = [
    ./development
    ./desktop
    ./rink
    ./art
    ./fonts
    ./dmm.nix
    ./games.nix
    (import ./desktop/waybar/waybar.nix { performanceCores = 2; efficiencyCores = 0; hasNotch = false; })
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
