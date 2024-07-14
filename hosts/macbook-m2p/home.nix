{ pkgs, ... }: {
  git = {
    username = "tommasobruno";
    email = "bruno.tommaso@protonmail.com";
  };

  nvim = {
    obsidian = {
      enable = true;
      workspaces = [{
        name = "personal";
        path = "~/obsidian/personal";
      }];
    };

    lsp = {
      enable_gopls = true;
      enable_zls = true;
      enable_clangd = true;
      enable_rust_analyzer = true;
    };

    treesitter_parsers = [
      "zig"
      "go"
      "yaml"
      "html"
      "typescript"
      "javascript"
      "cpp"
      "glsl"
      "c"
      "markdown"
      "markdown_inline"
    ];
  };

  home.packages = with pkgs; [
    # Personal apps
    obsidian

    # Coding
    zig
    go
    nodejs_22
    rustup

    # Tools
    ripgrep
  ];
}
