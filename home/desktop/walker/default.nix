{ config, pkgs, inputs, ... }: {
  imports = [ inputs.walker.homeManagerModules.default ];

  programs.walker = {
    enable = true;
    config =
      {
        disable_mouse = true;
        theme = "catppuccin-macchiato-blue";
        global_argument_delimiter = "&";
        exact_search_prefix = "'";
        quick_activate = [ "F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" "F10" "F11" "F12" ];
        shell = {
          anchor_bottom = true;
        };

        emergencies = [
          {
            text = "Floorp";
            command = "floorp";
          }
          {
            text = "Kitty";
            command = "kitty";
          }
        ];

        providers = {
          default = [
            "bluetooth"
            "bitwarden"
            "desktopapplications"
            "calc"
            "providerlist"
          ];

          prefixes = [
            {
              prefix = "?";
              provider = "providerlist";
            }
            {
              prefix = ">";
              provider = "runner";
            }
            {
              prefix = "/";
              provider = "files";
            }
            {
              prefix = ":";
              provider = "symbols";
            }
            {
              prefix = "+";
              provider = "todo";
            }
            {
              prefix = "=";
              provider = "calc";
            }
            {
              prefix = ":";
              provider = "websearch";
            }
            {
              prefix = "\"";
              provider = "clipboard";
            }
            {
              prefix = "@";
              provider = "windows";
            }
            {
              prefix = ",";
              provider = "unicode";
            }
            {
              prefix = "~";
              provider = "niriactions";
            }
          ];

          actions = {
            fallback = [
              {
                action = "menus:open";
                label = "open";
                after = "Nothing";
              }
              {
                action = "menus:default";
                label = "run";
                after = "Close";
              }
              {
                action = "menus:parent";
                label = "back";
                bind = "Escape";
                after = "Nothing";
              }
              {
                action = "erase_history";
                label = "clear hist";
                bind = "ctrl h";
                after = "AsyncReload";
              }
            ];
            providerlist = [
              {
                action = "activate";
                default = true;
                bind = "Return";
                after = "ClearReload";
              }
            ];
            bluetooth = [
              {
                action = "find";
                bind = "ctrl f";
                after = "AsyncClearReload";
              }
              {
                action = "remove";
                bind = "ctrl d";
                after = "AsyncReload";
              }
              {
                action = "trust";
                bind = "ctrl t";
                after = "AsyncReload";
              }
              {
                action = "untrust";
                bind = "ctrl t";
                after = "AsyncReload";
              }
              {
                action = "pair";
                bind = "Return";
                after = "AsyncReload";
              }
              {
                action = "connect";
                default = true;
                bind = "Return";
                after = "AsyncReload";
              }
              {
                action = "disconnect";
                default = true;
                bind = "Return";
                after = "AsyncReload";
              }
              {
                action = "power_on";
                label = "Power On";
                bind = "ctrl e";
                after = "AsyncReload";
              }
              {
                action = "power_off";
                label = "Power Off";
                bind = "ctrl e";
                after = "AsyncReload";
              }
            ];
            calc = [
              {
                action = "copy";
                default = true;
                bind = "Return";
              }
              {
                action = "delete";
                bind = "ctrl d";
                after = "AsyncReload";
              }
              {
                action = "delete_all";
                bind = "ctrl shift d";
                after = "AsyncReload";
              }
              {
                action = "save";
                bind = "ctrl s";
                after = "AsyncClearReload";
              }
            ];
            websearch = [
              {
                action = "search";
                default = true;
                bind = "Return";
              }
              {
                action = "open_url";
                label = "open url";
                default = true;
                bind = "Return";
              }
            ];
            desktopapplications = [
              {
                action = "start";
                default = true;
                bind = "Return";
              }
              {
                action = "start:keep";
                label = "open+next";
                bind = "shift Return";
                after = "KeepOpen";
              }
              {
                action = "new_instance";
                label = "new instance";
                bind = "ctrl Return";
              }
              {
                action = "new_instance:keep";
                label = "new+next";
                bind = "ctrl alt Return";
                after = "KeepOpen";
              }
              {
                action = "pin";
                bind = "ctrl p";
                after = "AsyncReload";
              }
              {
                action = "unpin";
                bind = "ctrl p";
                after = "AsyncReload";
              }
              {
                action = "pinup";
                bind = "ctrl n";
                after = "AsyncReload";
              }
              {
                action = "pindown";
                bind = "ctrl m";
                after = "AsyncReload";
              }
            ];
            files = [
              {
                action = "open";
                default = true;
                bind = "Return";
              }
              {
                action = "opendir";
                label = "open dir";
                bind = "ctrl Return";
              }
              {
                action = "copypath";
                label = "copy path";
                bind = "ctrl shift c";
              }
              {
                action = "copyfile";
                label = "copy file";
                bind = "ctrl c";
              }
              {
                action = "localsend";
                label = "localsend";
                bind = "ctrl l";
              }
              {
                action = "refresh_index";
                label = "reload";
                bind = "ctrl r";
                after = "AsyncReload";
              }
            ];
            todo = [
              {
                action = "save";
                default = true;
                bind = "Return";
                after = "AsyncClearReload";
              }
              {
                action = "save_next";
                label = "save & new";
                bind = "shift Return";
                after = "AsyncClearReload";
              }
              {
                action = "delete";
                bind = "ctrl d";
                after = "AsyncClearReload";
              }
              {
                action = "active";
                default = true;
                bind = "Return";
                after = "Nothing";
              }
              {
                action = "inactive";
                default = true;
                bind = "Return";
                after = "Nothing";
              }
              {
                action = "done";
                bind = "ctrl f";
                after = "Nothing";
              }
              {
                action = "change_category";
                bind = "ctrl y";
                label = "change category";
                after = "Nothing";
              }
              {
                action = "clear";
                bind = "ctrl x";
                after = "AsyncClearReload";
              }
              {
                action = "create";
                bind = "ctrl a";
                after = "AsyncClearReload";
              }
              {
                action = "search";
                bind = "ctrl a";
                after = "AsyncClearReload";
              }
            ];
            runner = [
              {
                action = "run";
                default = true;
                bind = "Return";
              }
              {
                action = "runterminal";
                label = "run in terminal";
                bind = "shift Return";
              }
            ];
            symbols = [
              {
                action = "run_cmd";
                label = "select";
                default = true;
                bind = "Return";
              }
            ];
            unicode = [
              {
                action = "run_cmd";
                label = "select";
                default = true;
                bind = "Return";
              }
            ];
            clipboard = [
              {
                action = "copy";
                default = true;
                bind = "Return";
              }
              {
                action = "remove";
                bind = "ctrl d";
                after = "AsyncClearReload";
              }
              {
                action = "remove_all";
                label = "clear";
                bind = "ctrl shift d";
                after = "AsyncClearReload";
              }
              {
                action = "show_images_only";
                label = "only images";
                bind = "ctrl i";
                after = "AsyncClearReload";
              }
              {
                action = "show_text_only";
                label = "only text";
                bind = "ctrl i";
                after = "AsyncClearReload";
              }
              {
                action = "show_combined";
                label = "show all";
                bind = "ctrl i";
                after = "AsyncClearReload";
              }
              {
                action = "pause";
                bind = "ctrl shift p";
              }
              {
                action = "unpause";
                bind = "ctrl shift p";
              }
              {
                action = "unpin";
                bind = "ctrl p";
                after = "AsyncClearReload";
              }
              {
                action = "pin";
                bind = "ctrl p";
                after = "AsyncClearReload";
              }
              {
                action = "edit";
                bind = "ctrl o";
              }
              {
                action = "localsend";
                bind = "ctrl l";
              }
            ];
            niriactions = [{
              action = "execute";
              bind = "Return";
            }];
          };
        };
      };

    themes = {
      "catppuccin-macchiato-blue" = {
        style = (builtins.readFile ./style.css);

        # Modify the layout to remove hardcoded margins and gaps.
        layouts = {
          "layout" = (builtins.readFile ./layout.xml);
          "keybind" = (builtins.readFile ./keybind.xml);
        };
      };
    };
  };

  # home.file.walker.source = ./../walker;
  # home.file.walker.target = ".config/walker/";
  # home.file.walker.recursive = true;
}
