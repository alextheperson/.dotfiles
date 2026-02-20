{ config, pkgs, inputs, ... }:
{
  # It is enabled system wide for PAM reasons. However, it is configured here.
  home.file.swaylock.source = ./config;
  home.file.swaylock.target = ".swaylock/config";

}
