{
  description = "Neovim configuration with a side of flakes";

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
        lib.generators.toLua {
          multiline = false;
          indent = false;
        } (
          builtins.listToAttrs (
            builtins.map
            (name: {
              name = name;
              value = inputs.${name}.outPath;
            })
            (builtins.attrNames (lib.filterAttrs (_: value: !builtins.hasAttr "_type" value) inputs))
          )
        );

      allTreesitterParsers = pkgs.linkFarm "frosty-treesitter-runtime" (
        builtins.map (drv: {
          name = "parser/${lib.removeSuffix "-grammar" (lib.strings.getName drv.name)}.so";
          path = "${drv.outPath}/parser";
        })
        pkgs.vimPlugins.nvim-treesitter.allGrammars
      );

      luaDeps = ps: [];

      # Include packages from `pkgs.vimPlugins.nvim-treesitter.grammarPlugins` if you want only specific parsers
      treesitterParsers = [allTreesitterParsers];

      runtimeDeps = with pkgs; [
        wl-clipboard # Replace with `xclip` for X11 support
        ripgrep

        lua-language-server
        stylua

        nil
        alejandra

        (python3.withPackages (ps: with ps; [python-lsp-server python-lsp-ruff]))
        ruff

        bash-language-server
        shfmt
      ];

      neovim =
        (pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (pkgs.neovimUtils.makeNeovimConfig {
          withPython3 = false;
          withNodeJs = false;
          withRuby = false;
          extraLuaPackages = luaDeps;

          customRC = ''
            lua package.path = package.path .. ";${./.}/lua/?.lua;${./.}/lua/?/init.lua"
            lua package.cpath = package.cpath .. ";${pkgs.vimPlugins.blink-cmp.blink-fuzzy-lib}/lib/lib?.so"
            lua FROSTY_PACKAGES=${packageList}
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
        packages = runtimeDeps ++ [neovim];
      };
    });

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Plugin loader

    "folke/lazy.nvim" = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    # Plugins
    "akinsho/bufferline.nvim" = {
      url = "github:akinsho/bufferline.nvim";
      flake = false;
    };

    "catppuccin/nvim" = {
      url = "github:catppuccin/nvim";
      flake = false;
    };

    "folke/snacks.nvim" = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };

    "folke/which-key.nvim" = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };

    "lewis6991/gitsigns.nvim" = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    "lewis6991/satellite.nvim" = {
      url = "github:lewis6991/satellite.nvim";
      flake = false;
    };

    "MunifTanjim/nui.nvim" = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };

    "NeogitOrg/neogit" = {
      url = "github:NeogitOrg/neogit";
      flake = false;
    };

    "neovim/nvim-lspconfig" = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    "NMAC427/guess-indent.nvim" = {
      url = "github:NMAC427/guess-indent.nvim";
      flake = false;
    };

    "NvChad/nvim-colorizer.lua" = {
      url = "github:NvChad/nvim-colorizer.lua";
      flake = false;
    };

    "nvim-lua/plenary.nvim" = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    "nvim-lualine/lualine.nvim" = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };

    "nvim-neo-tree/neo-tree.nvim" = {
      url = "github:nvim-neo-tree/neo-tree.nvim";
      flake = false;
    };

    "nvim-tree/nvim-web-devicons" = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };

    "nvim-treesitter/nvim-treesitter" = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };

    "nvim-treesitter/nvim-treesitter-textobjects" = {
      url = "github:nvim-treesitter/nvim-treesitter-textobjects";
      flake = false;
    };

    "OXY2DEV/markview.nvim" = {
      url = "github:OXY2DEV/markview.nvim/dev"; # TODO: Remove after horizontal rule rendering is fixed
      flake = false;
    };

    "rafamadriz/friendly-snippets" = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };

    "Saghen/blink.cmp" = {
      url = "github:Saghen/blink.cmp";
      flake = false;
    };

    "sindrets/diffview.nvim" = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };

    "stevearc/conform.nvim" = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    "tiagovla/scope.nvim" = {
      url = "github:tiagovla/scope.nvim";
      flake = false;
    };

    "windwp/nvim-autopairs" = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
  };
}
