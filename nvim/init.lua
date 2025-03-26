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
g.maplocalleader = ";"

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
opt.wrap = false
opt.swapfile = false
opt.backup = false

opt.wrap = true -- optional
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50

-- enable smart case
o.smartcase = true
o.ignorecase = true

-- set shell
o.shell = '/usr/bin/fish'

-- enable system clipboard
o.clipboard = 'unnamedplus'

-- vimtex settings
g.vimtex_view_general_viewer = 'okular'
g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
g.vimtex_complete_enabled = 0
g.vimtex_quickfix_mode = 0
g.vimtex_syntax_enabled = 0
g.tex_flavor = 'latex'

g.vimtex_syntax_conceal = {
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

-- require'luasnip'.config.setup({
--   update_events = 'TextChanged,TextChangedI',
--   region_check_events = "InsertEnter",
--   enable_autosnippets = true
-- })
--
-- require('luasnip.loaders.from_lua').lazy_load({paths = "./snippets"})
--
