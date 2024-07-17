{ lib, config, ... }:
with lib;
let cfg = config.os.macOs.dock;
in {
  options = {
    os.macOs.dock = with types; {
      apps = mkOption {
        type = listOf str;
        description = "Which apps to always show in the dock";
      };
      hide = mkOption {
        type = bool;
        description = "Whether to automatically hide the dock";
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
      autohide = cfg.hide;
      persistent-apps = cfg.apps;
    };
  };
}
