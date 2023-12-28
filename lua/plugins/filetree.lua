local config = {
    hijack_cursor = true,
    disable_netrw = true,
    sync_root_with_cwd = true,

    renderer = {
        group_empty = true,
        root_folder_label = ":t",
        special_files = {},

        icons = {
            symlink_arrow = "  ",
            glyphs = {
                folder = {
                    arrow_open = " ",
                    arrow_closed = " ",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "󰉒",
                    symlink_open = ""
                }
            }
        }
    },

    update_focused_file = {
        enable = true
    },

    filters = {
        git_ignored = false
    }
}

return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = config
    }
}
