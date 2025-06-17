
local function show_build_output_colored(output)
  -- Create a new buffer and open it in a new tab
  vim.cmd('tabnew')
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  vim.api.nvim_buf_set_name(buf, 'Build Output')

  -- Set the lines
  local lines = vim.split(output, '\n')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Define highlight groups if not already defined
  vim.cmd('highlight BuildError guifg=#ff5555 ctermfg=Red')
  vim.cmd('highlight BuildWarning guifg=#f1fa8c ctermfg=Yellow')

  -- Apply highlights for errors and warnings
  for i, line in ipairs(lines) do
    if line:lower():find('error') then
      vim.api.nvim_buf_add_highlight(buf, -1, 'BuildError', i - 1, 0, -1)
    elseif line:lower():find('warning') then
      vim.api.nvim_buf_add_highlight(buf, -1, 'BuildWarning', i - 1, 0, -1)
    end
  end
end

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

            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = {'--interpreter=vscode', '--log=/Users/aj.steinhauser/netcoredbg.log'}
            }

            dap.set_log_level('DEBUG')
            vim.fn.setenv('DAP_LOG', vim.fn.stdpath('cache') .. '/dap.log')

            dap.configurations.cs = {
                {
                    type = 'coreclr',
                    name = 'Launch - netcoredbg',
                    request = 'launch',
                    program = function()
                        local cwd = vim.fn.getcwd()
                        local project_name = vim.fn.fnamemodify(cwd, ":t")
                        local dll_path = cwd .. "/bin/Debug/net8.0/" .. project_name .. ".dll"
                        if vim.fn.filereadable(dll_path) == 1 then
                            return dll_path
                        else
                            error("Main DLL not found: " .. dll_path)
                        end
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = false,
                    before = function(config)
                        local cwd = vim.fn.getcwd()
                        local build_cmd = 'dotnet build'

                        print('Running: ' .. build_cmd .. ' in ' .. cwd)
                        local result = vim.fn.system(build_cmd)
                        local exit_code = vim.v.shell_error
                        if exit_code ~= 0 then
                            print('dotnet build failed')
                            show_build_output_colored(result)
                            return false
                        else
                            print('dotnet build succeeded')
                            return true
                        end
                    end,
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
