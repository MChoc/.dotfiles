return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "VonHeikemen/lsp-zero.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            local opts = { buffer = bufnr, remap = false }

            -- lsp_zero keymaps
            -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            -- vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
            -- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            -- vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
            -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            -- vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
            -- vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
            -- vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format({async = true}) end, opts)
            -- vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
            -- vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
            -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)

            -- custom keymaps
            vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set('n', '<leader>qf', function()
                vim.lsp.buf.code_action({
                    filter = function(a) return a.isPreferred end,
                    apply = true,
                })
            end, opts)
            -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            -- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        -- if you want to know more about lsp-zero and mason.nvim
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason.nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
            },
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "lua_snip", keyword_length = 2 },
                { name = "buffer",   keyword_length = 3 },
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
        })
    end
}
