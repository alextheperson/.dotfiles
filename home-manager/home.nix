{ config, pkgs, catppuccin, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.packages = with pkgs; [
    cliphist
    wayclip

    dunst
    rofi-wayland

    hyprpaper
    hyprpicker

    nwg-look
    neofetch

    fzf
    clang
    jq
    unzip

    kiwix
    webcord
    blender
    floorp
    prusa-slicer
    thunderbird
    kicad
    # inputs.dmm.packages.aarch64-linux.default
  ];


  programs.bash = {
    enable = true;
    # blesh.enable = true;
    bashrcExtra = ''
      eval "$(oh-my-posh init bash)"
    '';
  };

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  programs.waybar.enable = true;

  programs.git = {
    enable = true;
    userEmail = "git@alexsol.is";
    userName = "Alex Solis";
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "catppuccin_macchiato";
  };

  programs.kitty = {
    extraConfig = ''
      map ctrl+c copy_and_clear_or_interrupt
      map ctrl+v paste_from_clipboard
      map ctrl+k clear_terminal reset active

      cursor_stop_blinking_after 15.0

      window_margin_width 10
    '';
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";

    nvim.enable = false;
    waybar.enable = false;
    kitty.enable = false;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
