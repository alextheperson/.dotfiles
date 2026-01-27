{ pkgs, ... }: {
  home.packages = with pkgs; [
    rink
  ];

  xdg.desktopEntries = {
    rink = {
      name = "Rink";
      genericName = "Calculator";
      exec = "rink";
      terminal = true;
      categories = [ "Math" ];
    };
  };

  home.file.rink.source = ./config.toml;
  home.file.rink.target = ".config/rink/config.toml";
}
