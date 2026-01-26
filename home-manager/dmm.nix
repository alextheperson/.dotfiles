{ inputs, pkgs, ... }: {
  home.packages = with inputs; [
    dmm.packages.${pkgs.system}.default
  ];

  xdg.desktopEntries = {
    dmm = {
      name = "DMM";
      genericName = "Music Player";
      exec = "dmm player";
      terminal = true;
      categories = [ "Music" "Audio" ];
    };
  };
}
