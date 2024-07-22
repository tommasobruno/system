{ ... }: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      timeoutMs = 500;
      lspFallback = true;
    };
    formattersByFt = {
      # Always have
      nix = [ "nixfmt" ];

      # Use with nix-shell
      zig = [ "zigfmt" ];
      rust = [ "rustfmt" ];
      c = [ "clang-format" ];
      go = [ "gofmt" ];
      typescript = [ "prettierd" ];
    };
  };
}

