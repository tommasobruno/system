{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.xdg.nvim.dev;

  formatters_set = {
    zig = "zigfmt";
    c = "clang-format";
    rust = "rustfmt";
    go = "gofmt";
    typescript = "prettierd";
  };

  servers_language_map = {
    zls = "zig";
    gopls = "go";
    tsserver = "typescript";
    rust-analyzer = "rust";
    clangd = "c";
  };

  servers_set = {
    zls = {
      enable = true;
      settings = { build_on_save = true; };
    };

    clangd = { enable = true; };
    gopls = { enable = true; };
    tsserver = { enable = true; };
    rust-analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
    };
  };

  enabled_formatters =
    builtins.mapAttrs (l: v: if builtins.getAttr l cfg then [ v ] else [ ])
    formatters_set;

  enabled_servers = builtins.mapAttrs (l: s:
    if builtins.getAttr (builtins.getAttr l servers_language_map) cfg then
      s
    else
      { }) servers_set;

in {
  options = {
    xdg.nvim.dev = {
      go = mkEnableOption "Whether to enable go dev setup";
      zig = mkEnableOption "Whether to enable zig dev setup";
      rust = mkEnableOption "Whether to enable rust dev setup";
      c = mkEnableOption "Whether to enable c/c++ dev setup";
      typescript = mkEnableOption "Whether to enable typescript dev setup";
    };
  };

  config = {
    programs.nixvim = {
      extraPackages = with pkgs;
        [ nixfmt-classic ] ++ (if cfg.typescript then [ prettierd ] else [ ]);

      plugins = {
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
          } // enabled_servers;
        };

        conform-nvim = {
          enable = true;
          formatOnSave = {
            timeoutMs = 500;
            lspFallback = true;
          };
          formattersByFt = { nix = [ "nixfmt" ]; } // enabled_formatters;
        };
      };
    };
  };
}

