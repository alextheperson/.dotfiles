{ ... }: {
  # Collect garbage, and delete generations more than 14 days old
  nix.gc = {
    automatic = true;
    randomizedDelaySec = "14m";
    options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    randomizedDelaySec = "14m";
  };

  # I believe this helps electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Use flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # For Nix-Alien
  programs.nix-ld.enable = true;
}
