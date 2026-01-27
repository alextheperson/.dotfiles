{ pkgs, ... }: {

  home.packages = with pkgs; [
    # 2D
    krita
    gimp
    (inkscape-with-extensions.override {
      inkscapeExtensions = with inkscape-extensions; [
        inkstitch
      ];
    })

    # 3D
    blender

    # Audio
    audacity

    # Video
    kdePackages.kdenlive
  ];
}
