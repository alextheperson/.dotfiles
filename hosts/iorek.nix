# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/iorek.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "iorek"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak-mac";
  };

  console.useXkbConfig = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    description = "Alex Solis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Collect garbage, and delete generations more than 14 days old
  nix.gc = {
    automatic = true;
    randomizedDelaySec = "14m";
    options = "--delete-older-than 14d";
  };

  nix.optimise =
    {
      automatic = true;
      randomizedDelaySec = "14m";
    };

  hardware = {
    graphics = {
      enable = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.tlp.enable = true;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  # For some reason, this isn't happening automatically. This is needed for niri
  services.displayManager.sessionPackages = [ pkgs.unstable.niri ];
  systemd.packages = [ pkgs.unstable.niri ];
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages =
    with pkgs;
    [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      unstable.niri
      swaylock-effects
    ];

  services.displayManager.ly = {
    enable = true;
    settings = {
      bigclock = "en";
      animation = "matrix";
      brightness_up_cmd = "brightnessctl -e4 -n0 set 5%+";
      brightness_down_cmd = "brightnessctl -e4 -n0 set 5%-";
      allow_empty_password = false;
      bigclock_seconds = true;
    };
  };

  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
  fonts.fontDir.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Cachix
  nix.settings = {
    extra-substituters = [ "https://vicinae.cachix.org" ];
    extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
