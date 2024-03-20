{ pkgs, ... }: {

  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.packages = with pkgs; [
    # Dev
    zig
    rustup
    lua5_4_compat	    
    go
  ];

  imports = [ ./config ];
}
