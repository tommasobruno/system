{ pkgs, ... }: {

  git = {
    username = "tommasobruno";
    email = "bruno.tommaso@protonmail.com";
  };

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
