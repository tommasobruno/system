{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Personal apps
      obsidian
    ];
}

