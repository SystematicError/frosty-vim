local function config()
    local opts = {
        indent = {
            char = "▏",
        },

        scope = {
            show_start = false,
            show_end = false,
        },
    }

    require("ibl").setup(opts)
end

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = config,
    },
}
