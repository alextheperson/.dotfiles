# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/?rev=20075955deac2583bb12f07151c2df830ef346b4";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/?rev=b99bf9bf7445416fe55da09034fc4a6cd733805c";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz/?rev=e17059b308699b7fe60764b5c22e0872af04939b";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    todo-rs = {
      url = "github:alextheperson/todo-rs/?rev=cbb1ab4469397b7281dcbadf16c54290f43ee1b2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/?rev=9eab59f3e71ea3a725e4817d8dcf0da0824ad19d";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix/?rev=d75e3fe67f49728cb5035bc791f4b9065ff3a2c9";
    nix-alien.url = "github:thiagokokada/nix-alien/?rev=e62b3ad75e8c9a5e505fc78b9b40eed1178634cb";
    hyprland.url = "github:hyprwm/Hyprland/?rev=88326075743a677e76645ff163b392490419d4de";
  };
  outputs = inputs@{ self, nixpkgs, home-manager, apple-silicon, catppuccin, nix-alien, dmm, todo-rs, ... }: {
    nixosConfigurations.serafina = nixpkgs.lib.nixosSystem {
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
              catppuccin.homeModules.catppuccin
            ];
          };

          home-manager.extraSpecialArgs = { inherit nix-alien todo-rs; };
        }
      ];
    };
  };
}
