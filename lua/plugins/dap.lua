local function config()
    local dap = require "dap"
    local dapui = require "dapui"

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
