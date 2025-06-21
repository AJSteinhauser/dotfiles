return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()

        local on_attach = function(client, bufnr)
            print("LSP attached: " .. client.name)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.references() end, opts) -- replaced with telescope
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>vff", function() vim.lsp.buf.format() end, opts)
        end


        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach
                    }
                end
            }
        })

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, {"i", "s"}),
            }),
            sources = cmp.config.sources({
                { name = "codeium" },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
    keys = {
        {
            "gd", function()
                vim.lsp.buf.definition()
            end,
            desc = "Step back"
        },
        {
            "gi",
            function()
                vim.lsp.buf.implementation()
            end,
            desc = "Go to implementation"
        },
        {
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            desc = "Show hover documentation"
        },
        {
            "<leader>vws",
            function()
                vim.lsp.buf.workspace_symbol()
            end,
            desc = "Search workspace symbols"
        },
        {
            "<leader>vc",
            function()
                vim.lsp.buf.references()
            end,
            desc = "Show references"
        },
        {
            "<leader>vca",
            function()
                vim.lsp.buf.code_action()
            end,
            desc = "Code action"
        },
        {
            "<leader>vrn",
            function()
                vim.lsp.buf.rename()
            end,
            desc = "Rename symbol"
        },
        {
            "<leader>vff",
            function()
                vim.lsp.buf.format()
            end,
            desc = "Format file"
        },
    }
}
