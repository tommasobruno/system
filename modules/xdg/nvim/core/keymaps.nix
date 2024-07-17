{ ... }: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Oil<cr>";
      mode = "n";
      key = "-";
      options.desc = "Oil mode";
    }
    {
      action = "<C-w><C-h>";
      mode = "n";
      key = "<C-h>";
      options.desc = "Move focus to left window";
    }
    {
      action = "<C-w><C-l>";
      mode = "n";
      key = "<C-l>";
      options.desc = "Move focus to right window";
    }
    {
      action = "<C-w><C-j>";
      mode = "n";
      key = "<C-j>";
      options.desc = "Move focus to lower window";
    }
    {
      action = "<C-w><C-k>";
      mode = "n";
      key = "<C-k>";
      options.desc = "Move focus to upper window";
    }
  ];
}
