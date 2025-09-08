local icons = require "icons"

local default_opts = {
    close_if_last_window = true,
    enable_diagnostics = false,
    enable_modified_markers = false,

    default_component_configs = {
        icon = icons.tree_folder,

        name = {
            use_git_status_colors = false,
        },

        git_status = {
            symbols = icons.tree_git,
        },

        symlink_target = {
            enabled = true,
        },
    },

    window = {
        width = 35,
    },

    filesystem = {
        group_empty_dirs = true,
        use_libuv_file_watcher = true,

        filtered_items = {
            hide_dotfiles = false,
        },
        hide_gitignored = false,
    },
}

-- Config function defined in `plugins/snacks.lua`
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File explorer" },
    },
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("frosty_lazy_neotree", { clear = true }),
            desc = "Lazy load neo-tree when opening a directory",
            callback = function(args)
                local stat = vim.uv.fs_stat(args.file)

                if stat and stat.type == "directory" then
                    vim.cmd "Neotree show"
                    vim.api.nvim_clear_autocmds { group = "frosty_lazy_neotree" }
                end
            end,
        })
    end,

    opts = default_opts,

    specs = {
        {
            "catppuccin/nvim",
            optional = true,
            opts = {
                integrations = {
                    neotree = true,
                },
            },
        },

        {
            "akinsho/bufferline.nvim",
            optional = true,
            opts = {
                options = {
                    offsets = {
                        {
                            filetype = "neo-tree",
                            highlight = "NeoTreeNormal",
                            text = "",
                            separator = false,
                        },
                    },
                },
            },
        },

        {
            "NeogitOrg/neogit",
            optional = true,
            config = function()
                vim.api.nvim_create_autocmd("BufWinLeave", {
                    pattern = "NeogitStatus",
                    group = vim.api.nvim_create_augroup("frosty_neotree_git_update", { clear = true }),
                    desc = "Update neotree's git icons after neogit updates its status",
                    callback = function()
                        local events = require "neo-tree.events"
                        events.fire_event(events.GIT_EVENT)
                    end,
                })
            end,
        },

        {
            "folke/persistence.nvim",
            optional = true,
            config = function(_, opts)
                vim.api.nvim_create_autocmd("User", {
                    group = vim.api.nvim_create_augroup("frosty_neotree_dont_persist", { clear = true }),
                    pattern = "PersistenceSavePre",
                    callback = function()
                        vim.cmd "Neotree close"
                    end,
                })

                require("persistence").setup(opts)
            end,
        },

        {
            "lewis6991/satellite.nvim",
            optional = true,
            opts_extend = { "excluded_filetypes" },
            opts = {
                excluded_filetypes = {
                    "neo-tree",
                },
            },
        },
    },
}
