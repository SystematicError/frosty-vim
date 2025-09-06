-- TODO: Configure diffview (modularise?)

local default_opts = {
    integrations = {
        diffview = true,
    },
}

-- Config function defined in `plugins/neo-tree.lua`
return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },

    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },

    opts = default_opts,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                diffview = true,
                neogit = true,
            },
        },
    },
}
