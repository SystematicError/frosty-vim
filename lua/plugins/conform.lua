local function config()
    local formatter = require("languages").formatter

    local opts = {
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },

        formatters_by_ft = formatter,
    }

    require("conform").setup(opts)
end

return {
    "stevearc/conform.nvim",
    lazy = false,
    config = config,
}
