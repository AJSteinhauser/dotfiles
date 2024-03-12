vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>pq", ":q<enter>")

vim.keymap.set("n", "<leader>pt", ":Fern .<enter>")
vim.keymap.set("n", "<leader>pr", ":Fern . -reveal=%<enter>")

--Terminal popup
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<enter>")
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--Autocomplete remaps
vim.keymap.set("n", "<leader>y", "<C>y")

--Trouble menu popup
vim.keymap.set("n", "<leader>e", ":Trouble<enter>")
vim.keymap.set("n", "<leader>E", ":TroubleClose<enter>")

--Git blame toggle
vim.keymap.set("n", "<leader>gb",":BlamerToggle<enter>")


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


-- Neovim copy settings for WSL
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end


---Disable mouse
vim.opt.mouse = nil
