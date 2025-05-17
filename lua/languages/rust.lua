local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                rust_analyzer = lsp,
            },
        },
    },
}
