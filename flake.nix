{
  description = "Jejomar's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        rosy = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/ideapad330s/configuration.nix ];
      };
    };
  };
}
