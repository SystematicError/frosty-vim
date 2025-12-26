<h1 align="center">Frosty Vim</h1>

![Editor showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/ab4f0a59-16db-47da-8530-d32565885db8)
![Search showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/d7758606-91b1-46bd-ab93-1c4ec0b24a69)
![Git showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/307e0922-a604-4b16-a4b3-6292e605bc95)

## What is it?

Frosty is a modern and fully configured development environment for Neovim, with a focus on functionality and looks. Its designed to be best used as a Nix package, whilst still being compatible on systems without it.

## Installation

### Nix

Make sure that the `flake` and `nix-command` [experimental features](https://nixos.org/manual/nix/unstable/development/experimental-features.html) have been enabled.

To try frosty without installing:

```bash
nix run github:SystematicError/frosty-vim
```

### Non-nix

```bash
git clone https://github.com/SystematicError/frosty-vim ~/.config/nvim --depth 1
```

## Language support

These are the defaults, the config can be tweaked to add further support as needed.

Syntax highlighting and Treesitter based functionality for 300+ languages are provided via parsers from [nixpkgs](https://search.nixos.org/packages?channel=unstable&query=vimPlugins.nvim-treesitter-parsers).
Additionally, further support is provided for the following languages:

| Language | Language Server                                             | Formatter                                             |
| -------- | ----------------------------------------------------------- | ----------------------------------------------------- |
| Lua      | [luals](https://github.com/LuaLS/lua-language-server)       | [stylua](https://github.com/JohnnyMorganz/StyLua)     |
| Nix      | [nil](https://github.com/oxalica/nil)                       | [alejandra](https://github.com/kamadorueda/alejandra) |
| Python   | [basedpyright](https://github.com/detachhead/basedpyright)   | [ruff](https://github.com/astral-sh/ruff)             |
| Rust     | [rust-analyzer](https://github.com/rust-lang/rust-analyzer) | [rustfmt](https://github.com/rust-lang/rustfmt)       |
| Shell    | [bashls](https://github.com/bash-lsp/bash-language-server)  | [shfmt](https://github.com/mvdan/sh)                  |

\+ Languages supported by the [Biome toolchain](https://biomejs.dev/internals/language-support/)

## Customising the Nix package

The `flake.nix` file defines how the Frosty package gets built. Stuff like runtime dependencies and Treesitter parsers are defined there.

Frosty can also load a custom userconfig file through the `FROSTY_USERCONFIG` environment variable, without needing to modify the flake itself! Here's an example:

```lua
-- File path: `~/frosty.lua`

-- Send a notification after starting up
vim.schedule(function()
    vim.notify "Hello from the userconfig!"
end)

-- The userconfig file should return a `LazySpec` (https://lazy.folke.io/spec)
return {
    "alec-gibson/nvim-tetris",
    lazy = false,
    config = false,
}

-- The :Tetris command should now be available if the userconfig loads correctly
```

Now, running the command given below will load the userconfig:

```bash
FROSTY_USERCONFIG="$HOME/frosty.lua" nvim
```

> [!NOTE]
> When fetching extra plugins via the userconfig file, Lazy might throw an error, but you can safely ignore this and restart Neovim.
