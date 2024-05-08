{ pkgs, ... }: {

  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.packages = with pkgs; [
    # Basic
    nodejs_22
    bun

    # Languages
    zigpkgs.master
    go
  ];

  imports = [ ./config ];
}
