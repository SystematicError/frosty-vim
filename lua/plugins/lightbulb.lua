local function config()
    local bulb_icons = require("icons").lightbulb

    local opts = {
        code_lenses = true,

        autocmd = { enabled = true },

        sign = { enabled = false },

        virtual_text = {
            enabled = true,

            text = bulb_icons.action,
            lens_text = bulb_icons.lens,
        },
    }

    require("nvim-lightbulb").setup(opts)
end

return {
    "kosayoda/nvim-lightbulb",
    lazy = false,
    config = config,
}
