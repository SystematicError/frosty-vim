-- TODO: Modularise opts table
-- TODO: Modularise scope integration

local function config()
    -- TODO: Scope persistence is funky
    -- TODO: Don't persist neo-tree
    if require("lazy.core.config").plugins["scope.nvim"] then
        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistenceSavePre",
            group = vim.api.nvim_create_augroup("frosty_tabpage_session", { clear = true }),
            desc = "Save tabpage information with session",
            callback = function()
                vim.cmd "ScopeSaveState"
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistenceLoadPost",
            group = vim.api.nvim_create_augroup("frosty_tabpage_session", { clear = true }),
            desc = "Load tabpage information from session",
            callback = function()
                vim.cmd "ScopeLoadState"
            end,
        })
    end

    require("persistence").setup()
end

return {
    "folke/persistence.nvim",

    event = "BufReadPre",
    keys = {
        {
            "<leader>ss",
            function()
                require("persistence").load()
            end,
            desc = "Load session",
        },
        {
            "<leader>sS",
            function()
                require("persistence").select()
            end,
            desc = "Select session to load",
        },
        {
            "<leader>sl",
            function()
                require("persistence").load { last = true }
            end,
            desc = "Load last session",
        },
        {
            "<leader>sd",
            function()
                require("persistence").stop()
            end,
            desc = "Don't save session",
        },
    },

    config = config,
}
