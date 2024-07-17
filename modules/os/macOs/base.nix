{ pkgs, lib, config, ... }:
with lib;
let cfg = config.os.macOs.base;
in {
  options = {
    os.macOs.base = {
      timeZone = mkOption {
        type = with types; nullOr str;
        description = "Which time zone to enable";
        default = "Europe/London";
      };
      useTouchIdForSudo = mkOption {
        type = with types; nullOr bool;
        description = "Whether to enable the use of touch id for sudo commands";
        default = false;
      };
    };
  };

  config = {
    system.defaults = {
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

      screencapture = {
        location = "~/Pictures";
        show-thumbnail = false;
        type = "png";
      };
    };

    time.timeZone = cfg.timeZone;
    security.pam.enableSudoTouchIdAuth = cfg.useTouchIdForSudo;

    fonts.packages =
      [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; }) ];

    programs.zsh.enable = true;
    environment = {
      shells = [ pkgs.zsh ];
      systemPackages = with pkgs; [ vim ];
    };
  };
}

