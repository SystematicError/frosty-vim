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

-- Config function defined in `plugins/snacks.lua`
return {
    "kosayoda/nvim-lightbulb",
    lazy = false,
    opts = default_opts,
}
