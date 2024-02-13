local function config()
    local dap = require "dap"
    local dapui = require "dapui"

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.rust = {
        {
            name = "Launch",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
        },
    }

    local debugger_signs = {
        Breakpoint = "● ",
    }

    for name, icon in pairs(debugger_signs) do
        local hl = "Dap" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    dapui.setup()
end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = "rcarriga/nvim-dap-ui",
        config = config,
    },
}
