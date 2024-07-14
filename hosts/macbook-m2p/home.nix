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
      go = false;
      zig = true;
      c = true;
      rust = true;
      typescript = true;
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
