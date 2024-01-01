local function config()
    return {
        options = {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),

            separator_style = { " ", " " },

            indicator = {
                style = "none",
            },

            offsets = {
                {
                    filetype = "neo-tree",
                    highlight = "NeoTreeNormal",
                    text = "",
                    padding = 1,
                    separator = false,
                },
            },
        },
    }
end

return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "catppuccin/nvim",
        },
        opts = config,
    },
}
