vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>pq", ":q<enter>")

--Null Registers 
vim.keymap.set("n", "x", "\"_x")
vim.keymap.set("n", "<leader>d", "\"_d")

--Copy into system register 
vim.keymap.set("n", "<leader>+", "\"+y")

--Window movement
vim.cmd[[tnoremap <C-w>h <C-\><C-n><C-w>h]]
vim.cmd[[tnoremap <C-w>l <C-\><C-n><C-w>l]]
vim.cmd[[tnoremap <C-w>j <C-\><C-n><C-w>j]]
vim.cmd[[tnoremap <C-w>k <C-\><C-n><C-w>k]]


vim.keymap.set("n", "<leader>pwd", ":call setreg('+', expand('%'))<enter>")
vim.keymap.set("n", "<leader>v", "<c-v>")

