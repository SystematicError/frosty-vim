-- Quick and dirty script to add plugins as flake inputs from a running vim session
-- Use the vim command `:luafile generate-nix-inputs.lua` to update the inputs

local plugins = vim.tbl_map(function(p)
    return getmetatable(p).__index[1]
end, require("lazy.core.config").plugins)

plugins = vim.tbl_values(vim.tbl_map(function(p)
    return ('"%s"={url="github:%s";flake=false;};'):format(p, plugins[p])
end, vim.tbl_keys(plugins)))

table.sort(plugins)

plugins = "inputs={" .. table.concat(plugins) .. "};"

vim.fn.system(
    ("sed -i '/^\\s*# PLUGINS START/,/^\\s*# PLUGINS END/{/^\\s*# PLUGINS START/{p; a\\\n%s\n}; /^\\s*# PLUGINS END/p; d}' flake.nix"):format(
        plugins
    )
)

vim.fn.system "alejandra flake.nix"
