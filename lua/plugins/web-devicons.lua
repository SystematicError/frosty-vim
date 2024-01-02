local function config()
    local opts = {
        default = true,
    }

    require("nvim-web-devicons").setup(opts)
end

return {
    {
        "nvim-tree/nvim-web-devicons",
        config = config,
    },
}
