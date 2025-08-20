# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon/";
    };

    dmm = {
      url = "tarball+https://git.fawkes.io/mtnash/dmm/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, apple-silicon, ... }: {
    nixosConfigurations.serafina = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
  };
}
