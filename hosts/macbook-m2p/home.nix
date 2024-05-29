{ pkgs, ... }: {

  git = {
    username = "tommasobruno";
    email = "bruno.tommaso@protonmail.com";
  };

  home.packages = with pkgs; [ obsidian ];

}
