{ lib, config, ... }:
with lib;
let cfg = config.os.macOs.homebrew;
in {
  options = {
    os.macOs.homebrew = with types; {
      casks = mkOption {
        type = listOf str;
        description = "Which homebrew casks to install";
      };
      brews = mkOption {
        type = listOf str;
        description = "Which homebrew brews to intsall";
      };
    };
  };
  config = {
    homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
      };
      casks = cfg.casks;
      brews = cfg.brews;
    };
  };
}
