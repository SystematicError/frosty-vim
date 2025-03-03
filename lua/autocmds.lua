local function group(name)
    return vim.api.nvim_create_augroup("frosty_" .. name, { clear = true })
end

local dynamic_cmdline_group = group "dynamic_cmdline"

vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = dynamic_cmdline_group,
    desc = "Show cmdline when typing a command",
    callback = function()
        vim.opt.cmdheight = 1
    end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = dynamic_cmdline_group,
    desc = "Hide cmdline when not typing a command",
    callback = function()
        vim.opt.cmdheight = 0
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = dynamic_cmdline_group,
    desc = "Get rid of message after writing a file",
    pattern = { "*" },
    command = "redrawstatus",
})
