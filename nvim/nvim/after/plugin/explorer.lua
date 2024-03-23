-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup(
)

-- Tree toggle
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

-- local swap_then_open_tab = function()
--     local node = lib.get_node_at_cursor()
--     vim.cmd("wincmd l")
--     api.node.open.tab(node)
-- end
