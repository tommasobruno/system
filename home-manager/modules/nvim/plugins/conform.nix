{ ... }: {
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      formatOnSave = {
        timeoutMs = 500;
        lspFallback = true;
      };
      formattersByFt = {
        zig = [ "zigfmt" ];
        nix = [ "nixfmt" ];
        cpp = [ "clang-format" ];
        c = [ "clang-format" ];
        go = [[ "gofmt" "goimports" ]];
        rust = [ "rustfmt" ];
      };
    };
  };
}

