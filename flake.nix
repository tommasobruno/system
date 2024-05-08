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

    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = inputs@{ self, zig, home-manager, nixvim, nix-darwin, nixpkgs, }:
    let
      macosLib = import ./lib/macOS.nix {
        inherit zig nix-darwin nixvim home-manager self;
      };
    in {
      formatter.aarch64-darwin =
        nixpkgs.legacyPackages.aarch64-darwin.nixfmt-classic;

      darwinConfigurations = with macosLib; {
        personal = mkMacOS { macModule = ./machines/personal.nix; };
      };
    };
}
