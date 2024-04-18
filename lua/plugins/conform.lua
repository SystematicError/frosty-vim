local function config()
    local formatters = require("languages").formatters

    local opts = {
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },

        formatters_by_ft = formatters,
    }

    require("conform").setup(opts)
end

return {
    {
        "stevearc/conform.nvim",
        config = config,
    },
}
