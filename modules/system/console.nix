{ pkgs, ... }: {
  console = {
    useXkbConfig = true;
    colors = [
      "181926"
      "d20f39"
      "40a02b"
      "df8e1d"
      "1e66f5"
      "ea76cb"
      "179299"
      "939ab7"
      "363a4f"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cad3f5"
    ];
  };

  services.kmscon = {
    enable = true;
    useXkbConfig = true;
    hwRender = true;
    extraConfig = ''
      palette=custom
      palette-black=24, 25, 38
      palette-red=210, 15, 57
      palette-green=64, 160, 43
      palette-yellow=223, 142, 29
      palette-blue=30, 102, 245
      palette-magenta=234, 118, 203
      palette-cyan=23, 146, 153
      palette-light-grey=147, 154, 183
      palette-dark-grey=54, 58, 79
      palette-light-red=237, 135, 150
      palette-light-green=166, 218, 149
      palette-light-yellow=238, 212, 159
      palette-light-blue=138, 173, 244
      palette-light-magenta=245, 189, 230
      palette-light-cyan=139, 213, 202
      palette-white=202, 211, 245
      palette-foreground=202, 211, 245
      palette-background=24, 25, 38

      font-size=18
    '';
    fonts = [ { name = "FiraCode Nerd Font"; package = pkgs.nerd-fonts.fira-code; } ];
  };
}
