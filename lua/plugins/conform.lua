local function config()
    local opts = {
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },

        formatters_by_ft = {
            sh = { "shfmt" },
            css = { "prettierd" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            json = { "prettierd" },
            less = { "prettierd" },
            lua = { "stylua" },
            markdown = { "prettierd" },
            nix = { "alejandra" },
            scss = { "prettierd" },
            typescript = { "prettierd" }, -- BUG: Multiple imports causes an error
            yaml = { "prettierd" },
        },
    }

    require("conform").setup(opts)
end

return {
    {
        "stevearc/conform.nvim",
        config = config,
    },
}
