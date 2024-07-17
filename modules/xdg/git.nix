{ lib, config, ... }:
with lib;
let cfg = config.xdg.git;
in {
  options = {
    xdg.git = with types; {
      username = mkOption {
        type = str;
        description = "Git username";
      };
      email = mkOption {
        type = str;
        description = "Git email";
      };
    };
  };

  config = {
    programs.git = {
      enable = true;

      userEmail = cfg.email;
      userName = cfg.username;

      extraConfig = {
        pull.rebase = true;
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
    };
  };
}
