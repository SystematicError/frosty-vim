-- Flake bundles lsp servers and formatters using `runtimeDeps`
local languages = {
    "biome",
    "lua",
    "nix",
    "python",
    "rust",
    "sh",
}

local config = { {} }

for _, language in ipairs(languages) do
    table.insert(config, require("languages." .. language))
end

config = vim.tbl_deep_extend("force", unpack(config))

return config
