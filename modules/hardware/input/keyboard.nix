{ ... }: {
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak-mac";
  };

  console.useXkbConfig = true;
}
