FROSTY_PACKAGES = FROSTY_PACKAGES or {}

FROSTY_CONFIG = {
    mappings = require "mappings",
    colorscheme_integrations = {},
    highlights = require "highlights",
}

local lazy_path = FROSTY_PACKAGES["folke/lazy.nvim"]

if not lazy_path then
    lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazy_path) then
        vim.fn.system {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazy_path,
        }
    end
end

vim.opt.rtp:prepend(lazy_path)

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

return function(files)
    local plugins = {}

    local mappings = { FROSTY_CONFIG.mappings, {} }
    local colorscheme_integrations = { FROSTY_CONFIG.colorscheme_integrations, {} }
    local highlights = {
        FROSTY_CONFIG.highlights,
        function()
            return {}
        end,
    }

    for _, file in ipairs(files) do
        local module = require("plugins." .. file)

        table.insert(plugins, make_plugin_local(module[1]))

        if module.mappings then
            table.insert(mappings, module.mappings)
        end

        if module.colorscheme_integrations then
            table.insert(colorscheme_integrations, module.colorscheme_integrations)
        end

        if module.highlights then
            table.insert(highlights, module.highlights)
        end
    end

    FROSTY_CONFIG = {
        mappings = vim.tbl_deep_extend("force", unpack(mappings)),

        colorscheme_integrations = vim.tbl_extend("force", unpack(colorscheme_integrations)),

        highlights = function(colors)
            local highlight_tables = {}

            for _, highlight in ipairs(highlights) do
                table.insert(highlight_tables, highlight(colors))
            end

            return vim.tbl_extend("force", unpack(highlight_tables))
        end,
    }

    return plugins
end
