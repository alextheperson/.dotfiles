# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ lib, config, pkgs, inputs, ... }: {
  imports = with inputs; [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    apple-silicon.nixosModules.apple-silicon-support
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "serafina"; # Define your hostname.

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # setting WLR Graphic Card - needed for hyprland
  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
  };

  # Specify path to peripheral firmware files. - WARNING: NOT LEGAL TO SHARE
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

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
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.blueman.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
  };
  # Use same config for linux console
  console.useXkbConfig = true;

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # For some reason, this isn't happening automatically. This is needed for niri
  services.displayManager.sessionPackages = [ pkgs.unstable.niri ];
  systemd.packages = [ pkgs.unstable.niri ];
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages =
    with pkgs;
    [
      unstable.niri
      swaylock
      (import ./home-manager/wallpaper/pandora.nix { pkgs = pkgs; })
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

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # networking.firewall.allowedUDPPorts = [];
  # networking.firewall.allowedUDPPorts = [];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out-of-date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
