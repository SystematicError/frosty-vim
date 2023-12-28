FROSTY_PACKAGES = FROSTY_PACKAGES or {}
vim.opt.rtp:prepend(FROSTY_PACKAGES["folke/lazy.nvim"])

require "general"
require "mappings"

local function ensure_table(object)
    return type(object) == "table" and object or {object}
end

local function make_spec_local(spec)
    if FROSTY_PACKAGES[spec[1]] then
        spec.dir = FROSTY_PACKAGES[spec[1]]
        spec.name = spec.name or spec[1]:match("^.+/(.+)$")
    end

    return spec
end

-- Try to load plugins and their dependencies locally if installed via flake
-- This algorithm only traverses 2 deep, theoretically sub-dependencies could exist
-- Maybe implement recursively in the future?

local function load_local_plugins(plugins)
    for i, plugin in ipairs(plugins) do
        plugin = make_spec_local(ensure_table(plugin))
        
        if plugin.dependencies then
            plugin.dependencies = ensure_table(plugin.dependencies)
            
            for j, dependency in ipairs(plugin.dependencies) do
                plugin.dependencies[j] = make_spec_local(ensure_table(dependency))
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
            "hrsh7th/nvim-cmp",
            dependencies = {
                "neovim/nvim-lspconfig",
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline"
            },
            config = function() require "plugins.completion"  end
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

    -- Lazy config
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
