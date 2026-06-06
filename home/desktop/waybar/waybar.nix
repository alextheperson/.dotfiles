barSettings: { config, pkgs, inputs, ... }:
(
  let
    niri-taskbar = (import ../../../packages/niri-taskbar.nix { pkgs = pkgs; });
    menubar-config = (import ./menubar.nix);
    todolist-config = (import ./todolist.nix);
  in
  {
    home.packages = [
      niri-taskbar
      pkgs.playerctl
    ];

    # Allow access to CFFI modules in waybar
    home.file.niri-taskbar-cffi = {
      source = config.lib.file.mkOutOfStoreSymlink "${niri-taskbar}/lib/libniri_taskbar.so";
      target = ".config/waybar-cffi/niri-taskbar.so";
    };

    programs.waybar.enable = true;

    home.file.waybar_scripts.source = ./scripts;
    home.file.waybar_scripts.target = ".config/waybar/scripts";
    home.file.waybar_scripts.recursive = true;

    home.file.waybar_styles.source = ./style.css;
    home.file.waybar_styles.target = ".config/waybar/style.css";

    home.file.waybar_menubar_config.text = builtins.toJSON (menubar-config barSettings);
    home.file.waybar_menubar_config.target = ".config/waybar/menubar-config.json";

    home.file.waybar_todolist_config.text = builtins.toJSON (todolist-config barSettings);
    home.file.waybar_todolist_config.target = ".config/waybar/todo-config.json";
  }
)
