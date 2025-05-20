-- TODO: Modularise snacks integration
-- TODO: Lazy load lightbulb

local bulb_icons = require("icons").lightbulb

local default_opts = {
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

local function config(_, opts)
    vim.g.enable_lightbulb = true

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

    opts = default_opts,
    config = config,
}
