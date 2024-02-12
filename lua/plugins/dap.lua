local function config()
    local dap = require "dap"
    local dapui = require "dapui"

    dap.adapters.codelldb = {
        type = "server",
        port = 13000,
        executable = {
            command = "codelldb",
            args = { "--port", "13000" },
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
            cwd = "${workspaceFolder}",
        },
    }

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
