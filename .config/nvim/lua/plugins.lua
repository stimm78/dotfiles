-- lua plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
	use {'nvim-treesitter/nvim-treesitter'}
	use {'nvim-orgmode/orgmode', config = function() 
        require('orgmode').setup{} 
    end
	}

    use {
        'hrsh7th/nvim-cmp',
        config = function() require('configs.cmp') end,
        requires = {
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-nvim-lua',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-calc',
        },
  }

  use 'rmehri01/onenord.nvim'
end)


