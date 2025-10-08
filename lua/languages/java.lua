-- TODO: Refine this
-- TODO: Reduce notifications
-- TODO: Document this in README.md

local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                jdtls = lsp,
            },
        },
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = false,
    },
}
