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
                ensure_installed = { "lua_ls", "pyright", "clangd", "texlab", "cmake"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
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
            lspconfig.cmake.setup({
                capabilities = capabilities
            })

            local wk = require("which-key")
            wk.register({
                {
                    { "<leader>e", group = "LSP" },
                }
            })
        end,
    },
}
