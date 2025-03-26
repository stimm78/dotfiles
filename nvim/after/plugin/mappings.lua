local fn = require 'functions'
local keymap = vim.keymap.set
local wrap = fn.fnwrap

local wk = require("which-key")
wk.add({
    -- File Mappings
    { "<leader>f", group = "Telescope" }, -- Group for telescope keymaps
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags", mode = "n" },

    -- Fugitive git
    { "<leader>g", group = "Git" }, -- Group for telescope keymaps
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status", mode = "n" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push", mode = "n" },
    { "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git Fetch", mode = "n" },
    { "<leader>gd", "<cmd>Gvdiffsplit!<cr>", desc = "Git Diff", mode = "n" },
    { "<leader>gh", "<cmd>diffget //2<cr>", desc = "Git Diff Left", mode = "n" },
    { "<leader>gl", "<cmd>diffget //3<cr>", desc = "Git Diff Right", mode = "n" },

    -- Window Management
    { "<leader>w", group = "windows" }, -- Group for window-related mappings
    { "<C-h>", "<C-w>h", desc = "Move Left" },
    { "<C-j>", "<C-w>j", desc = "Move Down" },
    { "<C-k>", "<C-w>k", desc = "Move Up" },
    { "<C-l>", "<C-w>l", desc = "Move Right" },
    { "<leader>-", "<C-W>s", desc = "Split Horizontal" },
    { "<leader>\\", "<C-W>v", desc = "Split Vertical" },

    -- Split/Join/Move Text
    { "J", ":m '>+1<CR>gv=gv", desc = "Move Text Down", mode = "v" },
    { "K", ":m '<-2<CR>gv=gv", desc = "Move Text Up", mode = "v" },
    { "J", "mzJ`z", desc = "Join Lines and Center", mode = "n" },
    { "<C-d>", "<C-d>zz", desc = "Scroll Down and Center", mode = "n" },
    { "<C-u>", "<C-u>zz", desc = "Scroll Up and Center", mode = "n" },
    { "n", "nzzzv", desc = "Next Search and Center", mode = "n" },
    { "N", "Nzzzv", desc = "Previous Search and Center", mode = "n" },
    { "B", "^", desc = "Start of line", mode = "n" },
    { "E", "$", desc = "End of line", mode = "n" },

    -- Paste and Delete
    { "<leader>p", [["_dP]], desc = "Delete and Paste", mode = "x" },

    -- LSP Mappings
    { "<leader>e", group = "LSP" }, -- Group for file-related keymaps
    { "<leader>eh", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>eg", vim.lsp.buf.definition, desc = "Go to Definition" },
    { "<leader>ea", vim.lsp.buf.code_action, desc = "Code Actions", mode = { "n", "v" } },
    { "<leader>ef", vim.lsp.buf.format, desc = "Format", mode = "n" },
    { "<leader>ee", vim.lsp.buf.rename, desc = "Rename All", mode = "n" },
    { "<leader>ed", vim.diagnostic.show, desc = "Diagnostics", mode = "n" },

    -- Neotree Toggle
    { "<leader>t", ":Neotree toggle <CR>", desc = "Neotree Toggle", mode = "n" },

    -- Lazy Sync
    { "<leader>L", ":Lazy sync<CR>", desc = "Lazy Sync", mode = "n" },

    -- Neorg
    { "<leader>n", group = "Neorg" },
    { "<leader>nn", "<Plug>(neorg.dirman.new-note)", desc = "Create new note"},

    -- Jump to this file
    { "<leader>m", ":e ~/.config/nvim/after/plugin/mappings.lua <CR>", desc = "Mapping config"},

-- Remap ; to .
    { ".", ";", desc = "Remap ; to .", mode = {"n", "v"}},

})

-- Enable vi$ in Latex
vim.keymap.set("o", "i$", ":normal! T$vt$<CR>", { silent = true })
vim.keymap.set("x", "i$", "T$ot$", { silent = true })

-- Inkscape integration
vim.keymap.set('i', '<c-f>', "<Esc>: silent exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR><CR>:w<CR>", { silent = true, noremap = true })
vim.keymap.set('n', '<c-f>', ": silent exec '!inkscape-figures edit \"'.b:vimtex.root.'/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>", { silent = true, noremap = true })
