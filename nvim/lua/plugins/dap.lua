
local function setDapDefaults()
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#191724' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#191724' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

    local sign = vim.fn.sign_define
    sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
end

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
            setDapDefaults()

            local dap = require("dap")

            -- dap.adapters.coreclr = {
            --     type = 'executable',
            --     command = 'arch',
            --     args = {'/Users/aj.steinhauser/.debuggers/netcoredbg/src/netcoredbg', '--interpreter=vscode'}
            -- }
            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = {'--interpreter=vscode', '--log=/Users/aj.steinhauser/netcoredbg.log'}
            }

            dap.set_log_level('DEBUG')
            vim.fn.setenv('DAP_LOG', vim.fn.stdpath('cache') .. '/dap.log')

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = "/Users/aj.steinhauser/locktonre-sage-services-standalone/Lockton_Services/bin/Debug/net8.0/Lockton_Services.dll"
                },
            }

            dap.set_log_level('DEBUG')
            -- Optionally, specify the log file location (default is in the Neovim cache directory)
            vim.fn.setenv('DAP_LOG', vim.fn.stdpath('cache') .. '/dap.log')

            local ui = require("dapui")
            local virtualDapText = require("nvim-dap-virtual-text")

            ui.setup()
            virtualDapText.setup()


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
        end,
        keys = {
            {
                "<leader>b", function()
                    local dap = require("dap")
                    dap.toggle_breakpoint()
                end,
                desc = "Toggle breakpoint"
            },
            {
                "<space>gb", function()
                    local dap = require("dap")
                    dap.run_to_cursor()
                end,
                desc = "Run to cursor"
            },
            {
                "<leader>?", function()
                    local dapui = require("dapui")
                    dapui.eval(nil, { enter = true })
                end,
                desc = "Evaluate symbol"
            },
            {
                "<A-Bslash>", function()
                    local dap = require("dap")
                    dap.continue()
                end,
                desc = "Continue"
            },
            {
                "<A-Down>", function()
                    local dap = require("dap")
                    dap.step_into()
                end,
                desc = "Step into"
            },
            {
                "<A-Right>", function()
                    local dap = require("dap")
                    dap.step_over()
                end,
                desc = "Step over"
            },
            {
                "<A-Up>", function()
                    local dap = require("dap")
                    dap.step_out()
                end,
                desc = "Step out"
            },
            {
                "<A-Left>", function()
                    local dap = require("dap")
                    dap.step_back()
                end,
                desc = "Step back"
            },
            {
                "<A-F10>", function()
                    local dap = require("dap")
                    dap.set_exception_breakpoints()
                end,
                desc = "Set exceptions breakpoint"
            },
            {
                "<A-F12>", function()
                    local dap = require("dap")
                    dap.restart()
                end,
                desc = "Restart"
            },
        }

    }
}
