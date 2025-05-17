-- TODO: Switch to basedpyright?

local lsp = {
    settings = {
        pylsp = {
            plugins = {
                ruff = { enabled = true },
            },
        },
    },
}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                pylsp = lsp,
            },
        },
    },
}
