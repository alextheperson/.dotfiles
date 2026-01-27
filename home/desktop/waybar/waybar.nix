cores: { config, pkgs, inputs, lib, ... }:
(
  let
    niri-taskbar = (import ../../../packages/niri-taskbar.nix { pkgs = pkgs; });
    config-generator = (import ./primary-config.nix);
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

    home.file.waybar_config.text = config-generator lib cores;
    home.file.waybar_config.target = ".config/waybar/config.jsonc";
  }
)
