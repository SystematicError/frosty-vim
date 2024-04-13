<h1 align="center">Frosty Vim</h1>

![Editor showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/ab4f0a59-16db-47da-8530-d32565885db8)
![Search showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/d7758606-91b1-46bd-ab93-1c4ec0b24a69)
![Git showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/307e0922-a604-4b16-a4b3-6292e605bc95)

## What is it?

Frosty is a modern and fully configured development environment for neovim with a focus on functionality and looks.

Check the [roadmap](https://github.com/SystematicError/frosty-vim/issues/1) for upcoming changes.

## Installation

### Nix

Make sure that the `flake` and `nix-command` [experimental features](https://nixos.org/manual/nix/unstable/contributing/experimental-features.html) have been enabled.

To try frosty without installing:

```console
nix run github:SystematicError/frosty-vim
```

### Non-nix

```console
git clone https://github.com/SystematicError/frosty-vim ~/.config/nvim --depth 1
```

## Language support

These are the defaults, the config can be tweaked to add further support as needed.

<details>
<summary>Supported languages</summary>

| Language   | Treesitter | Language Server                                                   | Formatter                                              |
| ---------- | ---------- | ----------------------------------------------------------------- | ------------------------------------------------------ |
| Bash       | ✓          | [bashls](https://github.com/bash-lsp/bash-language-server)        | [shfmt](https://github.com/mvdan/sh)                   |
| C          | ✓          |                                                                   |                                                        |
| C++        | ✓          |                                                                   |                                                        |
| C#         | ✓          |                                                                   |                                                        |
| CSS        | ✓          | [vscode](https://github.com/hrsh7th/vscode-langservers-extracted) | [prettierd](https://github.com/fsouza/prettierd)       |
| CSV        | ✓          |                                                                   |                                                        |
| Diff       | ✓          |                                                                   |                                                        |
| Dockerfile | ✓          |                                                                   |                                                        |
| Go         | ✓          |                                                                   |                                                        |
| HTML       | ✓          | [vscode](https://github.com/hrsh7th/vscode-langservers-extracted) | [prettierd](https://github.com/fsouza/prettierd)       |
| Java       | ✓          |                                                                   |                                                        |
| Javascript | ✓          |                                                                   | [prettierd](https://github.com/fsouza/prettierd)       |
| JSON       | ✓          | [vscode](https://github.com/hrsh7th/vscode-langservers-extracted) | [prettierd](https://github.com/fsouza/prettierd)       |
| Latex      | ✓          |                                                                   |                                                        |
| Less       |            | [vscode](https://github.com/hrsh7th/vscode-langservers-extracted) | [prettierd](https://github.com/fsouza/prettierd)       |
| Lua        | ✓          | [luals](https://github.com/LuaLS/lua-language-server)             | [stylua](https://github.com/JohnnyMorganz/StyLua)      |
| Make       | ✓          |                                                                   |                                                        |
| Markdown   | ✓          |                                                                   | [prettierd](https://github.com/fsouza/prettierd)       |
| Nix        | ✓          | [nil](https://github.com/oxalica/nil)                             | [alejandra](https://github.com/kamadorueda/alejandra)  |
| Python     | ✓          | [pylsp](https://github.com/python-lsp/python-lsp-server/)         | [ruff](https://github.com/astral-sh/ruff)              |
| Ruby       | ✓          |                                                                   |                                                        |
| Rust       | ✓          | [rust-analyzer](https://github.com/rust-lang/rust-analyzer)       | [rustfmt](https://github.com/rust-lang/rustfmt)        |
| SCSS       | ✓          | [vscode](https://github.com/hrsh7th/vscode-langservers-extracted) | [prettierd](https://github.com/fsouza/prettierd)       |
| SQL        | ✓          |                                                                   |                                                        |
| TOML       | ✓          |                                                                   |                                                        |
| Typescript | ✓          |                                                                   | [prettierd](https://github.com/fsouza/prettierd)       |
| Vim        | ✓          |                                                                   |                                                        |
| Vimdoc     | ✓          |                                                                   |                                                        |
| XML        | ✓          |                                                                   |                                                        |
| YAML       | ✓          |                                                                   | [prettierd](https://github.com/fsouza/prettierd)       |

</details>
