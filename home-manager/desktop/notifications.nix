{ ... }: {
  services.blueman-applet.enable = true;

  services.mako = {
    enable = true;
    settings = {
      anchor = "bottom-right";
      border-size = 2;
      border-radius = 2;
      default-timeout = 15000;
    };
  };

  services.kdeconnect.enable = true;
}
