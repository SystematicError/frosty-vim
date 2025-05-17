local lsp = {
    settings = {
        Lua = {
            format = { enable = false },
            hint = { enable = true },
            codeLens = { enable = true },
            telemetry = { enable = false },
            completion = { callSnippet = "Both" },
        },
    },
}

local formatter = { "stylua" }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                lua_ls = lsp,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                lua = formatter,
            },
        },
    },
}
