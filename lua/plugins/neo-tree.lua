local function config()
    local opts = {
        close_if_last_window = true,
        enable_diagnostics = false,
        enable_modified_markers = false,

        default_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
            },

            name = {
                use_git_status_colors = false,
            },

            git_status = {
                symbols = {
                    added = "",
                    modified = "",
                    deleted = "",
                    renamed = "󰏫",

                    untracked = "",
                    ignored = "󱙝",
                    unstaged = "○",
                    staged = "●",
                    conflict = "",
                },
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
                hide_gitignored = false,
            },
        },
    }

    require("neo-tree").setup(opts)
end

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = config,
    },

    mappings = {
        n = {
            ["<leader>"] = {
                n = {
                    name = "Neotree",

                    s = { "<cmd>Neotree show<cr>", "Show" },
                    c = { "<cmd>Neotree close<cr>", "Close" },
                    t = { "<cmd>Neotree toggle<cr>", "Toggle" },
                },
            },
        },
    },

    highlights = function(colors)
        return {
            NeoTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
            NeoTreeCursorLine = { bg = colors.mantle },
            NeoTreeIndentMarker = { fg = colors.surface0 },
        }
    end,
}
