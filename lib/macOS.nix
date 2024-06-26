{ inputs, lib }: {

  mkMacOS = { macModule, homeModule, system, hostname }:

    let
      nix-common = {

        # Nix settings
        nix = {
          settings = {
            experimental-features = "nix-command flakes";
            auto-optimise-store = true;
          };
        };

        nixpkgs = { hostPlatform = system; };
        nixpkgs.config.allowUnfreePredicate = pkg:
          builtins.elem (lib.getName pkg) [ "obsidian" ];

        services.nix-daemon.enable = true;

        system.configurationRevision =
          inputs.self.rev or inputs.self.dirtyRev or null;
      };
    in inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        nix-common
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {
              imports = [
                inputs.nixvim.homeManagerModules.nixvim
                inputs.self.outputs.homeManagerModules.default
                homeModule
              ];
            };
          };
        }
        inputs.self.outputs.darwinModules.default
        macModule
      ];
    };
}
