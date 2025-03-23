require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    index = "~/Documents/neorg",
                },
            },
        },
        ["core.qol.todo_items"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            }
        },
    },
}
