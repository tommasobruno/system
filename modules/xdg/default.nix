{ ... }: {

  # Allow home-manager to manage itself
  programs.home-manager.enable = true;

  # Basic home-manager settings
  home = {
    sessionPath = [ "/opt/homebrew/bin" ];
    stateVersion = "24.11";
  };

  imports = [ ./git.nix ./nvim ./shell.nix ./wezterm.nix ];
}
