{ pkgs, ... }: {
  home.file.fonts.source = ./.;
  home.file.fonts.target = ".local/share/fonts";
  home.file.fonts.recursive = true;


  home.packages = with pkgs; [
    # General
    merriweather
    liberation_ttf
    libre-franklin
    quicksand

    # Mono
    nerd-fonts.fira-code
    nerd-fonts.fantasque-sans-mono

    # Emoji
    noto-fonts-monochrome-emoji

    # Fun
    font-awesome
    ocr-a
    _7-segment-font
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["Merriweather" "Libre Franklin" "Liberation Serif"];
      sansSerif = ["Merriweather Sans" "Liberation Sans"];
      monospace = ["Fira Code Nerd Font" "FantasqueSansM Nerd Font"];
      emoji = ["Noto Emoji" "Noto Color Emoji"];
    };
  };
}
