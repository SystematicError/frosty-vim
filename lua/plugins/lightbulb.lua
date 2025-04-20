local function config()
    local bulb_icons = require("icons").lightbulb

    vim.g.enable_lightbulb = true

    local opts = {
        code_lenses = true,

        autocmd = { enabled = true },

        sign = { enabled = false },

        virtual_text = {
            enabled = true,

            text = bulb_icons.action,
            lens_text = bulb_icons.lens,
        },

        filter = function()
            return vim.g.enable_lightbulb
        end,
    }

    if Snacks then
        Snacks.toggle({
            name = "Lightbulb",
            get = function()
                return vim.g.enable_lightbulb
            end,
            set = function(state)
                vim.g.enable_lightbulb = state
            end,
        }):map "<leader>ull"
    end

    require("nvim-lightbulb").setup(opts)
end

return {
    "kosayoda/nvim-lightbulb",
    lazy = false,
    config = config,
}
