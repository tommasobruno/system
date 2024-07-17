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
      macosLib = import ./lib/mkMacOS.nix {
        inherit inputs;
        lib = nixpkgs.lib;
      };

      macOS_personal_system = "aarch64-darwin";
    in {
      formatter.${macOS_personal_system} =
        nixpkgs.legacyPackages.${macOS_personal_system}.nixfmt-classic;

      darwinConfigurations = with macosLib; {
        personal = mkMacOS {
          macModule = ./hosts/macbook-m2p/os.nix;
          homeModule = ./hosts/macbook-m2p/xdg.nix;
          system = macOS_personal_system;
          hostname = "tommasobruno";
        };
      };

      packages.${macOS_personal_system}.default =
        nixpkgs.legacyPackages.${macOS_personal_system}.nixfmt-classic;
    };
}
