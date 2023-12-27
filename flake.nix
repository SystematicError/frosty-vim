{
  description = "Hacky package manager for neovim";

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
      lua-language-server
    ];
  in {
    packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
      pkgs.neovimUtils.makeNeovimConfig {
        customRC = ''
          set runtimepath^=${./.}
          source ${packageList}
          source ${./.}/init.lua
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
