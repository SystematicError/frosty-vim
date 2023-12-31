local function config()
    require("telescope").setup {
        defaults = {
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",

            layout_config = {
                horizontal = {
                    prompt_position = "top"
                }
            }
        }
    }
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        opts = config
    }
}

