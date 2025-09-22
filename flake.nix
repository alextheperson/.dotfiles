# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/?rev=b99bf9bf7445416fe55da09034fc4a6cd733805c";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    todo-rs = {
      url = "github:alextheperson/todo-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    nix-alien.url = "github:thiagokokada/nix-alien";
    hyprland.url = "github:hyprwm/Hyprland";
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
