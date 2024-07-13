{ ... }: {
  programs.nixvim.plugins = {
    oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
          is_always_hidden = ''
            function(name, _)
              return name == '..' or name == '.git' or name == '.DS_Store' or name == '.obsidian'
            end
          '';
        };
      };
    };
  };
}

