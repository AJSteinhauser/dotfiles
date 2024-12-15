return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            ui.setup()

            require("nvim-dap-virtual-text").setup()

            dap.adapters.coreclr = {
                type = 'executable',
                command = '/home/aj/.debuggers/netcoredbg/netcoredbg',
                args = {'--interpreter=vscode'}
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/Lockton_Services.dll', 'file')
                    end,
                },
            }
            local sign = vim.fn.sign_define
            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

            sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

            -- require('dap').defaults.fallback.exception_breakpoints = {'uncaught'}
            -- dap.defaults.fallback.exception_breakpoints = {'uncaught'}
            -- dap.set_exception_breakpoints("default")

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<C-Bslash>", dap.continue)
            vim.keymap.set("n", "<C-Down>", dap.step_into)
            vim.keymap.set("n", "<C-Right>", dap.step_over)
            vim.keymap.set("n", "<C-Up>", dap.step_out)
            vim.keymap.set("n", "<C-Left>", dap.step_back)
            vim.keymap.set("n", "<C-F10>", dap.set_exception_breakpoints)
            vim.keymap.set("n", "<C-F12>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end
    }
}
