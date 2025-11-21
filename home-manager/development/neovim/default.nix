{ config, pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.neovim.source = ../neovim;
  home.file.neovim.target = ".config/nvim/";
  home.file.neovim.recursive = true;

  # I have to do this for some tree-sitter parsers to generate
  home.file.tree-sitter.source = ./treesitter-config.json;
  home.file.tree-sitter.target = ".config/tree-sitter/config.json";
}
