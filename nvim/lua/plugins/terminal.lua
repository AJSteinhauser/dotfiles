
return {
    {
        'akinsho/toggleterm.nvim',
        config = function ()
            vim.api.nvim_set_keymap(
                't',
                '<C-h>',
                [[<C-\><C-n>:ToggleTerm<CR>]],
                { noremap = true, silent = true }
            )
            require("toggleterm").setup()
        end,
        version = "*",
        keys = {
            {
                "<leader>tt",
                "<cmd>ToggleTerm direction=float<cr>",
                desc="Open floating toggle term windows"
            },
            {
                "<C-h>",
                "<cmd>ToggleTerm",
                desc="Open floating toggle term windows"
            },
        },
    },
}
