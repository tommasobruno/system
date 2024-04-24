{ pkgs, ... }:
{

  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.packages = with pkgs; [
    # Basic
    nodejs_21
    bun

    # Languages
    zigpkgs.master
    rustup
    go

    # hugo
    hugo
  ];

  imports = [ ./config ];
}
