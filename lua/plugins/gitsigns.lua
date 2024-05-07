local function config()
    local opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "_" },
            untracked = { text = "┆" },
        },

        current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
    }

    require("gitsigns").setup(opts)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        config = config,
    },

    mappings = {
        n = {
            ["<leader>g"] = {
                name = "Git",

                s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
                u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Unstage hunk" },
                x = { "<cmd>Gitsigns reset_hunk<cr>", "Discard hunk" },
                p = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview hunk" },
                b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
            },

            ["[h"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
            ["]h"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
        },
    },

    colorscheme_integrations = {
        gitsigns = true,
    },
}
