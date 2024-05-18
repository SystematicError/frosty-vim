{
  description = "Neovim configuration with a side of flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    "folke/lazy.nvim" = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    "catppuccin/nvim" = {
      url = "github:catppuccin/nvim";
      flake = false;
    };

    "nvimdev/dashboard-nvim" = {
      url = "github:nvimdev/dashboard-nvim";
      flake = false;
    };

    "nvim-neo-tree/neo-tree.nvim" = {
      url = "github:nvim-neo-tree/neo-tree.nvim";
      flake = false;
    };

    "nvim-lua/plenary.nvim" = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    "MunifTanjim/nui.nvim" = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };

    "nvim-tree/nvim-web-devicons" = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };

    "akinsho/bufferline.nvim" = {
      url = "github:akinsho/bufferline.nvim";
      flake = false;
    };

    "freddiehaddad/feline.nvim" = {
      url = "github:freddiehaddad/feline.nvim";
      flake = false;
    };

    "rcarriga/nvim-notify" = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };

    "lewis6991/gitsigns.nvim" = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    "NeogitOrg/neogit" = {
      url = "github:NeogitOrg/neogit";
      flake = false;
    };

    "sindrets/diffview.nvim" = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };

    "NvChad/nvim-colorizer.lua" = {
      url = "github:NvChad/nvim-colorizer.lua";
      flake = false;
    };

    "nvim-treesitter/nvim-treesitter" = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };

    "hrsh7th/nvim-cmp" = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };

    "neovim/nvim-lspconfig" = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    "hrsh7th/cmp-nvim-lsp" = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };

    "L3MON4D3/LuaSnip" = {
      url = "github:L3MON4D3/LuaSnip";
      flake = false;
    };

    "saadparwaiz1/cmp_luasnip" = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };

    "rafamadriz/friendly-snippets" = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };

    "hrsh7th/cmp-buffer" = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };

    "hrsh7th/cmp-path" = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };

    "hrsh7th/cmp-cmdline" = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };

    "stevearc/conform.nvim" = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    "andrewferrier/debugprint.nvim" = {
      url = "github:andrewferrier/debugprint.nvim";
      flake = false;
    };

    "nvim-telescope/telescope.nvim" = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };

    "nvim-telescope/telescope-ui-select.nvim" = {
      url = "github:nvim-telescope/telescope-ui-select.nvim";
      flake = false;
    };

    "3rd/image.nvim" = {
      url = "github:3rd/image.nvim";
      flake = false;
    };

    "folke/which-key.nvim" = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };

    "lukas-reineke/indent-blankline.nvim" = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };

    "NMAC427/guess-indent.nvim" = {
      url = "github:NMAC427/guess-indent.nvim";
      flake = false;
    };

    "direnv/direnv.vim" = {
      url = "github:direnv/direnv.vim";
      flake = false;
    };

    "numToStr/Comment.nvim" = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };

    "kylechui/nvim-surround" = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };

    "windwp/nvim-autopairs" = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      packageList =
        "FROSTY_PACKAGES="
        + lib.generators.toLua {
          multiline = false;
          indent = false;
        } (
          builtins.listToAttrs (
            builtins.map
            (name: {
              name = name;
              value = inputs.${name}.outPath;
            })
            (builtins.attrNames (lib.filterAttrs (_: v: !builtins.hasAttr "_type" v) inputs))
          )
        );

      runtimeDeps = with pkgs; [
        wl-clipboard
        ripgrep
        curl
        imagemagick

        nodePackages.bash-language-server
        shfmt

        vscode-langservers-extracted
        prettierd

        lua-language-server
        stylua

        nil
        alejandra

        (python311.withPackages (ps: with ps; [python-lsp-server python-lsp-ruff]))
        ruff

        rust-analyzer
        rustfmt
      ];

      luaDeps = ps:
        with ps; [
          magick
        ];

      treesitterParsers = builtins.attrValues pkgs.vimPlugins.nvim-treesitter.grammarPlugins;

      neovim =
        (pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (pkgs.neovimUtils.makeNeovimConfig {
          withPython3 = false;
          withNodeJs = false;
          withRuby = false;
          extraLuaPackages = luaDeps;

          customRC = ''
            lua ${packageList}
            lua package.path = package.path .. ";${./.}/lua/?.lua"
            luafile ${./.}/init.lua
            set runtimepath^=${builtins.concatStringsSep "," treesitterParsers}
          '';
        }))
        .overrideAttrs (old: {
          generatedWrapperArgs =
            old.generatedWrapperArgs
            or []
            ++ [
              "--prefix"
              "PATH"
              ":"
              (lib.makeBinPath runtimeDeps)
            ];
        });
    in {
      packages = {
        default = neovim;
        inherit neovim;
      };

      devShells.default = pkgs.mkShell {
        packages = runtimeDeps ++ builtins.attrValues self.outputs.packages.${system};
      };
    });
}
