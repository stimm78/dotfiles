vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

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

-- split yank buffers
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank in vim" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

-- Buffer movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set('n', '<Leader>o', ':only<CR>')
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Splitting
vim.keymap.set('n', '<Leader>-', '<C-W>s')
vim.keymap.set('n', '<Leader>\\', '<C-W>v')
vim.keymap.set('n', '<Leader>H', '<C-W>H')
vim.keymap.set('n', '<Leader>J', '<C-W>J')
vim.keymap.set('n', '<Leader>K', '<C-W>K')
vim.keymap.set('n', '<Leader>L', '<C-W>L')
vim.keymap.set('n', 'gf', '<C-W>gf')

-- Tabs
vim.keymap.set('n', '<Leader>1', '1gt')
vim.keymap.set('n', '<Leader>2', '2gt')
vim.keymap.set('n', '<Leader>3', '3gt')
vim.keymap.set('n', '<Leader>4', '4gt')
vim.keymap.set('n', '<Leader>5', '5gt')
vim.keymap.set('n', '<Leader>6', '6gt')
vim.keymap.set('n', '<Leader>7', '7gt')
vim.keymap.set('n', '<Leader>8', '8gt')
vim.keymap.set('n', '<Leader>9', '9gt')
vim.keymap.set('n', '<Leader>0', ':tablast<CR>')

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- quick fix
vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- front and end line jumps
vim.keymap.set("n", "B", "^")
vim.keymap.set("n", "E", "$")
-- make executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
