require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    home = "~/Documents/neorg",
                },
                default_workspace = "home"
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
