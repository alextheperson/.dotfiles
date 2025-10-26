{ config, pkgs, inputs, ... }:
{
  # programs.niri = {
  #   # enable = true;
  #   # package = pkgs.niri-unstable;
  #   settings = {
  #     outputs."eDP-1".scale = 2.0;
  #   };
  # };

  home.file.niri.source = ./config.kdl;
  home.file.niri.target = ".config/niri/config.kdl";
}
