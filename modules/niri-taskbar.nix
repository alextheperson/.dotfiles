{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage
rec {
  pname = "niri-taskbar";
  version = "0.3.0+niri.25.08";

  cargoHash = "sha256-Ql9iqbbS3DY7o5/PR96c2t4VXKoS1kjZ9k3SfhNdbzE=";

  src = fetchFromGitHub {
    owner = "LawnGnome";
    repo = "niri-taskbar";
    tag = "v${version}";
    hash = "sha256-Gbzh4OTkvtP9F/bfDUyA14NH2DMDdr3i6oFoFwinEAg=";
  };

  nativeBuildInputs = [
    pkg-config
    glib
  ];

  buildInputs = [
    gtk3
    at-spi2-atk
    pango
    cairo
    glib
    gdk-pixbuf
    libpeas2
  ];

  installFlags = [ "PREFIX=$(out)" ];

  outputs = [
    "out"
  ];

  meta = {
    description = "Niri taskbar module for Waybar";
    homepage = "https://github.com/LawnGnome/niri-taskbar/";
    license = lib.licenses.mit;
    # maintainers = [ lib.maintainers.oncaged ];

    # inherit (hyprland.meta) platforms;
    platforms = lib.platforms.linux;
  };
}
