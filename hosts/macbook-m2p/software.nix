{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Personal apps
    obsidian

    # Coding
    zig
    go
    nodejs_22
    rustup
  ];
}

