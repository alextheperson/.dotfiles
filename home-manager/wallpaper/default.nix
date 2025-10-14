{ config, inputs, ... }:
(

  let
    nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.aarch64-linux;
    nixpkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.aarch64-linux;
  in


  {
    home.packages = with nixpkgs-stable; [
      wbg
    ];

    home.file.wbg.source = ../wallpaper;
    home.file.wbg.target = ".config/wallpapers";
    home.file.wbg.recursive = true;
  }
)
