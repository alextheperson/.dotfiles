{ config, pkgs, inputs, ... }:
{
  home.file.wallpapers.source = ../wallpaper;
  home.file.wallpapers.target = ".config/wallpapers";
  home.file.wallpapers.recursive = true;

  home.file.pandora.source = ./pandora.kdl;
  home.file.pandora.target = ".config/pandora/pandora.kdl";
}
