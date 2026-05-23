{ ... }: {
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak-mac";
    options = "caps:swapescape,lv3:ralt_switch";
  };
}
