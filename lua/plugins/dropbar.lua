local function config()
    local opts = {}
    require("dropbar").setup(opts)
end

return {
    {
        "Bekaboo/dropbar.nvim",
        config = config,
    },

    colorscheme_integrations = {
        dropbar = {
            enabled = true,
            color_mode = false,
        },
    },
}
