{ ... }: {
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
        zls = {
          enable = true;
          settings = { enable_build_on_save = true; };
        };
        clangd.enable = true;
        gopls.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };
  };
}

