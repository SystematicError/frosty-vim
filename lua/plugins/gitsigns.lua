-- TODO: Lazy load gitsigns
-- TODO: Modularise snacks integration

local default_opts = {
    signs = {},
    signs_staged_enable = false,
    current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
}

for name, sign in pairs(require("icons").git_gutter) do
    default_opts.signs[name] = { text = sign }
end

local function config(_, opts)
    local gitsigns = require "gitsigns"

    if Snacks then
        local gitsigns_config = require("gitsigns.config").config

        Snacks.toggle({
            name = "Git Line Blame",
            get = function()
                return gitsigns_config.current_line_blame
            end,
            set = function(state)
                gitsigns.toggle_current_line_blame(state)
            end,
        }):map "<leader>ug"
    end

    gitsigns.setup(opts)
end

return {
    "lewis6991/gitsigns.nvim",

    lazy = false,
    keys = {
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage hunk" },
        { "<leader>gx", "<cmd>Gitsigns reset_hunk<cr>", desc = "Discard hunk" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" },

        { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
        { "<leader>gB", "<cmd>Gitsigns blame<cr>", desc = "Blame file" },

        { "]g", "<cmd>Gitsigns next_hunk<cr><cr>", desc = "Next git hunk" },
        { "[g", "<cmd>Gitsigns prev_hunk<cr><cr>", desc = "Previous git hunk" },

        { "ig", "<cmd>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "git hunk" },
        { "ag", "<cmd>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "git hunk" },
    },

    opts = default_opts,
    config = config,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                gitsigns = true,
            },
        },
    },
}
