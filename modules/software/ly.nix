{ ... }: {
  services.displayManager.ly = {
    enable = true;
    settings = {
      bigclock = "en";
      animation = "matrix";
      brightness_up_cmd = "brightnessctl -e4 -n0 set 5%+";
      brightness_down_cmd = "brightnessctl -e4 -n0 set 5%-";
      allow_empty_password = false;
      bigclock_seconds = true;
    };
  };
}
