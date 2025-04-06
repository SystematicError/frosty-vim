local function config()
    local opts = {
        preview = {
            icons = "devicons",
            modes = { "n", "no", "c", "i" },
            hybrid_modes = { "i" },
        },

        markdown = {
            code_blocks = {
                sign = false,
            },

            headings = {
                shift_width = 0,

                heading_1 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
                heading_2 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
                heading_3 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
                heading_4 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
                heading_5 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
                heading_6 = { sign = "", style = "label", padding_left = "  ", padding_right = "  " },
            },
        },
    }

    require("markview").setup(opts)
end

return {
    "OXY2DEV/markview.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",

    cmd = "Markview",
    ft = { "markdown", "quarto", "rmd", "typst" },

    config = config,
}
