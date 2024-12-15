
return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        opts = {
            enabled = false,
            message_template = " <summary> • <date> • <author> • <<sha>>",
            date_format = "%m-%d-%Y", -- template for the date, check Date format section for more options
            virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
        },
        keys = {
            {
                "<leader>i", "<cmd>GitBlameToggle<cr>",desc = "Toggle git blamer"
            }
        }
    }
}

