{ pkgs, ... }: {

  home = {
    sessionPath = [ "/opt/homebrew/bin" ];

    packages = with pkgs; [ nodejs_22 ];
  };

  imports = [ ./config/git.nix ./config/shell.nix ./config/wezterm.nix ];
}
