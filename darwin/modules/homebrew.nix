{ lib, config, ... }:
with lib;
let cfg = config.homebrew;
in {
  options = {
    homebrew = {
      installCasks = mkOption {
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
      casks = cfg.installCasks;
    };
  };
}
