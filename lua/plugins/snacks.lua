local function config()
    local opts = {
        dashboard = { enabled = true },
        indent = { enabled = true },
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
    keys = {
        {
            "<leader>f<cr>",
            function()
                Snacks.picker.pickers()
            end,
            desc = "Pickers",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },

        {
            "]r",
            function()
                Snacks.words.jump(vim.v.count1, true)
            end,
            desc = "Next reference",
        },
        {
            "[r",
            function()
                Snacks.words.jump(-vim.v.count1, true)
            end,
            desc = "Previous reference",
        },
    },

    config = config,
}
