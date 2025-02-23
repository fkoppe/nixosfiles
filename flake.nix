{
  description = "NixOs configuration of Felix Koppe";

  inputs = {
    # Nix ecosystem
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Disco
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Impermanence
    impermanence = {
      url = "github:nix-community/impermanence";
    };

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # VsCode extensions
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, nixpkgs-unstable, ...} @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unstable = import nixpkgs-unstable { inherit system; };
    in {
      # Laptop
      nixosConfigurations.r2d2xx = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/r2d2xx

          inputs.disko.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          inputs.impermanence.nixosModules.impermanence
          ];
      };

      ## Desktop
      #nixosConfigurations.c3poxx = nixpkgs.lib.nixosSystem {
      #  inherit system;
      #  modules = [ ./hosts/c3poxx inputs.home-manager.nixosModules.home-manager ];
      #};
    };
}
