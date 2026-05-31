{ ... }: {
  networking.wireless= {
    enable = false;
    iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
  };
  networking.networkmanager.wifi.backend = "iwd";
}
