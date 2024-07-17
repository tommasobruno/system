{ ... }: {

  os.macOs = {
    dock = {
      apps = [
        "/Applications/Arc.app"
        "/Users/tommasobruno/Applications/Home Manager Apps/WezTerm.app/"
        "/Users/tommasobruno/Applications/Home Manager Apps/Obsidian.app/"
      ];

      hide = true;
    };

    homebrew.casks = [ "arc" ];
  };

}
