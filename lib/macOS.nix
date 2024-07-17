{ inputs, lib, }: {
  mkMacOS = { macModule, homeModule, system, hostname }:
    let

      os_modules = import ../modules/os;
      xdg_modules = import ../modules/xdg;

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
      modules = [
        nix-common
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {
              imports = [
                inputs.nixvim.homeManagerModules.nixvim
                xdg_modules
                homeModule
              ];
            };
          };
        }
        os_modules
        macModule
      ];
    };
}
