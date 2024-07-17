{ ... }: {
  programs.nixvim.opts = {
    foldenable = false;
    cursorline = true;
    guicursor = "";
    hlsearch = false;
    number = true;
    relativenumber = true;
    mouse = "a";
    clipboard = "unnamedplus";
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "no";
    completeopt = "menuone,noselect,menu";
    expandtab = true;
    smartindent = true;
    shiftwidth = 2;
    fillchars = { eob = " "; };
  };
}
