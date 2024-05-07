local function config()
    local opts = {
        indent = {
            char = "▏",
        },

        scope = {
            show_start = false,
            show_end = false,
        },

        exclude = {
            filetypes = {
                "dashboard",
            },
        },
    }

    require("ibl").setup(opts)
end

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = config,
    },

    colorscheme_integrations = {
        indent_blankline = true,
    },
}
