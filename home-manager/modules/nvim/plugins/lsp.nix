{ lib, config, ... }:
with lib;
let cfg = config.nvim.lsp;
in {
  options = {
    nvim.lsp = {
      gopls = mkEnableOption "Enable go lsp server";
      zls = mkEnableOption "Enable zig lsp server";
      clangd = mkEnableOption "Enable c/c++ lsp server";
      rust_analyzer = mkEnableOption "Enable rust lsp server";
      yamlls = mkEnableOption "Enable yaml lsp server";
    };
  };

  config = {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          lspBuf = {
            "K" = "hover";
            "gd" = "definition";
            "<leader>ca" = "code_action";
            "<leader>r" = "rename";
            "<leader>rr" = "references";
          };
          diagnostic = {
            "[d" = "goto_next";
            "]d" = "goto_prev";
            "<leader>e" = "open_float";
          };
        };
        servers = {
          nil-ls.enable = true;
          yamlls = mkIf cfg.yamlls { enable = true; };
          zls = mkIf cfg.zls {
            enable = true;
            settings = { build_on_save = true; };
          };
          clangd = mkIf cfg.clangd { enable = true; };
          gopls = mkIf cfg.gopls { enable = true; };
          rust-analyzer = mkIf cfg.rust_analyzer {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}

