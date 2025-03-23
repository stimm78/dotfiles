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

  -- Paste and Delete
  { "<leader>p", [["_dP]], desc = "Delete and Paste", mode = "x" },

  -- LSP Mappings
  { "<leader>e", group = "LSP" }, -- Group for file-related keymaps
  { "<leader>eh", vim.lsp.buf.hover, desc = "Hover" },
  { "<leader>eg", vim.lsp.buf.definition, desc = "Go to Definition" },
  { "<leader>ea", vim.lsp.buf.code_action, desc = "Code Actions", mode = { "n", "v" } },
  { "<leader>ef", vim.lsp.buf.format, desc = "Format", mode = "n" },
  { "<leader>ee", vim.lsp.buf.rename, desc = "Rename All", mode = "n" },
  -- { "<leader>ed", vim.lsp.diagnostic.show_line_diagnostics, desc = "Diagnostics", mode = "n" },

  -- Neotree Toggle
  -- { "<leader>t", ":Neotree toggle <CR>", desc = "Neotree Toggle", mode = "n" },

  -- Lazy Sync
  { "<leader>L", ":Lazy sync<CR>", desc = "Lazy Sync", mode = "n" },
  { ".", ";", desc = "Remap ; to ." }, -- Remap ; to .
})
--
-- KEYMAPS
--
-- -- move highlighted text around
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- -- center jumps
-- keymap.set("n", "J", "mzJ`z")
-- keymap.set("n", "<C-d>", "<C-d>zz")
-- keymap.set("n", "<C-u>", "<C-u>zz")
-- keymap.set("n", "n", "nzzzv")
-- keymap.set("n", "N", "Nzzzv")
--
-- -- delete and paste
-- keymap.set("x", "<leader>p", [["_dP]])
--
-- -- buffer movement
-- keymap.set("n", "<C-h>", "<C-w>h")
-- keymap.set("n", "<C-j>", "<C-w>j")
-- keymap.set("n", "<C-k>", "<C-w>k")
-- keymap.set("n", "<C-l>", "<C-w>l")
--
-- -- Splitting
-- keymap.set('n', '<Leader>-', '<C-W>s', { desc = "Split horizontal" })
-- keymap.set('n', '<Leader>\\', '<C-W>v', { desc = "Split vertical" })
--
-- -- front and end line jumps
-- keymap.set("n", "B", "^")
-- keymap.set("n", "E", "$")
-- --
-- -- updating
-- keymap.set('n', '<Leader>L', ':Lazy sync<CR>', { desc = "Lazy sync" })
--
--
-- --LSP mappings
-- keymap.set("n", "<leader>eh", vim.lsp.buf.hover, { desc = "Hover" })
-- keymap.set("n", "<leader>eg", vim.lsp.buf.definition, { desc = "Go definition" })
-- keymap.set({ "n", "v" }, "<leader>ea", vim.lsp.buf.code_action, { desc = "Code actions" })
-- keymap.set("n", "<leader>ef", vim.lsp.buf.format, { desc = "Format" })
-- keymap.set('n', '<Leader>ee', vim.lsp.buf.rename, { silent = false, desc = "Rename all" })
-- keymap.set('n', '<Leader>ed', vim.lsp.diagonstic., { desc = "Diagnostics" })
--
-- -- neotree mappings
-- keymap.set('n', '<leader>t', ':Neotree toggle <CR>', { desc = "Neotree toggle " })
--
-- -- telescope mappings
-- keymap.set("n", "<leader>ff", ':Telescope find_files <CR>', {})
-- keymap.set("n", "<leader>fg", ':Telescope live_grep <CR>', {})
-- keymap.set("n", "<leader>fb", ':Telescope buffers <CR>', {})
-- keymap.set("n", "<leader>fh", ':Telescope help_tags <CR>', {})
--
-- -- fugitive mappings
-- -- keymap.set('n', '<Leader>gs', ':Git<CR>')
-- -- keymap.set('n', '<Leader>gp', ':Git push<CR>')
-- -- keymap.set('n', '<Leader>gf', ':Git fetch<CR>')
-- -- keymap.set('n', '<Leader>gd', ':Gvdiffsplit!<CR>')
-- -- keymap.set('n', '<Leader>gh', ':diffget //2<CR>')
-- -- keymap.set('n', '<Leader>gl', ':diffget //3<CR>')
--
-- keymap.set("n", "<C-w>", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
--
-- -- remap ; to different key for local leader conflict
-- keymap.set("n", ".", ";")
--
--
