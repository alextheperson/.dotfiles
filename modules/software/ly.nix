{batteryName, margin}: { ... }: {
  services.displayManager.ly = {
    enable = true;
    settings = {
      bigclock = "en";
      animation = "colormix";
      brightness_up_cmd = "brightnessctl -e4 -n0 set 5%+";
      brightness_down_cmd = "brightnessctl -e4 -n0 set 5%-";
      allow_empty_password = false;
      bigclock_seconds = true;
      edge_margin = margin;
      bg = "0x0001";
      error_fg = "0x0002";
      error_bg = "0x0001";
      battery_id = batteryName;
      clear_password = true;
      hide_key_hints = true;
      show_tty = true;
      shell = false;
      full_color = false;

      cmatrix_fg = "0x0003";
      cmatrix_head_col = "0x0008";

      colormix_col1 = "0x0007";
      colormix_col2 = "0x0005";
      colormix_col3 = "0x0006";

      doom_fire_spread = 1;
      doom_fire_height = 5;
    };
  };
}
