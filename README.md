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

| Language   | Treesitter | LSP | Formatter |
| ---------- | ---------- | --- | --------- |
| Bash       | x          |     |           |
| C          | x          |     |           |
| C++        | x          |     |           |
| CSS        | x          | x   |           |
| Diff       | x          |     |           |
| Dockerfile | x          |     |           |
| Go         | x          |     |           |
| HTML       | x          | x   |           |
| Javascript | x          |     |           |
| JSON       | x          | x   |           |
| Latex      | x          |     |           |
| Lua        | x          | x   | x         |
| Make       | x          |     |           |
| Markdown   | x          |     |           |
| Nix        | x          | x   | x         |
| Python     | x          |     |           |
| Rust       | x          | x   | x         |
| TOML       | x          |     |           |
| Vim        | x          |     |           |
| Vimdoc     | x          |     |           |
| XML        | x          |     |           |
| YAML       | x          |     |           |

</details>
