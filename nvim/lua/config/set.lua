vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.showbreak = "|"
-- vim.opt_local.spell = true
-- vim.opt_local.spelllang = "en_us"
vim.opt_local.conceallevel = 2

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.wrap = true  -- optional
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- enable smart case
vim.o.smartcase = true
vim.o.ignorecase = true

-- vimwiki 
vim.g.vimwiki_list = {{path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md'}}

-- vimtex settings
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_complete_enabled = 0
vim.g.vimtex_quickfix_mode = 0
vim.g.maplocalleader = ";"
vim.g.vimtex_syntax_enabled = 0

vim.g.vimtex_syntax_conceal = {
  ['accents'] = 1,
  ['ligatures'] = 1,
  ['cites'] = 1,
  ['fancy'] = 0,
  ['greek'] = 1,
  ['spacing'] = 1,
  ['math_bounds'] = 1,
  ['math_delimiters'] = 1,
  ['math_fracs'] = 0,
  ['math_super_sub'] = 1,
  ['math_symbols'] = 1,
  ['sections'] = 1,
  ['styles'] = 1
}
