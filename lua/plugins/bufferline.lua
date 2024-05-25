local function config()
    local opts = {
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

    require("bufferline").setup(opts)
    require("scope").setup()
end

return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "tiagovla/scope.nvim",
            "catppuccin/nvim",
        },
        config = config,
    },
}
