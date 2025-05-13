local function config()
    local formatter = require("languages").formatter

    vim.g.format_on_save = true

    local opts = {
        format_on_save = function(bufnr)
            local global_state = vim.g.format_on_save
            local buffer_state = vim.b[bufnr].format_on_save

            local state = global_state == nil or global_state

            if buffer_state ~= nil then
                state = buffer_state
            end

            return state and {
                timeout_ms = 1000,
                lsp_format = "fallback",
            }
        end,

        formatters_by_ft = formatter,
    }

    if Snacks then
        Snacks.toggle({
            name = "Formatter (Global)",
            get = function()
                return vim.g.format_on_save == nil or vim.g.format_on_save
            end,
            set = function(state)
                vim.g.format_on_save = state
                vim.b.format_on_save = nil
            end,
        }):map "<leader>ulf"

        Snacks.toggle({
            name = "Formatter (Buffer)",
            get = function()
                local global_state = vim.g.format_on_save
                local buffer_state = vim.b[vim.api.nvim_get_current_buf()].format_on_save

                if buffer_state ~= nil then
                    return buffer_state
                end

                return global_state == nil or global_state
            end,
            set = function(state)
                vim.b.format_on_save = state
            end,
        }):map "<leader>ulF"
    end

    require("conform").setup(opts)
end

return {
    "stevearc/conform.nvim",
    lazy = false,
    config = config,
}
