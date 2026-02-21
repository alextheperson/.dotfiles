{ pkgs, ... }: {
  home.packages = with pkgs; [
    superTuxKart
    xonotic
    prismlauncher
    openttd
  ];
}
