local function config()
    local opts = {
        options = {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),

            offsets = {
                {
                    filetype = "neo-tree",
                    highlight = "NeoTreeNormal",
                    text = "",
                    separator = false,
                },
            },
        },
    }

    require("bufferline").setup(opts)
    require("scope").setup()
end

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "catppuccin/nvim",
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
    },
    lazy = false,
    config = config,
}
