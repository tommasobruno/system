{ pkgs, ... }: {

  system = {
    stateVersion = 4;

    defaults.loginwindow = {
      SHOWFULLNAME = false;
      GuestEnabled = false;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  fonts.packages =
    [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  programs.zsh = {
    enable = true;
    shellInit = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };

  environment = {
    shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [ vim ];
  };

  imports = [ ./modules ];
}
