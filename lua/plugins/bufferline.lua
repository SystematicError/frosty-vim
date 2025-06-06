-- TODO: Remove catppuccin dependency
-- TODO: Modularise snacks integration
-- TODO: Modularise scope integration

-- Close orphan buffers when deleting current tab
-- BUG: Cancelling the closing of an unwritten buffer still causes ghosting
-- BUG: Scope cache not instantly updating when making a new tab

local function delete_current_tab()
    local tab_list = require("scope.core").cache
    local current_tab = vim.api.nvim_get_current_tabpage()

    local other_buffers = {}

    for tab, buffer_list in pairs(tab_list) do
        if tab ~= current_tab then
            for _, buffer in ipairs(buffer_list) do
                table.insert(other_buffers, buffer)
            end
        end
    end

    for _, buffer in ipairs(tab_list[current_tab]) do
        if not vim.tbl_contains(other_buffers, buffer) then
            Snacks.bufdelete.delete(buffer)
        end
    end

    vim.cmd "tabclose"
end

local function delete_other_tabs()
    local tab_list = require("scope.core").cache
    local current_tab = vim.api.nvim_get_current_tabpage()

    for tab, buffer_list in pairs(tab_list) do
        if tab ~= current_tab then
            for _, buffer in ipairs(buffer_list) do
                if not vim.tbl_contains(tab_list[current_tab], buffer) then
                    Snacks.bufdelete.delete(buffer)
                end
            end
        end
    end

    vim.cmd "tabonly"
end

local default_opts = {
    options = {
        offsets = {
            {
                filetype = "neo-tree",
                highlight = "NeoTreeNormal",
                text = "",
                separator = false,
            },
        },
    },
}

local function config(_, opts)
    if Snacks then
        opts.options = opts.options or {}
        opts.options.close_command = "lua Snacks.bufdelete.delete(%d)"
        opts.options.right_mouse_command = opts.options.close_command

        vim.keymap.set("n", "<leader><tab>d", delete_current_tab, { desc = "Delete tab" })
        vim.keymap.set("n", "<leader><tab>o", delete_other_tabs, { desc = "Delete other tabs" })
    end

    require("scope").setup()
    require("bufferline").setup(opts)
end

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "catppuccin/nvim",
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
    },

    lazy = false,
    keys = {
        { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },

        { "<a-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
        { "<a-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },

        { "<c-a-l>", "<cmd>+tabmove<cr>", desc = "Move tab right" },
        { "<c-a-h>", "<cmd>-tabmove<cr>", desc = "Move tab left" },

        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer to move to" },
        { "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
        { "<leader>bD", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to delete" },

        { "<leader><tab>m", "<cmd>ScopeMoveBuf<cr>", desc = "Move buffer to tab" },
    },

    opts = default_opts,
    config = config,
}
