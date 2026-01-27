{ config, pkgs, inputs, ... }:
(
  let
    pandora = (import ../../../packages/pandora.nix { pkgs = pkgs; });
  in
  {
    home.packages = [
      pandora
    ];

    home.file.wallpapers.source = ../wallpaper;
    home.file.wallpapers.target = ".config/wallpapers";
    home.file.wallpapers.recursive = true;

    home.file.pandora.source = ./pandora.kdl;
    home.file.pandora.target = ".config/pandora/pandora.kdl";
  }
)
