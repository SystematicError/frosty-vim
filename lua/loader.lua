FROSTY_PACKAGES = FROSTY_PACKAGES or {}

local lazy_path = FROSTY_PACKAGES["folke/lazy.nvim"]

if not lazy_path then
    lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

    if not vim.uv.fs_stat(lazy_path) then
        local output = vim.fn.system {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazy_path,
        }

        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { output, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})

            vim.fn.getchar()
            os.exit(1)
        end
    end
end

vim.opt.rtp:prepend(lazy_path)

local function ensure_table(object)
    return type(object) == "table" and object or { object }
end

local function inject_path(spec)
    if FROSTY_PACKAGES[spec[1]] then
        spec.dir = FROSTY_PACKAGES[spec[1]]
        spec.name = spec.name or spec[1]:match "^.+/(.+)$"
    end

    return spec
end

local function make_plugin_local(plugin)
    plugin = inject_path(ensure_table(plugin))

    if plugin.dependencies then
        plugin.dependencies = ensure_table(plugin.dependencies)

        for i, dependency in ipairs(plugin.dependencies) do
            plugin.dependencies[i] = inject_path(ensure_table(dependency))
        end
    end

    return plugin
end

return function(files)
    local plugins = {}

    for _, file in ipairs(files) do
        table.insert(plugins, make_plugin_local(require("plugins." .. file)))
    end

    return plugins
end
