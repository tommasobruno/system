{ ... }: {
  programs.nixvim.plugins = {
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    luasnip.enable = true;

    cmp = {
      enable = true;
      settings = {
        snippet.expand =
          "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<Up>" =
            "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<Down>" =
            "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<cr>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            keywordLength = 5;
          }
        ];

        window = {
          completion = {
            scrollbar = false;
            sidePadding = 1;
          };
        };
      };
    };
  };
}
