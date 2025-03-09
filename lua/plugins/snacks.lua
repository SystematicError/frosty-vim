local function config()
    local opts = {
        dashboard = { enabled = true },
        indent = { enabled = true },
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
