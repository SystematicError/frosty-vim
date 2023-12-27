FROSTY_PACKAGES = FROSTY_PACKAGES or {}
vim.opt.rtp:prepend(FROSTY_PACKAGES["folke/lazy.nvim"])

require "general"
require "mappings"

-- Try to load plugins and their dependencies locally if installed via flake
local function load_local_plugins(plugins)
    for i, plugin in ipairs(plugins) do
        plugin = type(plugin) == "table" and plugin or {plugin}

        if FROSTY_PACKAGES[plugin[1]] then
            plugin.dir = FROSTY_PACKAGES[plugin[1]]
            plugin.name = plugin.name or plugin[1]:match("^.+/(.+)$")        

            if plugin.dependencies then
                plugin.dependencies = type(plugin.dependencies) == "table" and plugin.dependencies or {plugin.dependencies}
                
                for _, dependency in ipairs(plugin.dependencies) do
                    table.insert(plugins, dependency)
                end
            end
        end

        plugins[i] = plugin
    end

    return plugins
end

require("lazy").setup(
    -- Plugin config
    load_local_plugins {
        {
            "navarasu/onedark.nvim",
            config = function()
                require("onedark").setup {style = "darker"}
                require("onedark").load()
            end
        },

        {
            "nvim-tree/nvim-tree.lua",
            dependencies = "nvim-tree/nvim-web-devicons",
            opts = require "plugins.tree"
        },

        {
            "akinsho/bufferline.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            opts = require "plugins.tabs"
        },

        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {
                scope = {
                    show_start = false,
                    show_end = false
                }
            }
        },

        {
            "windwp/nvim-autopairs",
            config = true
        }
    },

    -- Lazy configuration
    {
        defaults = {
            -- lazy = true
        },

        install = {
            colorscheme = { "onedark" }
        }   
    }
)

-- TODO: Remove later
vim.cmd "hi NvimTreeWinSeparator guifg=#181b20 guibg=#181b20"
