{ config, pkgs, inputs, ... }:
{
	home.file.neovim.source = ../neovim;
	home.file.neovim.target = ".config/nvim/";
	home.file.neovim.recursive = true;
}
