{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    #extraPlugins = with pkgs.vimPlugins; [ colorbuddy-nvim ];
    extraPackages = with pkgs; [ ripgrep ];

    #extraConfigLuaPost = ''
    # vim.cmd.colorscheme("colorbuddy")
    #'';

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
      };
    };
  };

  imports = [ ./core ./plugins ];
}
