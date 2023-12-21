{
  description = "Jejomar's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      config = { allowUnfree = true; };
    in {
      nixosConfigurations = {
        rosy = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/ideapad330s/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        jejomar = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
