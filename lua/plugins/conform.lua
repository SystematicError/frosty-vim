local config = {
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

for formatter, _ in pairs(config.formatters_by_ft) do
    config.formatters[formatter] = {}
    config.formatters[formatter].cwd = function()
        return vim.fn.getcwd()
    end
end

return {
    {
        "stevearc/conform.nvim",
        opts = config,
    },
}
