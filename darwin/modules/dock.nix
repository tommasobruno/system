{ lib, config, ... }:
with lib;
let cfg = config.dock;
in {
  options = {
    dock = {
      apps = mkOption {
        type = with types; listOf str;
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
