# /etc/nixos/flake.nix
{
  inputs = {
    # I can't wait till 25.11 is stable!!
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/?rev=b99bf9bf7445416fe55da09034fc4a6cd733805c";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    todo-rs = {
      url = "github:alextheperson/todo-rs/stable";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    catppuccin = {
      url = "github:catppuccin/nix/?rev=d75e3fe67f49728cb5035bc791f4b9065ff3a2c9";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien/?rev=e62b3ad75e8c9a5e505fc78b9b40eed1178634cb";
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
