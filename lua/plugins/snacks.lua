-- TODO: Modularise opts table

local function config()
    -- TODO: Are all these enabled lines needed?
    local opts = {
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        rename = { enable = true },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        words = { enable = true },

        notifier = {
            enabled = true,
            style = "fancy",
        },

        dashboard = {
            enabled = true,
            preset = {
                header = "█████\n    ██\n      ██\n        ██\n        ████\n        ████\n        ██  ██\n        ██    ██\n          ██      ████",
            },
        },
    }

    -- BUG: Wrap option being applied globally
    Snacks.toggle.option("wrap", { name = "Line Wrap", global = true }):map "<leader>uw"

    -- TODO: Better way to rename snack toggles
    Snacks.toggle({
        name = "References",
        get = function()
            return Snacks.words.enabled
        end,
        set = function(state)
            if state then
                Snacks.words.enable()
            else
                Snacks.words.disable()
            end
        end,
    }):map "<leader>ulr"

    Snacks.toggle.indent():map "<leader>ui"
    Snacks.toggle.zoom():map "<leader>uz"
    Snacks.toggle.zen():map "<leader>uZ"

    require("snacks").setup(opts)
end

return {
    "folke/snacks.nvim",

    priority = 1500,
    lazy = false,

    -- stylua: ignore
    keys = {
        { "<leader>x", function() Snacks.bufdelete() end, desc = "Delete buffer" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
        { "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
        { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },

        { "<leader>fp", function() Snacks.picker.pickers() end, desc = "Pickers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

        { "]r", function() Snacks.words.jump(vim.v.count1, true) end, desc = "Next reference" },
        { "[r", function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Previous reference" },
    },

    config = config,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                snacks = { enabled = true },
            },
        },
    },
}
