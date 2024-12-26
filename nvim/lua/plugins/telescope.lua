return {
    {
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
                'axkirillov/telescope-changed-files'
            },
            config = function()
                require('telescope').load_extension('changed_files')
            end,
            keys = {
                {
                    "<leader>of", function()
                        local builtin = require('telescope.builtin')
                        builtin.find_files({})
                    end,
                    desc = "Search all files"
                },
                {
                    "<leader>pf", function()
                        local builtin = require('telescope.builtin')
                        builtin.git_files({})
                    end,
                    desc = "Search all git tracked files"
                },
                {
                    "<leader>ps", function()
                        local builtin = require('telescope.builtin')
                        builtin.live_grep({path_display = {"tail"}})
                    end,
                    desc = "Search for string in project"
                },
                {
                    "<leader>p*", function()
                        local builtin = require('telescope.builtin')
                        builtin.grep_string({search = vim.fn.expand("<cword>")})
                    end,
                    desc = "Search for string in project from currently hovered word"
                },
                {
                    "<leader>ps", function()
                        local builtin = require('telescope.builtin')
                        builtin.live_grep({path_display = {"tail"}})
                    end,
                    desc = "Search for string in project"
                },
                {
                    "<leader>ps", function()
                        local builtin = require('telescope.builtin')
                        builtin.live_grep({path_display = {"tail"}})
                    end,
                    desc = "Search for string in project"
                },
                {
                    "<leader>pg", "<cmd>Telescope changed_files<cr>",
                    desc = "Search for string in project"
                },
            }
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    }
}

