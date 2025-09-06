local default_opts = {
    options = {
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

return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",

    lazy = false,
    keys = {
        { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },

        { "<a-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
        { "<a-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },

        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer to move to" },
        { "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
        { "<leader>bD", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to delete" },
    },

    opts = default_opts,
}
