{ pkgs, ... }: {

  system = {

    stateVersion = 4;

    defaults = {
      loginwindow = {
        SHOWFULLNAME = false;
        GuestEnabled = false;
      };

      dock = {
        launchanim = false;
        magnification = false;
        minimize-to-application = true;
        mineffect = null;
        tilesize = 48;
        autohide = true;
        persistent-apps =
          [ /Applications/Arc.app /System/Applications/Calendar.app ];
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  fonts = {
    fontDir.enable = true;
    fonts = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };

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

  imports = [ ./config/nixvim.nix ./config/homebrew.nix ];
}
