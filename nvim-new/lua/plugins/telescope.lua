return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-l>"] = require("telescope.actions").select_default,
          },
        },
        file_ignore_patterns = {
             "node_modules",
             "dist",
             "%.dist",
             "%.generated",
             "generated",
             "%.git",
             "%.venv",
        },
      },
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<M-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Find keymaps" })
  end,
}
