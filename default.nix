{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    extraPackages = with pkgs; [ ripgrep nixfmt-classic ];

    colorschemes.gruvbox = {
      enable = true;
      settings = {
        terminal_colors = true;
        transparent_mode = true;
      };
    };

    filetype = {
      extension = {
        vert = "glsl";
        frag = "glsl";
        h = "c";
      };
    };
  };

  imports = [ ./core ./plugins ];
}
