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

    dev = {
      go = true;
      zig = true;
      c = true;
      rust = true;
      typescript = true;

      extra_formatters = with pkgs; [ prettierd ];
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
