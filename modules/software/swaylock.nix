{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.swaylock = { };

  environment.systemPackages =
    with pkgs;
    [
      swaylock-effects
    ];
}
