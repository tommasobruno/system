{ ... }: {
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
      iconsEnabled = false;
      componentSeparators = {
        left = "|";
        right = "|";
      };
      sectionSeparators = {
        left = "";
        right = "";
      };
    };
  };
}

