{ config, pkgs, ... }:

{
  services.hypridle.enable = true;
  programs.hyprlock = {
    enable = true;
  };

  home.file.hypr.source = ./hypr;
  home.file.hypr.target = ".config/hypr";
  home.file.hypr.recursive = true;
}
