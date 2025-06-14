return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            })

            telescope.load_extension("ui-select")

            -- Ctrl+P to find files
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })

            -- Ctrl+Shift+P to live grep
            vim.keymap.set("n", "<leader>lg", builtin.live_grep, { noremap = true, silent = true })

            -- <leader>ff to show old files
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { noremap = true, silent = true })
        end,
    },
}
