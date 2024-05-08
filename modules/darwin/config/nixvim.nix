{ pkgs, ... }: {

  programs.nixvim = {
    enable = true;

    vimAlias = true;

    extraPackages = with pkgs; [ nixfmt-rfc-style prettierd ];

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    opts = {
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
      termguicolors = true;
      expandtab = true;
      smartindent = true;
      shiftwidth = 2;
      fillchars = { eob = " "; };
    };

    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          terminalColors = true;
          transparent = true;
          colors.theme = { all = { ui = { bg_gutter = "none"; }; }; };
          background.dark = "dragon";
          overrides = ''
            function(colors)
              local theme = colors.theme
              return {
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_m3 }, 
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
                Function = { fg = theme.syn.identifier },

                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
              }
            end
          '';
        };
      };
    };

    keymaps = [
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

    plugins = {
      oil.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>p" = {
            action = "find_files";
            options.desc = "Telescope Find Files";
          };
          "<leader>gp" = {
            action = "git_files";
            options.desc = "Telescope Git Files";
          };
        };
      };

      treesitter = {
        enable = true;
        ensureInstalled =
          [ "zig" "go" "yaml" "html" "typescript" "javascript" "nix" ];
      };

      lualine = {
        enable = true;
        iconsEnabled = false;
        theme = "kanagawa";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };

      # LSP Configuration
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

      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          lspBuf = {
            "K" = "hover";
            "gd" = "definition";
            "<leader>ca" = "code_action";
            "<leader>r" = "rename";
            "<leader>rr" = "references";
          };
          diagnostic = {
            "[d" = "goto_next";
            "]d" = "goto_prev";
            "<leader>e" = "open_float";
          };
        };
        servers = {
          nixd.enable = true;
          zls.enable = false;
          gopls.enable = true;
          yamlls.enable = true;
          html.enable = true;
          tsserver.enable = true;
          volar.enable = true;
          tailwindcss.enable = true;
          #rust-analyzer = {
          #enable = true;
          #installCargo = false; # Rustup contains cargo
          #installRustc = false; # Rustup contains rustc
          #};
        };
      };

      conform-nvim = {
        enable = true;
        formatOnSave = {
          timeoutMs = 500;
          lspFallback = true;
        };
        formattersByFt = {
          zig = [ "zigfmt" ];
          #rust = [ "rustfmt" ];
          nix = [ "nixfmt" ];
          go = [ "gofmt" ];
          typescript = [ "prettierd" ];
        };
      };
    };
  };
}
