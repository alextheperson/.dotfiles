{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    swaylock
  ];

  home.file.swaylock.source = ./config;
  home.file.swaylock.target = ".swaylock/config";
}
