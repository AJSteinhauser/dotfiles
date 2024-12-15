return {
    {
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons'
            },
            config = function()
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>of', function()
                    builtin.find_files{}
                end)
                vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
                vim.keymap.set('n', '<leader>ps', function()
                    builtin.live_grep({path_display = {"tail"}})
                end)

                vim.keymap.set('n', '<leader>p*', function()
                    builtin.grep_string({search = vim.fn.expand("<cword>")})
                end)

                vim.keymap.set('n', '<leader>p*', function()
                    builtin.grep_string({search = vim.fn.expand("<cword>")})
                end)


                local previewController = require('telescope.previewers')

                local lineController = function(filepath, bufnr, opts)
                    opts = opts or {}

                    filepath = vim.fn.expand(filepath)
                    vim.loop.fs_stat(filepath, function(_, stat)
                        if not stat then return end
                        if stat.size > 20000 then
                            return
                        else
                            previewController.buffer_previewer_maker(filepath, bufnr, opts)
                        end
                    end)
                end


                require('telescope').setup {
                    defaults = {
                        buffer_previewer_maker = new_maker,
                    }
                }
            end
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    }
}

