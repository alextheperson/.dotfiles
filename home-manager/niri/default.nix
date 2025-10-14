{ config, pkgs, ... }:

{
  home.file.niri.source = ../niri;
  home.file.niri.target = ".config/niri";
  home.file.niri.recursive = true;
}

