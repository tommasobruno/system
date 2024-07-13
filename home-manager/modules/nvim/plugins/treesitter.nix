{ ... }: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
        parser_install_dir = "~/.config/nvim/treesitter";
        ensure_installed = [
          "zig"
          "go"
          "yaml"
          "html"
          "typescript"
          "javascript"
          "nix"
          "cpp"
          "glsl"
          "c"
          "markdown"
          "markdown_inline"
        ];
      };
    };
  };
}

