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
      hide = mkEnableOption "Hide dock";
    };
  };

  config = {
    system.defaults.dock = {
      launchanim = false;
      magnification = false;
      minimize-to-application = true;
      mineffect = null;
      tilesize = 48;
      autohide = cfg.hide;
      persistent-apps = cfg.apps;
    };
  };
}
