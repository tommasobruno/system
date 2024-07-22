{ ... }: {
  programs.nixvim.plugins = {
    oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
          is_always_hidden = ''
            function(name, _)
              local ignores = { '..', '.git', '.DS_Store', '.obsidian', 'node_modules', '.zig-cache', 'zig-out' }
              for _, ignore in ipairs(ignores) do
                if ignore == name then
                  return true
                end
              end
              return false
            end
          '';
        };
      };
    };
  };
}

