{ pkgs, ... }: {
  # For some reason, this isn't happening automatically. This is needed for niri
  services.displayManager.sessionPackages = [ pkgs.unstable.niri ];
  systemd.packages = [ pkgs.unstable.niri ];
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  environment.systemPackages =
    with pkgs;
    [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      unstable.niri
    ];
}
