{ pkgs, ... }: {

  home = {
    sessionPath = [ "/opt/homebrew/bin" ];
    stateVersion = "23.11";

    packages = with pkgs; [ nodejs_22 ];
  };

  imports = [ ./terminal/git.nix ./terminal/shell.nix ./terminal/wezterm.nix ];
}
