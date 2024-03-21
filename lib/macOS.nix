{ self, zig, nix-darwin, nixvim, home-manager }: {

  mkMacOS = { macModule }:

    let
      system = "aarch64-darwin";
      common = {
        nix = {
          settings = {
            experimental-features = "nix-command flakes";
            auto-optimise-store = true;
          };
        };

        system.configurationRevision = self.rev or self.dirtyRev or null;
        security.pam.enableSudoTouchIdAuth = true;

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        system = {

          stateVersion = 4;

          defaults = {
            loginwindow = {
              SHOWFULLNAME = false;
              GuestEnabled = false;
            };

            dock = {
              launchanim = false;
              magnification = false;
              minimize-to-application = true;
              mineffect = null;
              show-recents = false;
              tilesize = 48;
              static-only = true;
              autohide = true;
            };
          };
        };

        nixpkgs = {
          hostPlatform = system;
          overlays = [ zig.overlays.default ];
        };
        services.nix-daemon.enable = true;

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
