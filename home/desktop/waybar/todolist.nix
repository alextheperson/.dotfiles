{ performanceCores, efficiencyCores, hasNotch }:
(
  let
    modules = import ./modules.nix { inherit performanceCores efficiencyCores; };
  in
  [
    {
      "layer" = "top";
      "exclusive" = false;
      "position" = "left";
      "name" = "todo-bar";
      "modules-left" = [ "custom/todo" ];
      "reload_style_on_change" = true;

      inherit (modules) "custom/todo";
    }
  ]
)
