vim.lsp.set_log_level("debug")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>pq", ":q<enter>")

vim.keymap.set("n", "[q", function()
  vim.cmd("cp")
end)

vim.keymap.set("n", "]q>", function()
  vim.cmd("cn")
end)

--null registers 
vim.keymap.set("n", "x", "\"_x")
vim.keymap.set("n", "<leader>d", "\"_d")

--window movement
vim.cmd[[tnoremap <c-w>h <c-\><c-n><c-w>h]]
vim.cmd[[tnoremap <c-w>l <c-\><c-n><c-w>l]]
vim.cmd[[tnoremap <c-w>j <c-\><c-n><c-w>j]]
vim.cmd[[tnoremap <c-w>k <c-\><c-n><c-w>k]]


vim.keymap.set("n", "<leader>pwd", ":call setreg('+', expand('%'))<enter>")
vim.keymap.set("n", "<leader>v", "<c-v>")

vim.api.nvim_create_user_command('Scratch', function()
  vim.cmd('enew')
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'hide'
  vim.bo.swapfile = false
end, {})
