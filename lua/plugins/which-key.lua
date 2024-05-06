local function config()
    local which_key = require "which-key"

    vim.g.mapleader = " "

    for mode, mappings in pairs(FROSTY_CONFIG.mappings) do
        which_key.register(mappings, { mode = mode })
    end
end

return {
    {
        "folke/which-key.nvim",
        config = config,
    },
}
