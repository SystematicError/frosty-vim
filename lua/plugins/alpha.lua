local function config()
    require("alpha").setup(require("alpha.themes.dashboard").config)
end

return {
    {
        "goolord/alpha-nvim",
        config = config,
    },
}
