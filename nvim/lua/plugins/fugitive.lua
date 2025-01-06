return {
    'tpope/vim-fugitive',
    config = function()
        local wk = require("which-key")

        wk.register({
            {
                { "<leader>g", group = "Git" },
            }
        })
    end
}
