{ pkgs, ... }:

let
  opts = import ./options.nix;
  globals = import ./globals.nix;
  keymaps = import ./keymaps.nix;
in {
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    inherit keymaps opts globals;

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
        settings = {
          parser_install_dir = "~/.config/nvim/treesitter";
          ensure_installed = [
            "zig"
            "go"
            "yaml"
            "html"
            "typescript"
            "javascript"
            "nix"
            "cpp"
            "glsl"
            "c"
          ];
        };
        nixvimInjections = true;
      };

      lualine = {
        enable = true;
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
          nil-ls.enable = true;
          yamlls.enable = true;
          zls = {
            enable = true;
            settings = { enable_build_on_save = true; };
          };
          clangd.enable = true;
          gopls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
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
          cpp = [ "clang-format" ];
          c = [ "clang-format" ];
          go = [[ "gofmt" "goimports" ]];
          rust = [ "rustfmt" ];
        };
      };
    };
  };
}
