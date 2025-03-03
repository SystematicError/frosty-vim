local function config()
    local icons = require "icons"

    local opts = {
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
                hide_gitignored = false,
            },
        },
    }

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
        { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
    },
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("frosty_lazy_neotree", { clear = true }),
            callback = function(args)
                local stat = vim.uv.fs_stat(args.file)

                if stat and stat.type == "directory" then
                    vim.cmd("Neotree dir=" .. args.file)
                    vim.api.nvim_clear_autocmds { group = "frosty_lazy_neotree" }
                end
            end,
        })
    end,

    config = config,
}
