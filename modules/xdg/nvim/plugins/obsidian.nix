{ lib, config, ... }:
with lib;
let cfg = config.xdg.nvim.obsidian;
in {
  options = {
    xdg.nvim.obsidian = {
      enable = mkEnableOption "Whether to enable obsidian-nvim";
      workspaces = mkOption {
        type = with types;
          listOf (submodule {
            options = {
              name = mkOption {
                type = str;
                description = "Which name for the Obsidian workspace";
              };
              path = mkOption {
                type = str;
                description = "Which path for the Obsidian workspace";
              };
            };
          });
        description = "Obsidian workspaces";
      };
    };
  };

  config = mkIf cfg.enable {
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
          workspaces = cfg.workspaces;
          yaml_parser = "native";
        };
      };
    };
  };
}

