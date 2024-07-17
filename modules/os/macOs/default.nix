{ ... }: {
  services.nix-daemon.enable = true;
  system = {
    stateVersion = 4;

    defaults.CustomSystemPreferences = {
      "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
    };
  };

  imports = [ ./dock.nix ./finder.nix ./homebrew.nix ./base.nix ];
}
