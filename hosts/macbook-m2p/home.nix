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
      gopls = true;
      zls = true;
      clangd = true;
      rust_analyzer = true;
      yamlls = true;
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
