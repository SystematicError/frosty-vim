local function config()
    local opts = {
        print_tag = " DBG",
        display_counter = false,
    }

    require("debugprint").setup(opts)
end

return {
    {
        "andrewferrier/debugprint.nvim",
        config = config,
    },

    mappings = {
        n = {
            ["g?d"] = { "<cmd>DeleteDebugPrints<cr>", "Delete debug prints" },
        },
    },
}
