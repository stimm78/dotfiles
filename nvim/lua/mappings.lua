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


--LSP Config
vim.keymap.set("n", "<leader>eh", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>ed", vim.lsp.buf.definition, { desc = "Go definition" })
vim.keymap.set({ "n", "v" }, "<leader>ea", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>ef", vim.lsp.buf.format, { desc = "Format" })

-- neotree mappings
vim.keymap.set('n', '<leader>t', ':Neotree toggle <CR>', { desc = "Neotree toggle " })


-- telescope mappings
vim.keymap.set("n", "<leader>ff", ':Telescope find_files <CR>', {})
vim.keymap.set("n", "<leader>fg", ':Telescope live_grep <CR>', {})
vim.keymap.set("n", "<leader>fb", ':Telescope buffers <CR>', {})
vim.keymap.set("n", "<leader>fh", ':Telescope help_tags <CR>', {})
