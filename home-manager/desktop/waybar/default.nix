{ config, pkgs, inputs, ... }:
(
  let
    niri-taskbar = (import ../../../modules/niri-taskbar.nix { pkgs = pkgs; });
  in
  {
    home.packages = [
      niri-taskbar
    ];

    # Allow access to CFFI modules in waybar
    home.file.niri-taskbar-cffi = {
      source = config.lib.file.mkOutOfStoreSymlink "${niri-taskbar}/lib/libniri_taskbar.so";
      target = ".config/waybar-cffi/niri-taskbar.so";
    };

    programs.waybar.enable = true;

    home.file.waybar.source = ../waybar;
    home.file.waybar.target = ".config/waybar";
    home.file.waybar.recursive = true;
  }
)
