local function config()
    local opts = {
        highlight_on_key = true,
        dim = true,
    }

    require("eyeliner").setup(opts)
end

return {
    {
        "jinh0/eyeliner.nvim",
        config = config,
    },
}
