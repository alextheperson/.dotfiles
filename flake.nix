# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    todo-rs = {
      url = "github:alextheperson/todo-rs/main";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
      # Cannot follow nixpkgs, because that misses the Cachix cache, without
      # which, the build fails.
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    catppuccin = {
      url = "github:catppuccin/nix/";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien/";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    niri = {
      url = "github:sodiboo/niri-flake/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };
  outputs = inputs@{ self, nixpkgs-stable, home-manager, nixpkgs-unstable, ... }: {
    nixosConfigurations.serafina = nixpkgs-stable.lib.nixosSystem
      {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = nixpkgs-unstable.legacyPackages.${prev.system};
                # use this variant if unfree packages are needed:
                # unstable = import nixpkgs-unstable {
                #   inherit prev;
                #   system = prev.system;
                #   config.allowUnfree = true;
                # };
              })
            ];
          }
          ./modules/serafina.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = {
              imports = [
                ./home/serafina.nix
                inputs.catppuccin.homeModules.catppuccin
              ];
            };

            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    nixosConfigurations.iorek = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        {
          nixpkgs.overlays = [
            (final: prev: {
              unstable = nixpkgs-unstable.legacyPackages.${prev.system};
              # use this variant if unfree packages are needed:
              # unstable = import nixpkgs-unstable {
              #   inherit prev;
              #   system = prev.system;
              #   config.allowUnfree = true;
              # };
            })
          ];
        }
        ./modules/iorek.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = {
            imports = [
              ./home/iorek.nix
              inputs.catppuccin.homeModules.catppuccin
            ];
          };

          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
