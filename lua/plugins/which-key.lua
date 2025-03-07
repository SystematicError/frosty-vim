local function config()
    local group_icons = require("icons").keymap_groups

    local opts = {
        spec = {
            { "<leader>g", group = "Git", icon = group_icons.git },
        },
    }

    require("which-key").setup(opts)
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = config,
}
