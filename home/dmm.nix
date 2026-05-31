{ inputs, pkgs, ... }: {
  home.packages = with inputs; [
    dmm.packages.${pkgs.stdenv.hostPlatform.system}.default
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
