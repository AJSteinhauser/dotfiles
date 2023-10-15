require("reteach.remap")
require("reteach.set")

--vim.cmd[[autocmd BufLeave,FocusLost * silent! wall]]
vim.cmd[[inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"]]

