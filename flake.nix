# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/?rev=20075955deac2583bb12f07151c2df830ef346b4";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/?rev=b99bf9bf7445416fe55da09034fc4a6cd733805c";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz";
    };

    todo-rs = {
      url = "github:alextheperson/todo-rs/";
    };

    home-manager = {
      url = "github:nix-community/home-manager/?rev=9eab59f3e71ea3a725e4817d8dcf0da0824ad19d";
    };

    catppuccin.url = "github:catppuccin/nix/?rev=d75e3fe67f49728cb5035bc791f4b9065ff3a2c9";
    nix-alien.url = "github:thiagokokada/nix-alien/?rev=e62b3ad75e8c9a5e505fc78b9b40eed1178634cb";
    hyprland.url = "github:hyprwm/Hyprland/?rev=88326075743a677e76645ff163b392490419d4de";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };
  outputs = inputs@{ self, nixpkgs-stable, home-manager, nixpkgs-unstable, ... }: {
    nixosConfigurations.serafina = nixpkgs-stable.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = {
            imports = [
              ./home-manager/home.nix
              inputs.catppuccin.homeModules.catppuccin
            ];
          };

          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
