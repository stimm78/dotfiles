-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    use('MetriC-DT/balance-theme.nvim')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-tree/nvim-web-devicons'
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
    -- use {
    --   "mfussenegger/nvim-dap",
    --   opt = true,
    --   event = "BufReadPre",
    --   module = { "dap" },
    --   wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    --   requires = {
    --     "Pocco81/DAPInstall.nvim",
    --     "theHamsta/nvim-dap-virtual-text",
    --     "rcarriga/nvim-dap-ui",
    --     "mfussenegger/nvim-dap-python",
    --     "nvim-telescope/telescope-dap.nvim",
    --     { "leoluz/nvim-dap-go", module = "dap-go" },
    --     { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    --   },
    --   config = function()
    --     require("config.dap").setup()
    --   end,
    -- }
    use {'vimwiki/vimwiki'}
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Using Packer
end)

