return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>a", function()
                    local harpoon = require("harpoon")
                    harpoon:list():add()
                end,
                desc = "Add to harpoon list"
            },
            {
                "<C-e>", function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Toggle harpoon list"
            },
            {
                "<leader>ph", function()
                    local harpoon = require("harpoon")
                    local conf = require("telescope.config").values
                    local function toggle_telescope(harpoon_files)
                        local file_paths = {}
                        for _, item in ipairs(harpoon_files.items) do
                            table.insert(file_paths, item.value)
                        end

                        require("telescope.pickers").new({}, {
                            prompt_title = "Harpoon",
                            finder = require("telescope.finders").new_table({
                                results = file_paths,
                            }),
                            previewer = conf.file_previewer({}),
                            sorter = conf.generic_sorter({}),
                        }):find()
                    end
                    toggle_telescope(harpoon:list())
                end,
                desc = "Toggle harpoon telescope"
            },

            -- Select buffer 1-4
            {
                "<leader>ja", function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(1)
                end,
                desc = "Select first buffer on harpoon list"
            },
            {
                "<leader>js", function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(2)
                end,
                desc = "Select second buffer on harpoon list"
            },
            {
                "<leader>jd", function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(3)
                end,
                desc = "Select third buffer on harpoon list"
            },
            {
                "<leader>jd", function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(4)
                end,
                desc = "Select fourth buffer on harpoon list"
            },
        }
    }
}
