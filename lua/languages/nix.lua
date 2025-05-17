local lsp = {}

local formatter = { "alejandra" }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                nil_ls = lsp,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                nix = formatter,
            },
        },
    },
}
