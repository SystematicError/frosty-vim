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
    command = "redrawstatus",
})

local progress = vim.defaulttable()
local progress_icons = require("icons").lsp_progress

vim.api.nvim_create_autocmd("LspProgress", {
    group = group "lsp_progress",
    desc = "Show LSP progress notification",
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value

        if not client or type(value) ~= "table" then
            return
        end

        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {}

        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = progress_icons.spinner

        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and progress_icons.done
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})
