{ ... }: {

  programs.home-manager.enable = true;

  home = {
    sessionPath = [ "/opt/homebrew/bin" ];
    stateVersion = "24.11";
  };

  imports = [ ./modules ];
}
