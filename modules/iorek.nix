{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ../hardware/iorek.nix

      # Hardware devices
      ./hardware/wifi.nix
      ./hardware/graphics.nix
      ./hardware/audio.nix

      # Input devices
      ./hardware/input/keyboard.nix
      ./hardware/input/touchpad.nix
      ./hardware/input/tablet.nix

      # Base System
      ./system/nixos.nix
      ./system/network.nix
      ./system/locale.nix
      ./system/cachix.nix
      ./system/fonts.nix
      ./system/printing.nix
      ./system/battery.nix
      ./system/fileshare.nix

      # Special Software
      ./software/ly.nix
      ./software/niri.nix
      ./software/swaylock.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "iorek"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    description = "Alex Solis";
    extraGroups = [ "networkmanager" "wheel" "disk"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
