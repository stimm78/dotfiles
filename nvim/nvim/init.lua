vim.loader.enable()

local opt = vim.opt
local o = vim.o
local g = vim.g
local fn = vim.fn

-- preload
g.python3_host_prog = '/usr/bin/python3'

-- load plugins
require('plugins')

-- general vim settings
g.mapleader = " "
g.maplocalleader = "\\"

-- Background light
o.background = "light"

-- OPTIONS
opt.nu = true
opt.relativenumber = true

opt.wrap = true
opt.linebreak = true
opt.showbreak = "|"
-- opt.spell = true
-- opt.spelllang = "en_us"
opt.conceallevel = 2

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = false 

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50

-- enable smart case
o.smartcase = true
o.ignorecase = true

-- enable cursor line
o.cursorline = true

-- set shell
o.shell = '/usr/bin/fish'

-- enable system clipboard
o.clipboard = 'unnamedplus'

-- vimtex settings
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.showbreak = "|"
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"
vim.opt_local.conceallevel = 2

-- vimtex settings
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_complete_enabled = 0
vim.g.vimtex_quickfix_mode = 0

vim.g.vimtex_compiler_latexmk = {
  ['options'] = {
    '-pdf',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-shell-escape'
  }
}

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
