{ config, pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
}
