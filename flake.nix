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

      packageList = pkgs.linkFarm "frosty-packages" (
        builtins.map (name: {
          inherit name;
          path = inputs.${name}.outPath;
        })
        (builtins.attrNames (lib.filterAttrs (_: value: !builtins.hasAttr "_type" value) inputs))
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

        biome

        lua-language-server
        stylua

        nil
        alejandra

        (python3.withPackages (ps: with ps; [python-lsp-server python-lsp-ruff]))
        ruff

        rust-analyzer
        rustfmt

        bash-language-server
        shfmt
      ];

      includeBlinkLib = true;
      allowUserConfigEnvVar = true;

      neovim =
        (pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (pkgs.neovimUtils.makeNeovimConfig {
          withPython3 = false;
          withNodeJs = false;
          withRuby = false;
          extraLuaPackages = luaDeps;

          customLuaRC = ''
            package.path = package.path .. ";${./.}/lua/?.lua;${./.}/lua/?/init.lua"
            ${lib.optionalString includeBlinkLib ''package.cpath = package.cpath .. ";${pkgs.vimPlugins.blink-cmp.blink-fuzzy-lib}/lib/lib?.so"''}
            FROSTY_PACKAGES="${packageList}"
            FROSTY_RUNTIMEPATHS={"${./.}", "${builtins.concatStringsSep "," treesitterParsers}"}
            ${lib.optionalString allowUserConfigEnvVar ''
              local stat = vim.uv.fs_stat(vim.env.FROSTY_USERCONFIG or "")
              if stat and stat.type == "file" then
                FROSTY_USERCONFIG = dofile(vim.env.FROSTY_USERCONFIG)
              end''}
            dofile("${./.}/init.lua")
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
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Plugin loader

    "lazy.nvim" = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    # Plugins
    "blink.cmp" = {
      url = "github:Saghen/blink.cmp";
      flake = false;
    };

    "bufferline.nvim" = {
      url = "github:akinsho/bufferline.nvim";
      flake = false;
    };

    "catppuccin" = {
      url = "github:catppuccin/nvim";
      flake = false;
    };

    "conform.nvim" = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    "diffview.nvim" = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };

    "friendly-snippets" = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };

    "gitsigns.nvim" = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    "guess-indent.nvim" = {
      url = "github:NMAC427/guess-indent.nvim";
      flake = false;
    };

    "lualine.nvim" = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };

    "markview.nvim" = {
      url = "github:OXY2DEV/markview.nvim";
      flake = false;
    };

    "neo-tree.nvim" = {
      url = "github:nvim-neo-tree/neo-tree.nvim";
      flake = false;
    };

    "neogit" = {
      url = "github:NeogitOrg/neogit";
      flake = false;
    };

    "nui.nvim" = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };

    "nvim-autopairs" = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };

    "nvim-highlight-colors" = {
      url = "github:brenoprata10/nvim-highlight-colors";
      flake = false;
    };

    "nvim-lightbulb" = {
      url = "github:kosayoda/nvim-lightbulb";
      flake = false;
    };

    "nvim-lspconfig" = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    "nvim-treesitter" = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };

    "nvim-treesitter-textobjects" = {
      url = "github:nvim-treesitter/nvim-treesitter-textobjects";
      flake = false;
    };

    "nvim-web-devicons" = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };

    "persistence.nvim" = {
      url = "github:folke/persistence.nvim";
      flake = false;
    };

    "plenary.nvim" = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    "satellite.nvim" = {
      url = "github:lewis6991/satellite.nvim";
      flake = false;
    };

    "scope.nvim" = {
      url = "github:tiagovla/scope.nvim";
      flake = false;
    };

    "snacks.nvim" = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };

    "which-key.nvim" = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
  };
}
