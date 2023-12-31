local function config()
    local opts = {
        defaults = {
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",

            layout_config = {
                horizontal = {
                    prompt_position = "top",
                },
            },

            mappings = {
                n = {
                    q = require("telescope.actions").close,
                },
            },
        },
    }

    require("telescope").setup(opts)
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = config,
    },
}
