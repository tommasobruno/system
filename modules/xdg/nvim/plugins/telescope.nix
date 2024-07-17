{ ... }: {
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      keymaps = {
        "<leader>p" = {
          action = "find_files";
          options.desc = "Telescope Find Files";
        };
        "<leader>gp" = {
          action = "git_files";
          options.desc = "Telescope Git Files";
        };
      };
    };
  };
}

