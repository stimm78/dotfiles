return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local ls = require("luasnip")
            local fn = require("functions")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-P>'] = cmp.mapping.select_prev_item(),
                    ['<C-N>'] = cmp.mapping.select_next_item(),
                    ['<C-D>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-F>'] = cmp.mapping.scroll_docs(4),
                    ['<C-SPACE>'] = cmp.mapping.complete(),
                    ['<C-E>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),

                    -- luasnip integration
                    ['<C-L>'] = cmp.mapping(function(fallback)
                        if ls.choice_active() then
                            require('luasnip.extras.select_choice')()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if ls.expand_or_jumpable() then
                            ls.expand_or_jump()
                        elseif fn.has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if ls.jumpable(-1) then
                            ls.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- for luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
