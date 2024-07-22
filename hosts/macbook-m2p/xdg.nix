{ ... }: {
  imports = [ ./software.nix ];

  xdg = {
    git = {
      username = "tommasobruno";
      email = "bruno.tommaso@protonmail.com";
    };

    nvim = {
      obsidian = {
        enable = true;
        workspaces = [{
          name = "personal";
          path = "~/obsidian/personal";
        }];
      };
    };
  };
}

