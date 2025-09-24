-- TODO: Are all these enabled lines needed?
local default_opts = {
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    rename = { enable = true },
    terminal = { enabled = true },
    words = { enable = true },

    statuscolumn = {
        enabled = true,
        folds = {
            open = true,
        },
    },

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

local function config(_, opts)
    Snacks.toggle.option("wrap", { name = "Line Wrap", global = true }):map "<leader>uw"

    -- HACK: Equivalent to `Snacks.toggle.words` but renamed
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

    opts = default_opts,
    config = config,

    -- Some snacks dependent integrations are defined in the respective plugins' config functions
    -- Search for `if Snacks then` to find these
    specs = {
        {
            "akinsho/bufferline.nvim",
            optional = true,
            opts = {
                options = {
                    close_command = "lua Snacks.bufdelete.delete(%d)",
                    right_mouse_command = "lua Snacks.bufdelete.delete(%d)",
                },
            },
        },

        {
            "catppuccin/nvim",
            optional = true,
            opts = {
                integrations = {
                    snacks = { enabled = true },
                },
            },
        },

        {
            "stevearc/conform.nvim",
            optional = true,

            opts = {
                format_on_save = function()
                    return vim.g.format_on_save
                        and {
                            timeout_ms = 1000,
                            lsp_format = "fallback",
                        }
                end,
            },

            config = function(_, opts)
                vim.g.format_on_save = true

                Snacks.toggle({
                    name = "Formatter",
                    get = function()
                        return vim.g.format_on_save
                    end,
                    set = function(state)
                        vim.g.format_on_save = state
                    end,
                }):map "<leader>ulf"

                require("conform").setup(opts)
            end,
        },

        {
            "lewis6991/gitsigns.nvim",
            optional = true,
            config = function(_, opts)
                local gitsigns = require "gitsigns"
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

                gitsigns.setup(opts)
            end,
        },

        {
            "kosayoda/nvim-lightbulb",
            optional = true,
            config = function(_, opts)
                vim.g.enable_lightbulb = true

                Snacks.toggle({
                    name = "Lightbulb",
                    get = function()
                        return vim.g.enable_lightbulb
                    end,
                    set = function(state)
                        vim.g.enable_lightbulb = state
                    end,
                }):map "<leader>ull"

                require("nvim-lightbulb").setup(opts)
            end,
        },

        {
            "nvim-neo-tree/neo-tree.nvim",
            optional = true,
            config = function(_, opts)
                local events = require "neo-tree.events"

                local function on_move(data)
                    Snacks.rename.on_rename_file(data.source, data.destination)
                end

                opts.event_handlers = opts.event_handlers or {}

                vim.list_extend(opts.event_handlers, {
                    { event = events.FILE_MOVED, handler = on_move },
                    { event = events.FILE_RENAMED, handler = on_move },
                })

                require("neo-tree").setup(opts)
            end,
        },

        {
            "lewis6991/satellite.nvim",
            optional = true,
            opts_extend = { "excluded_filetypes" },
            opts = {
                excluded_filetypes = {
                    "snacks_dashboard",
                },
            },
        },
    },
}
