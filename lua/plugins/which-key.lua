local function config()
    local which_key = require "which-key"

    vim.g.mapleader = " "

    local normal_mappings = {
        ["<c-d>"] = { "<c-d>zz", "Scroll down" },
        ["<c-u>"] = { "<c-u>zz", "Scroll up" },

        ["g?d"] = { "<cmd>DeleteDebugPrints<cr>", "Delete debug prints" },

        ["<leader>"] = {
            n = {
                name = "Neotree",

                s = { "<cmd>Neotree show<cr>", "Show" },
                c = { "<cmd>Neotree close<cr>", "Close" },
                t = { "<cmd>Neotree toggle<cr>", "Toggle" },
            },

            t = {
                name = "Telescope",

                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            },

            g = { "<cmd>Neogit<cr>", "Neogit" },
        },
    }

    which_key.register(normal_mappings, { mode = "n" })
end

return {
    {
        "folke/which-key.nvim",
        config = config,
    },
}
