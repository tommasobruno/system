{ lib, config, ... }:
let cfg = config.dock;
in {
  options = {
    dock = {
      apps = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "Apps to show in the dock";
      };
    };
  };

  config = {
    system.defaults.dock = {
      launchanim = false;
      magnification = false;
      minimize-to-application = true;
      mineffect = null;
      tilesize = 48;
      autohide = true;
      persistent-apps = cfg.apps;
    };
  };
}
