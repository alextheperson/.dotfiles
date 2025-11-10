{ config, pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.neovim.source = ../neovim;
  home.file.neovim.target = ".config/nvim/";
  home.file.neovim.recursive = true;
}
