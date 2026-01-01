{ config, pkgs, inputs, ... }: {
  # You might be wondering why I'm not using the homeModules here. At the time
  # that I made this, those didn't seem to work. You should try it to see if
  # it works now.
  home.packages = [
    inputs.vicinae.packages.aarch64-linux.default
  ];

  # I write the config as jsonc, for accurate syntax highlighting, but it needs
  # the file as json (even though it has comments).
  home.file.vicinae.source = ./settings.jsonc;
  home.file.vicinae.target = ".config/vicinae/settings.json";
}
