
local function get_visual_selection()
  -- Get the current buffer
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract the line and column numbers
  local start_line = start_pos[2] - 1 -- Convert to 0-based index
  local start_col = start_pos[3] - 1 -- Convert to 0-based index
  local end_line = end_pos[2] - 1    -- Convert to 0-based index
  local end_col = end_pos[3]         -- End column is exclusive

  -- Get the selected text
  local selected_text = vim.api.nvim_buf_get_text(
    bufnr,
    start_line,
    start_col,
    end_line,
    end_col
  )

  -- Join the lines into a single string (if multiline)
  return table.concat(selected_text, "\n")
end

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
                        builtin.grep_string({search = get_visual_selection()})
                    end,
                    mode = "v",
                    desc = "Search for string in project from currently highlighted text"
                },
                {
                    "<leader>p*", function()
                        local builtin = require('telescope.builtin')
                        builtin.grep_string({search = vim.fn.expand("<cword>")})
                    end,
                    mode = "n",
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

