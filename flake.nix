{
  description = "Neovim configuration with a side of flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    "folke/lazy.nvim" = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    "navarasu/onedark.nvim" = {
      url = "github:navarasu/onedark.nvim";
      flake = false;
    };

    "nvim-tree/nvim-tree.lua" = {
      url = "github:nvim-tree/nvim-tree.lua";
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

    "lukas-reineke/indent-blankline.nvim" = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };

    "windwp/nvim-autopairs" = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    packageList = builtins.toFile "package_list.lua" (
      "FROSTY_PACKAGES="
      + lib.generators.toLua {
        multiline = false;
        indent = false;
      }
      (builtins.listToAttrs (builtins.map (name: {
        name = name;
        value = inputs.${name}.outPath;
      }) (builtins.filter (input: !builtins.elem input ["self" "nixpkgs"]) (builtins.attrNames inputs))))
    );

    runtimeDeps = with pkgs; [
      wl-clipboard
      lua-language-server
    ];
  in {
    packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
      pkgs.neovimUtils.makeNeovimConfig {
        customRC = ''
          lua package.path = package.path .. ";${./lua}/?.lua"
          luafile ${packageList}
          luafile ${./init.lua}
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
  };
}
