{ ... }: {

  programs.git = {
    enable = true;

    userEmail = "bruno.tommaso@protonmail.com";
    userName = "tommasobruno";

    extraConfig = {
      pull.rebase = true;
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };

}
