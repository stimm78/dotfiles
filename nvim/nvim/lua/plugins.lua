-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)



-- plugin list
local plugins = {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
            -- 'rafamadriz/friendly-snippets',
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
            {'crispgm/telescope-heading.nvim'},
            {'nvim-telescope/telescope-file-browser.nvim'},
            {'nvim-telescope/telescope-ui-select.nvim' },
        }
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
    },

    {'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'dericktseng/balance-theme.nvim',

    },

    {
        'numToStr/Comment.nvim',
    },

    {
        'nvim-neorg/neorg',
        dependencies = {
            'nvim-neorg/lua-utils.nvim',
            'pysan3/pathlib.nvim',
            'nvim-neotest/nvim-nio',
        },
    },

    {
        'rpapallas/illustrate.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
    },

    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },

    {
        'folke/which-key.nvim',
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },

    'L3MON4D3/LuaSnip',
    'nvim-lualine/lualine.nvim',
    'windwp/nvim-autopairs',
    'lervag/vimtex',
    'tpope/vim-fugitive',
    'folke/flash.nvim',
}

-- lazy.nvim optional configurations
local opts = {}

return require('lazy').setup(plugins, opts)

