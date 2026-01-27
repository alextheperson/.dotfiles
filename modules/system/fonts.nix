{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
  fonts.fontDir.enable = true;
}
