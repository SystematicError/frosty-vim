local function config()
    local opts = {
        dashboard = { enabled = true },
        indent = { enabled = true },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },

        notifier = {
            enabled = true,
            style = "fancy",
        },
    }

    require("snacks").setup(opts)
end

return {
    "folke/snacks.nvim",
    lazy = false,
    config = config,
}
