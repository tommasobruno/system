{ pkgs, ... }:

let username = "tommasobruno";

in {

  users.users."${username}".home = "/Users/${username}";
  home-manager.users."${username}" = {

    imports = [ ../modules/home ];

    home = {

      packages = with pkgs; [
        # Languages
        zig
        go
      ];

      stateVersion = "23.11";
    };
  };

  imports = [ ../modules/darwin ];
}
