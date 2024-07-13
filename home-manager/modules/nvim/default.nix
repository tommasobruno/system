{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    extraPackages = with pkgs; [ nixfmt-classic ];
    extraPlugins = with pkgs.vimPlugins; [ colorbuddy-nvim ];

    extraConfigLuaPost = ''
      vim.cmd.colorscheme("gruvbuddy")
    '';

    filetype = {
      extension = {
        vert = "glsl";
        frag = "glsl";
      };
    };
  };

  imports = [ ./core ./plugins ];
}
