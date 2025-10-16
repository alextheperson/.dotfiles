{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    wbg
  ];

  home.file.wbg.source = ../wallpaper;
  home.file.wbg.target = ".config/wallpapers";
  home.file.wbg.recursive = true;
}
