{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    # blesh.enable = true;
    bashrcExtra = ''
      eval "$(oh-my-posh init bash)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "catppuccin_macchiato";
  };

  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+k" = "clear_terminal reset active";
    };
    settings = {
      window_margin_width = 5;
      cursor_stop_blinking_after = 15.0;
      confirm_os_window_close = -1;
      clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
      font_size = 9;
    };
    themeFile = "Catppuccin-Macchiato";
  };
}
