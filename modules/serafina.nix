{ lib, config, pkgs, inputs, ... }: {
  imports = with inputs; [
    # Include the results of the hardware scan.
    ../hardware/serafina.nix

    # Hardware devices
    ./hardware/wifi.nix
    ./hardware/graphics.nix
    ./hardware/bluetooth.nix
    ./hardware/audio.nix

    # Input devices
    ./hardware/input/keyboard.nix
    ./hardware/input/touchpad.nix
    ./hardware/input/tablet.nix

    # Base System
    ./system/nixos.nix
    apple-silicon.nixosModules.apple-silicon-support
    ./system/network.nix
    ./system/locale.nix
    ./system/cachix.nix
    ./system/fonts.nix
    ./system/printing.nix
    ./system/battery.nix

    # Special Software
    ./software/ly.nix
    ./software/niri.nix
    ./software/swaylock.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "serafina"; # Define your hostname.

  hardware.asahi.peripheralFirmwareDirectory = ../firmware;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    initialPassword = "changeme";
    description = "Alex Solis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

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
