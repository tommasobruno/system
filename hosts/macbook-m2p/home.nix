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
      go.enable = true;
      zig.enable = true;
      c.enable = true;
      rust.enable = true;
      typescript.enable = true;

      extra_formatters = with pkgs; [ prettierd nixfmt-classic ];
    };

    treesitter_parsers = [
      "zig"
      "go"
      "html"
      "typescript"
      "javascript"
      "cpp"
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
