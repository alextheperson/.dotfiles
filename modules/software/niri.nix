{ pkgs, ... }: {
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };
  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ]; # or "kde"
  };
}
