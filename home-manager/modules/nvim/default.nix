{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    extraPlugins = with pkgs.vimPlugins; [ colorbuddy-nvim ];
    extraPackages = with pkgs; [ ripgrep ];

    extraConfigLuaPost = ''
      vim.cmd.colorscheme("gruvbuddy")
    '';

    colorschemes.gruvbox = {
      enable = false;
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
