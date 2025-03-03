local function config()
    local git_gutter = require("icons").git_gutter

    local signs = {}

    for name, sign in pairs(git_gutter) do
        signs[name] = { text = sign }
    end

    local opts = {
        signs = signs,
        signs_staged_enable = false,
        current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
    }

    require("gitsigns").setup(opts)
end

return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = config,
}
