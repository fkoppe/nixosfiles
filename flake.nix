{
  description = "NixOs configuration of Felix Koppe";

  inputs = {
    # Nix ecosystem
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Plasma-Manager
    plasma-manager.url = "github:nix-community/plasma-manager";

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, plasma-manager, hardware, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unstable = import nixpkgs-unstable { inherit system; };
    in {
      # Laptop
      nixosConfigurations.r2d2xx = nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          [ ./hosts/r2d2xx/default.nix home-manager.nixosModules.home-manager ];
      };

      # Desktop
      nixosConfigurations.c3poxx = nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          [ ./hosts/c3poxx/default.nix home-manager.nixosModules.home-manager ];
      };
    };
}
