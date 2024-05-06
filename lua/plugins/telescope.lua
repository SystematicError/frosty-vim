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

    mappings = {
        n = {
            ["<leader>"] = {
                t = {
                    name = "Telescope",

                    f = { "<cmd>Telescope find_files<cr>", "Find files" },
                    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
                    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
                    x = { "<cmd>Telescope filetypes<cr>", "Set filetype" },
                    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer grep" },
                },
            },
        },
    },

    highlights = function(colors)
        return {
            TelescopeSelection = { bg = colors.crust },
            TelescopePromptNormal = { bg = colors.crust },
            TelescopePromptBorder = { fg = colors.crust, bg = colors.crust },
            TelescopePromptTitle = { fg = colors.crust, bg = colors.blue, style = { "bold" } },
            TelescopePromptPrefix = { fg = colors.overlay0 },
            TelescopePreviewNormal = { bg = colors.mantle },
            TelescopePreviewBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle },
        }
    end,
}
