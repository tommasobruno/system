{ lib, config, ... }:
with lib;
let cfg = config.nvim.lsp;
in {
  options = {
    nvim.lsp = {
      enable_gopls = mkEnableOption "Enable go lsp server";
      enable_zls = mkEnableOption "Enable zig lsp server";
      enable_clangd = mkEnableOption "Enable c/c++ lsp server";
      enable_rust_analyzer = mkEnableOption "Enable rust lsp server";
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
          yamlls.enable = true;
          zls = mkIf cfg.enable_zls {
            enable = true;
            settings = { enable_build_on_save = true; };
          };
          clangd = mkIf cfg.enable_clangd { enable = true; };
          gopls = mkIf cfg.enable_gopls { enable = true; };
          rust-analyzer = mkIf cfg.enable_rust_analyzer {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}

