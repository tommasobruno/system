{ lib, config, ... }:
let cfg = config.git;
in {
  options = {
    git = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Git username";
      };
      email = lib.mkOption {
        type = lib.types.str;
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
