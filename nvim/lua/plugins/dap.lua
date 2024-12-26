
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
            local ui = require("dapui")
            local virtualDapText = require("nvim-dap-virtual-text")

            ui.setup()
            virtualDapText.setup()

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
                "<C-Bslash>", function()
                    local dap = require("dap")
                    dap.continue()
                end,
                desc = "Continue"
            },
            {
                "<C-Down>", function()
                    local dap = require("dap")
                    dap.step_into()
                end,
                desc = "Step into"
            },
            {
                "<C-Right>", function()
                    local dap = require("dap")
                    dap.step_over()
                end,
                desc = "Step over"
            },
            {
                "<C-Up>", function()
                    local dap = require("dap")
                    dap.step_out()
                end,
                desc = "Step out"
            },
            {
                "<C-Left>", function()
                    local dap = require("dap")
                    dap.step_back()
                end,
                desc = "Step back"
            },
            {
                "<C-F10>", function()
                    local dap = require("dap")
                    dap.set_exception_breakpoints()
                end,
                desc = "Set exceptions breakpoint"
            },
            {
                "<C-F12>", function()
                    local dap = require("dap")
                    dap.restart()
                end,
                desc = "Restart"
            },
        }

    }
}
