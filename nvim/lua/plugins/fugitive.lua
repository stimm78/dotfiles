return {
    'tpope/vim-fugitive',
    config = function()
        local wk = require("which-key")

        wk.register({
            g = {
                name = "Git",                                                              -- optional group name
            },
        }, { prefix = "<leader>" })
    end
}
