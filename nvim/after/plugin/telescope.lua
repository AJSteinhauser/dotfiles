local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>of', function()
    builtin.find_files{ path_display = { "tail" } }
end)
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.live_grep({ path_display = {"tail"} })
end)

vim.keymap.set('n', '<leader>p*', function()
    builtin.grep_string({search = vim.fn.expand("<cword>")})
end)

local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 200000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end


require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
  }
}
