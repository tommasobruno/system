{ lib, config, ... }:
with lib;
let cfg = config.os.macOs.homebrew;
in {
  options = {
    os.macOs.homebrew = {
      casks = mkOption {
        type = with types; listOf str;
        description = "Homebrew casks to install";
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
    };
  };
}
