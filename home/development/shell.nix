{ ... }:

{
  programs.bash = {
    enable = true;
    # blesh.enable = true;
    shellAliases = {
      lls = "ls -lh";
      ls = "ls -a --color=tty";
      ccd = "cd ../";
      icat = "kitten icat";
    };
    bashrcExtra = ''
      eval "$(oh-my-posh init bash)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "catppuccin_macchiato";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };

  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+k" = "clear_terminal to_cursor active";
      "ctrl+apostrophe" = "launch --type=os-window --cwd=current";
    };
    settings = {
      window_margin_width = 5;
      cursor_stop_blinking_after = 15.0;
      confirm_os_window_close = -1;
      clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
      background_opacity = 0.5;
      background_blur = 1;
      font_family = "family=\"FiraCode Nerd Font\"";
      bold_font = "auto";
      # There isn't italic FiraCode, so this is the best I can do.
      italic_font = "family='FantasqueSansM Nerd Font' postscript_name=FantasqueSansMNF-Italic";
      bold_italic_font = "auto";
      font_size = 10;
    };
    themeFile = "Catppuccin-Macchiato";
  };
}
