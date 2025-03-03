local lsp = {}

local formatter = { "alejandra" }

return {
    lsp = { nil_ls = lsp },
    formatter = { nix = formatter },
}
