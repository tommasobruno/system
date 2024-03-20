{ ... }: 

  let username = "tommasobruno";

  in {

    users.users."${username}".home = "/Users/${username}";
    home-manager.users."${username}" = {

      imports = [ ../modules/home ];

      home.stateVersion = "23.11";
    };

    imports = [ ../modules/darwin ];
 }
