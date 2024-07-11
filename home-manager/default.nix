{ ... }: {
  home = {
    sessionPath = [ "/opt/homebrew/bin" ];
    stateVersion = "23.11";
  };

  imports = [ ./modules ];
}
