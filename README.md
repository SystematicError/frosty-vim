<h1 align="center">❄️ Frosty Vim</h1>

A very ad hoc [nix flake](https://nixos.wiki/wiki/Flakes) based package management system for managing neovim plugins, lsp servers, formatters, debuggers, parsers, etc.

This primarily aims to provide a unified way for me to manage **my specific set of packages** whilst still making it easy to fallback to other solutions on non nix systems.


## How it works

1. All packages specified in the flake's inputs are downloaded and stored in the nix store
2. The flake generates a `package_list.lua` file containing the paths of all the packages, somewhat like this:
```lua
return {
    package_1 = "/nix/store/...",
    package_2 = "/nix/store/...",
    package_3 = "/nix/store/...",
}
```
3. Neovim thens reads this `package_list.lua` file and a plugin manager like [lazy.nvim](https://github.com/folke/lazy.nvim) can load the plugins from the absolute nix store paths
4. When run on a system where `frosty` isn't present, `lazy.nvim` can simply fallback to downloading the required plugins itself