{ config, inputs, ... }:
(

  let
    nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.aarch64-linux;
    nixpkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.aarch64-linux;
  in

  {

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "alex";
    home.homeDirectory = "/home/alex";

    home.packages = (with nixpkgs-stable; [
      # Utils
      cliphist
      wayclip
      rofi-wayland
      libnotify
      playerctl
      brightnessctl
      fzf
      clang
      jq
      unzip
      zip
      libsecret
      git-credential-manager

      # TUI Utils
      btop
      neofetch
      streamrip
      pulsemixer
      pom

      # GUI Apps
      seahorse
      kiwix
      kdePackages.filelight
      webcord
      blender
      prusa-slicer
      thunderbird
      kicad
      superTuxKart
      krita
      gimp
      inkscape
      inkscape-extensions.inkstitch
      scribus
      audacity
    ]) ++ (with nixpkgs-unstable; [
      floorp-bin
    ]) ++ (with inputs; [
      nix-alien.packages.aarch64-linux.default
      todo-rs.packages.aarch64-linux.default
      dmm.packages.aarch64-linux.default
    ]);


    imports = [
      ./shell.nix
      ./waybar
      ./wallpaper
      ./niri
    ];

    services.blueman-applet.enable = true;
    services.mako = {
      enable = true;
      settings = {
        anchor = "bottom-right";
        border-size = 2;
        border-radius = 18;
        default-timeout = 15000;
      };
    };

    services.kdeconnect.enable = true;

    programs.git = {
      enable = true;
      userEmail = "git@alexsol.is";
      userName = "Alex Solis";
      extraConfig = {
        credential = {
          credentialStore = "secretservice";
          helper = "${nixpkgs-stable.git-credential-manager}/bin/git-credential-manager";
        };
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
      };
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    home.pointerCursor = {
      package = nixpkgs-stable.catppuccin-cursors.latteDark;
      name = "catppuccin-latte-dark-cursors";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };

    gtk = {
      enable = true;
      theme.name = "Adwaita";
      # iconTheme.name = "Adwaita";
      font.name = "Liberation Sans 11";
      # cursorTheme.name = "Adwaita";
      # cursorTheme.size = 24;
      gtk2.extraConfig = ''
        gtk-application-prefer-dark-theme = 1
      '';
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "blue";

      nvim.enable = false;
      waybar.enable = false;
      kitty.enable = false;
      hyprlock.enable = false;
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
)
