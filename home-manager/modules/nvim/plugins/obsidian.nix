{ ... }: {
  programs.nixvim.plugins = {
    obsidian = {
      enable = true;
      settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        mappings = {
          "<leader>fn" = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              buffer = true;
              expr = true;
              noremap = false;
            };
          };
        };
        ui.enable = true;
        workspaces = [{
          name = "personal";
          path = "~/obsidian/personal";
        }];
        yaml_parser = "native";
      };
    };
  };
}

