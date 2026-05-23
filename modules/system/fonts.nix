{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    libre-franklin 
  ];
  fonts.fontDir.enable = true;
}
