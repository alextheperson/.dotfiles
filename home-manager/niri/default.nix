{ config, inputs, ... }:
(

  let
    nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.aarch64-linux;
    nixpkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.aarch64-linux;
  in


  {
    home.file.niri.source = ../niri;
    home.file.niri.target = ".config/niri";
    home.file.niri.recursive = true;
  }
)
