local wk = require("which-key")

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false
}

local mappings = {
    P = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    f = {
        name = "Telescope"
    },

    g = {
        name = "Git"
    },

    v = {
        name = "LSP"
    },

    p = {
        name = "Project"
    }
}

wk.register(mappings, opts)

