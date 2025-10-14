{ config, nixpkgs-stable, nixpkgs-unstable, inputs, ... }:

{
  programs.waybar.enable = true;

  home.file.waybar.source = ../waybar;
  home.file.waybar.target = ".config/waybar";
  home.file.waybar.recursive = true;
}
