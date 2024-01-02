local function config()
    local opts = {
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },

        formatters_by_ft = {
            lua = { "stylua" },
            nix = { "alejandra" },
        },

        formatters = {},
    }

    for formatter, _ in pairs(opts.formatters_by_ft) do
        opts.formatters[formatter] = {}
        opts.formatters[formatter].cwd = function()
            return vim.fn.getcwd()
        end
    end

    require("conform").setup(opts)
end

return {
    {
        "stevearc/conform.nvim",
        config = config,
    },
}
