local function config()
    local git_gutter = require("icons").git_gutter

    local signs = {}

    for name, sign in pairs(git_gutter) do
        signs[name] = { text = sign }
    end

    local opts = {
        signs = signs,
        signs_staged_enable = false,
        current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
    }

    require("gitsigns").setup(opts)
end

return {
    "lewis6991/gitsigns.nvim",

    lazy = false,
    keys = {
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage hunk" },
        { "<leader>gx", "<cmd>Gitsigns reset_hunk<cr>", desc = "Discard hunk" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" },

        { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Blame file" },
        { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },

        { "]g", "<cmd>Gitsigns next_hunk<cr><cr>", desc = "Next git hunk" },
        { "[g", "<cmd>Gitsigns prev_hunk<cr><cr>", desc = "Previous git hunk" },

        { "ig", "<cmd>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "git hunk" },
        { "ag", "<cmd>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "git hunk" },
    },

    config = config,
}
