local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = "Add file"})
vim.keymap.set("n", "<leader>hp", ui.toggle_quick_menu, {desc = "Menu"})
vim.keymap.set("n", "<C-u>", function() ui.nav_file(1) end, {desc = "File 1"})
vim.keymap.set("n", "<C-i>", function() ui.nav_file(2) end, {desc = "File 2"})
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end, {desc = "File 3"})

