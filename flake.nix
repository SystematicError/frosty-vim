{
  description = "Neovim configuration with a side of flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    "folke/lazy.nvim" = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    "catppuccin/nvim" = {
      url = "github:catppuccin/nvim";
      flake = false;
    };

    "goolord/alpha-nvim" = {
      url = "github:goolord/alpha-nvim";
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

    "jinh0/eyeliner.nvim" = {
      url = "github:jinh0/eyeliner.nvim";
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
    ...
  } @ inputs: let
    system = "x86_64-linux";
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
          (builtins.attrNames (removeAttrs inputs ["self" "nixpkgs"]))
        )
      );

    runtimeDeps = with pkgs; [
      wl-clipboard
      ripgrep

      vscode-langservers-extracted
      prettierd

      nodePackages.bash-language-server
      shfmt

      lua-language-server
      stylua

      nil
      alejandra

      rust-analyzer
      rustfmt
    ];

    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      bash
      c
      cpp
      c_sharp
      css
      csv
      diff
      dockerfile
      go
      html
      java
      javascript
      json
      latex
      lua
      make
      markdown
      nix
      python
      ruby
      rust
      scss
      sql
      toml
      typescript
      vim
      vimdoc
      xml
      yaml
    ];
  in {
    packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
      pkgs.neovimUtils.makeNeovimConfig {
        customRC = ''
          lua ${packageList}
          lua package.path = package.path .. ";${./.}/lua/?.lua"
          luafile ${./.}/init.lua
          set runtimepath^=${builtins.concatStringsSep "," treesitterParsers}
        '';
      }
      // {
        wrapperArgs = [
          "--prefix"
          "PATH"
          ":"
          "${lib.makeBinPath runtimeDeps}"
        ];
      }
    );

    devShells.${system}.default = pkgs.mkShell {
      packages = runtimeDeps ++ builtins.attrValues self.outputs.packages.${system};
    };
  };
}
