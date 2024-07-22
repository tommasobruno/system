{ ... }: {

  programs.nixvim.plugins.lsp = {
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

      # Use with nix-shell
      zls = {
        enable = true;
        package = null;
        settings = { build_on_save = true; };
      };
      clangd = {
        enable = true;
        package = null;
      };
      gopls = {
        enable = true;
        package = null;
      };
      tsserver = {
        enable = true;
        package = null;
      };
      rust-analyzer = {
        enable = true;
        package = null;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
