-- KEYMAPS

-- move highlighted text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center jumps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete and paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- buffer movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Splitting
vim.keymap.set('n', '<Leader>-', '<C-W>s', { desc = "Split horizontal" })
vim.keymap.set('n', '<Leader>\\', '<C-W>v', { desc = "Split vertical" })

-- front and end line jumps
vim.keymap.set("n", "B", "^")
vim.keymap.set("n", "E", "$")
--
-- updating
vim.keymap.set('n', '<Leader>L', ':Lazy sync<CR>', { desc = "Lazy sync" })


--LSP mappings
vim.keymap.set("n", "<leader>eh", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>eg", vim.lsp.buf.definition, { desc = "Go definition" })
vim.keymap.set({ "n", "v" }, "<leader>ea", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>ef", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set('n', '<Leader>ee', vim.lsp.buf.rename, { silent = false, desc = "Rename all" })
vim.keymap.set('n', '<Leader>ed', vim.lsp.buf.rename, { desc = "Diagnostics" })

-- neotree mappings
vim.keymap.set('n', '<leader>t', ':Neotree toggle <CR>', { desc = "Neotree toggle " })

-- telescope mappings
vim.keymap.set("n", "<leader>ff", ':Telescope find_files <CR>', {})
vim.keymap.set("n", "<leader>fg", ':Telescope live_grep <CR>', {})
vim.keymap.set("n", "<leader>fb", ':Telescope buffers <CR>', {})
vim.keymap.set("n", "<leader>fh", ':Telescope help_tags <CR>', {})

-- fugitive mappings
vim.keymap.set('n', '<Leader>gs', ':Git<CR>')
vim.keymap.set('n', '<Leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<Leader>gf', ':Git fetch<CR>')
vim.keymap.set('n', '<Leader>gd', ':Gvdiffsplit!<CR>')
vim.keymap.set('n', '<Leader>gh', ':diffget //2<CR>')
vim.keymap.set('n', '<Leader>gl', ':diffget //3<CR>')

-- barbar mappings
vim.keymap.set("n", "<Leader><", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<Leader>>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })

vim.keymap.set("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<Leader>0", "<Cmd>BufferLast<CR>")

vim.keymap.set("n", "<C-w>", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
