{ pkgs, ... }: {
  system = {
    stateVersion = 4;

    defaults = {
      loginwindow = {
        SHOWFULLNAME = false;
        GuestEnabled = false;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        _HIHideMenuBar = false;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      screencapture = {
        location = "~/Pictures";
        show-thumbnail = false;
        type = "png";
      };

      CustomSystemPreferences = {
        "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
      };
    };
  };

  time.timeZone = "Europe/London";

  security.pam.enableSudoTouchIdAuth = true;

  fonts.packages =
    [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; }) ];

  programs.zsh.enable = true;
  environment = {
    shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [ vim ];
  };

  imports = [ ./modules ];
}
