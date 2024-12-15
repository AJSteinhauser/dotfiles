
return {
    {
        'akinsho/toggleterm.nvim',
        config = true,
        version = "*",
        keys = {
            {
                "<leader>tt",
                "<cmd>ToggleTerm direction=float<cr>",
                desc="Open floating toggle term windows"
            },
            {
                "<C-j>",
                function()
                    print("Here")
                    require("toggleterm.terminal").Terminal.Toggle()
                end,
                desc="Minimize terminal"
            }
        },
    }
}
