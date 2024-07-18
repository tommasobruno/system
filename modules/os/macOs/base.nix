{ pkgs, lib, config, ... }:
with lib;
let cfg = config.os.macOs.base;
in {
  options = {
    os.macOs.base = with types; {
      timeZone = mkOption {
        type = nullOr str;
        description = "Which time zone to enable";
        default = "Europe/London";
      };
      useTouchIdForSudo = mkOption {
        type = nullOr bool;
        description = "Whether to enable the use of touch id for sudo commands";
        default = false;
      };
    };
  };

  config = {
    system = {

      keyboard.enableKeyMapping = true;
      keyboard.remapCapsLockToEscape = true;

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

        screencapture = {
          location = "~/Pictures";
          show-thumbnail = false;
          type = "png";
        };
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

