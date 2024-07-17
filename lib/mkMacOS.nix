{ inputs, lib, }: {
  mkMacOS = { macModule, homeModule, system, hostname }:
    let
      os_modules = import ../modules/os;
      xdg_modules = import ../modules/xdg;
      nix_modules = import ../modules/nix;

    in inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit system; };
      modules = [
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
        nix_modules
        os_modules
        macModule
      ];
    };
}
