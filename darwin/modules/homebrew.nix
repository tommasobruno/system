{ lib, config, ... }:
let cfg = config.homebrew;
in {
  options = {
    homebrew = {
      installCasks = lib.mkOption {
        type = lib.types.listOf lib.types.str;
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
