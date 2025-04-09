return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Toggle Neo-tree with Alt+n
        vim.keymap.set("n", "<A-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
        -- Reveal buffers in a floating window with leader+bf
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { noremap = true, silent = true })
    end,
}

