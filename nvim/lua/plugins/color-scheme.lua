return { 
    {
        "rose-pine/neovim", 
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "typescript", "javascript", "html", "css", "scss" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require'colorizer'.setup()
        end,
    }
}
