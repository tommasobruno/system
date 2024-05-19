{ self, nix-darwin, nixvim, home-manager }: {

  mkMacOS = { macModule, system }:

    let
      common = {

        # Nix settings
        nix = {
          settings = {
            experimental-features = "nix-command flakes";
            auto-optimise-store = true;
          };
        };

        nixpkgs = { hostPlatform = system; };
        services.nix-daemon.enable = true;

        system.configurationRevision = self.rev or self.dirtyRev or null;
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
        };

      };
    in nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        common
        nixvim.nixDarwinModules.nixvim
        home-manager.darwinModules.home-manager
        macModule
      ];
    };
}
