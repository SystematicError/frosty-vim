FROSTY_PACKAGES = FROSTY_PACKAGES or {}
vim.opt.rtp:prepend(FROSTY_PACKAGES["folke/lazy.nvim"])

local function ensure_table(object)
    return type(object) == "table" and object or { object }
end

local function make_spec_local(spec)
    if FROSTY_PACKAGES[spec[1]] then
        spec.dir = FROSTY_PACKAGES[spec[1]]
        spec.name = spec.name or spec[1]:match "^.+/(.+)$"
    end

    return spec
end

local function make_plugin_local(plugin)
    plugin = make_spec_local(ensure_table(plugin))

    if plugin.dependencies then
        plugin.dependencies = ensure_table(plugin.dependencies)

        for i, dependency in ipairs(plugin.dependencies) do
            plugin.dependencies[i] = make_spec_local(ensure_table(dependency))
        end
    end

    return plugin
end

local function fetch_plugin_configs(files)
    local plugins = {}

    for _, file in ipairs(files) do
        for _, plugin in ipairs(require("plugins." .. file)) do
            table.insert(plugins, make_plugin_local(plugin))
        end
    end

    return plugins
end

require "options"
require "mappings"

require("lazy").setup(
    fetch_plugin_configs {
        "colorscheme",
        "neo-tree",
        "web-devicons",
        "bufferline",
        "feline",
        "notify",
        "gitsigns",
        "colorizer",
        "treesitter",
        "cmp",
        "lspconfig",
        "luasnip",
        "conform",
        "telescope",
        "which-key",
        "indent-blankline",
        "guess-indent",
        "autopairs",
    },

    {
        defaults = {
            -- lazy = true
        },

        install = {
            colorscheme = { "catppuccin" },
        },
    }
)
