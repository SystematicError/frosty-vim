local function config()
    local opts = {
        offsets = {
            {
                filetype = "neo-tree",
                highlight = "NeoTreeNormal",
                text = "",
                separator = false,
            },
        },
    }

    if Snacks then
        opts.close_command = "lua Snacks.bufdelete.delete(%d)"
        opts.right_mouse_command = opts.close_command
    end

    require("scope").setup()

    require("bufferline").setup {
        options = opts,
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
    }
end

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "catppuccin/nvim",
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
    },

    lazy = false,
    keys = {
        { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
        { "<a-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
        { "<a-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },

        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
        { "<leader>bm", "<cmd>BufferLinePick<cr>", desc = "Pick buffer to move to" },
        { "<leader>bX", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to delete" },
    },

    config = config,
}
