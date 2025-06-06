-- TODO: Modularise snacks integration
-- TODO: Improve neo-tree config

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

local function config(_, opts)
    if Snacks then
        local events = require "neo-tree.events"

        local function on_move(data)
            Snacks.rename.on_rename_file(data.source, data.destination)
        end

        opts.event_handlers = opts.event_handlers or {}

        vim.list_extend(opts.event_handlers, {
            { event = events.FILE_MOVED, handler = on_move },
            { event = events.FILE_RENAMED, handler = on_move },
        })
    end

    require("neo-tree").setup(opts)
end

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
    config = config,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                neotree = true,
            },
        },
    },
}
