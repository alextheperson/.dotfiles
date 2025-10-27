{ inputs, ... }: {
  home.packages = with inputs; [
    dmm.packages.aarch64-linux.default
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
