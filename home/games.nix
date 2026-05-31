{ pkgs, ... }: {
  home.packages = with pkgs; [
    supertuxkart
    xonotic
    prismlauncher
    openttd
  ];
}
