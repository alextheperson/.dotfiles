{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage
rec {
  pname = "pandora";
  version = "1.0.0";

  cargoHash = "sha256-enZrVnzsQScDTFrU1awt/cAg6qdzyWtBoiGlVw/4C14=";

  src = fetchFromGitHub {
    owner = "PandorasFox";
    repo = "pandora";
    tag = "${version}";
    hash = "sha256-2CHU3qbqA70RXwz1jTmQgo60VT8SuNTfTYIZEKZuRwA=";
  };

  outputs = [
    "out"
  ];

  meta = {
    description = "wayland wallpaper daemon that can bind to compositor IPC for dynamic scrolling";
    homepage = "https://github.com/PandorasFox/pandora/";
    license = lib.licenses.gpl2;

    platforms = lib.platforms.linux;
  };
}
