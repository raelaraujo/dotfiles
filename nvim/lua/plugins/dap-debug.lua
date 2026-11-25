return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

        dap.adapters.python = {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return '/usr/bin/python'
                end,
            },
        }

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, { desc = "DAP Breakpoint" })
        vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = "DAP Continue" })
        vim.keymap.set('n', '<Leader>do', dap.step_over, { desc = "DAP Step Over" })
        vim.keymap.set('n', '<Leader>di', dap.step_into, { desc = "DAP Step Into" })
    end,
}
