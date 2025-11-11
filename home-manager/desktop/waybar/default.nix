{ config, pkgs, inputs, ... }:

{
  home.packages = [
    (import ../../modules/niri-taskbar.nix { pkgs = pkgs; })
  ];

  programs.waybar.enable = true;

  home.file.waybar.source = ../waybar;
  home.file.waybar.target = ".config/waybar";
  home.file.waybar.recursive = true;
}
