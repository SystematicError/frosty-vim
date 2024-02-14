<h1 align="center">Frosty Vim</h1>

![Editor showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/ab4f0a59-16db-47da-8530-d32565885db8)
![Search showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/d7758606-91b1-46bd-ab93-1c4ec0b24a69)
![Git showcase](https://github.com/SystematicError/frosty-vim/assets/63366086/307e0922-a604-4b16-a4b3-6292e605bc95)

## What is it?

Frosty is a modern and fully configured development environment for neovim with a focus on functionality and looks.

## Installation

### Nix

Make sure that the `flake` and `nix-command` [experimental features](https://nixos.org/manual/nix/unstable/contributing/experimental-features.html) have been enabled.

To try frosty without installing:

```
nix run github:systematicerror/frosty-vim
```

### Non-nix

Frosty has been designed with compatibility of non-nix systems in mind, at the moment some boilerplate is yet to be added in order to detect whether it is being run on such a system.
