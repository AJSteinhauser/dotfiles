local dap = require "dap"
local ui = require "dapui"

require("dapui").setup()

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
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net7.0/Lockton_Services.dll', 'file')
    end,
  },
}

dap.defaults.fallback.exception_breakpoints = {'raised'}

vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
    require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<C-F1>", dap.continue)
vim.keymap.set("n", "<C-F2>", dap.step_into)
vim.keymap.set("n", "<C-F3>", dap.step_over)
vim.keymap.set("n", "<C-F4>", dap.step_out)
vim.keymap.set("n", "<C-F5>", dap.step_back)
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
