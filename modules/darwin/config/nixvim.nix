{ pkgs, ... }:

let
  options = import ./nvim/options.nix;
  keymaps = import ./nvim/keymaps.nix;
in {
  programs.nixvim = options // {
    enable = true;
    vimAlias = true;

    keymaps = keymaps;

    extraPackages = with pkgs; [ nixfmt-classic prettierd ];

    colorschemes = {

      kanagawa = {
        enable = true;
        settings = {
          terminalColors = true;
          transparent = true;
          background.dark = "dragon";
          colors.theme = {
            all = {
              ui = { bg_gutter = "none"; };
              syn = { keyword = "#938056"; };
            };
          };
          overrides = ''
            function(colors)
              local theme = colors.theme
              return {
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_m3 }, 
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 }
              }
            end
          '';
        };
      };

    };

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
        nixvimInjections = true;
        nixGrammars = true;
      };

      lualine = {
        enable = true;
        theme = "kanagawa";
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

      # LSP Configuration
      cmp_luasnip.enable = true;
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
          nil_ls.enable = true;
          zls.enable = true;
          gopls.enable = true;
          yamlls.enable = true;
          html.enable = true;
          tsserver.enable = true;
          volar.enable = false;
          tailwindcss.enable = false;
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
          nix = [ "nixfmt" ];
          go = [ "gofmt" ];
          typescript = [ "prettierd" ];
        };
      };
    };
  };
}
