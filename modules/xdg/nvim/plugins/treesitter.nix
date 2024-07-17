{ lib, config, ... }:
with lib;
let cfg = config.xdg.nvim.dev;
in {
  options = {
    xdg.nvim.dev = {
      treesitter_parsers = mkOption {
        type = with types; listOf str;
        description = "Which treesitter parsers to install";
      };
    };
  };

  config = {
    programs.nixvim.plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = false;
          };
          parser_install_dir = "~/.config/nvim/treesitter";
          ensure_installed = [ "nix" "yaml" ] ++ cfg.treesitter_parsers;
        };
      };
    };
  };
}

