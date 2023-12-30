local config = {
    options = {
        right_mouse_command = "",
        middle_mouse_command = "bdelete! %d",

        separator_style = {" ", " "},

        indicator = {
            style = "none"
        },

        offsets = {
            {
                filetype = "neo-tree",
                highlight = "NeoTreeNormal",
                text = "",
                padding = 1,
                separator = false
            }
        }
    }
}

return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = config
    }
}
