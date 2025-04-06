local function config()
    local opts = {
        dashboard = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        rename = { enable = true },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        words = { enable = true },

        notifier = {
            enabled = true,
            style = "fancy",
        },
    }

    require("snacks").setup(opts)
end

return {
    "folke/snacks.nvim",

    priority = 1500,
    lazy = false,

    -- stylua: ignore
    keys = {
        { "<leader>x", function() Snacks.bufdelete() end, desc = "Delete buffer" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
        { "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
        { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },

        { "<leader>f<cr>", function() Snacks.picker.pickers() end, desc = "Pickers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

        { "]r", function() Snacks.words.jump(vim.v.count1, true) end, desc = "Next reference" },
        { "[r", function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Previous reference" },
    },

    config = config,
}
