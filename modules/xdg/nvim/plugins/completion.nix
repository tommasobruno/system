{ ... }: {
  imports = [ ./snippets ];
  programs.nixvim = {
    extraConfigLuaPost = ''
      local ls = require "luasnip"
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    '';

    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      lspkind = {
        enable = true;
        mode = "text";
        cmp = {
          enable = true;
          menu = {
            buffer = "[Buffer]";
            nvim_lsp = "[LSP]";
            luasnip = "[LuaSnip]";
            path = "[Path]";
          };
        };
      };
      luasnip = {
        enable = true;
        extraConfig = {
          history = false;
          update_events = "TextChanged,TextChangedI";
          override_builtin = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          snippet.expand =
            "function(args) require('luasnip').lsp_expand(args.body) end";
          mapping = {
            "<C-p>" =
              "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
            "<C-n>" =
              "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert})";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
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
  };
}
