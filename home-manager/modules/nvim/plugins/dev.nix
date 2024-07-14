{ lib, config, ... }:
with lib;
let cfg = config.nvim.dev;
in {
  options = {
    nvim.dev = {
      go = mkEnableOption "Enable go dev setup";
      zig = mkEnableOption "Enable zig dev setup";
      c = mkEnableOption "Enable c/c++ dev setup";
      rust = mkEnableOption "Enable rust dev setup";
      typescript = mkEnableOption "Enable typescript dev setup";
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
          # Always have
          nil-ls.enable = true;
          yamlls.enable = true;

          # Rest
          zls = mkIf cfg.zig {
            enable = true;
            settings = { build_on_save = true; };
          };
          clangd = mkIf cfg.c { enable = true; };
          gopls = mkIf cfg.go { enable = true; };
          tsserver = mkIf cfg.typescript { enable = true; };
          rust-analyzer = mkIf cfg.rust {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      conform-nvim = {
        enable = true;
        formatOnSave = {
          timeoutMs = 500;
          lspFallback = true;
        };
        formattersByFt = {
          nix = [ "nixfmt" ];
          zig = mkIf cfg.zig [ "zigfmt" ];
          cpp = mkIf cfg.c [ "clang-format" ];
          c = mkIf cfg.c [ "clang-format" ];
          go = mkIf cfg.go [[ "gofmt" "goimports" ]];
          rust = mkIf cfg.rust [ "rustfmt" ];
          typescript = mkIf cfg.typescript [ "prettierd" ];
        };
      };

    };
  };
}

