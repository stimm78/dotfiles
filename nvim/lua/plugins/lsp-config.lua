return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- add new LSPs here
                ensure_installed = { "lua_ls", "pyright", "clangd", "texlab" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- add new LSP config here
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.texlab.setup({
                capabilities = capabilities
            })

            local wk = require("which-key")
            wk.register({
                e = {
                    name = "LSP", -- optional group name
                },
            }, { prefix = "<leader>" })
        end,
    },
}
