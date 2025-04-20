local function config()
    local group_icons = require("icons").keymap_groups

    local opts = {
        spec = {
            { "<leader>b", group = "Buffers", icon = group_icons.buffers },
            { "<leader>f", group = "Find", icon = group_icons.find },
            { "<leader>g", group = "Git", icon = group_icons.git },
            { "<leader>l", group = "LSP", icon = group_icons.lsp },
            { "<leader>lj", group = "Jumps" },
            { "<leader>q", group = "Quit/Session", icon = group_icons.quit },
            { "<leader><tab>", group = "Tabs", icon = group_icons.tabs },
            { "<leader>u", group = "UI", icon = group_icons.ui },
            { "<leader>ul", group = "Language Features" },
        },
    }

    require("which-key").setup(opts)
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = config,
}
