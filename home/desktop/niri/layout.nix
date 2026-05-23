{ ... }: {
  programs.niri.settings.layout = {
    gaps = 10;

    # When to center a column when changing focus, options are:
    # - "never", default behavior, focusing an off-screen column will keep at the left
    #   or right edge of the screen.
    # - "always", the focused column will always be centered.
    # - "on-overflow", focusing a column will center it if it doesn't fit
    #   together with the previously focused column.
    center-focused-column = "on-overflow";

    preset-column-widths = [
      { proportion = 1.0 / 3.0; }
      { proportion = 2.0 / 3.0; }
      { proportion = 3.0 / 3.0; }
      # { fixed = 1920; }
    ];

    # You can change the default width of the new windows.
    default-column-width = { proportion = 2.0 / 3.0; };

    # You can change how the focus ring looks.
    # remeber that colors can be gardients too
    focus-ring = {
      enable = false;
      width = 2;
      active.color = "#8aadf4";
      urgent.color = "#ed8796";
    };

    border = {
      enable = true;
      width = 2;
      active.color = "#8aadf4";
      inactive.color = "#24273a";
      urgent.color = "#ed8796";
    };

    # Struts shrink the area occupied by windows, similarly to layer-shell panels.
    # You can think of them as a kind of outer gaps. They are set in logical pixels.
    struts = {
      left = 50;
      right = 50;
    };
  };
}
