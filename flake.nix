{
  description = "Tommaso Bruno's darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      macosLib = import ./lib/macOS.nix {
        inherit inputs;
        lib = nixpkgs.lib;
      };

      macOS_personal_system = "aarch64-darwin";
    in {
      formatter.${macOS_personal_system} =
        nixpkgs.legacyPackages.aarch64-darwin.nixfmt-classic;

      darwinConfigurations = with macosLib; {
        personal = mkMacOS {
          macModule = ./hosts/macbook-m2p/darwin.nix;
          homeModule = ./hosts/macbook-m2p/home.nix;
          system = macOS_personal_system;
          hostname = "tommasobruno";
        };
      };
    };
}
