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

  outputs = inputs@{ self, home-manager, nixvim, nix-darwin, nixpkgs }:
  let
    macosLib = import ./lib/macOS.nix {
        inherit nix-darwin nixvim home-manager self;
    };
  in {
    darwinConfigurations = with macosLib; {
      personal = mkMacOS { macModule = ./machines/personal.nix; };
    };
  };
}
