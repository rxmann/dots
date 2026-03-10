return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function() return vim.fn.executable("make") == 1 end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = true },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = { treesitter = false },
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-l>"] = require("telescope.actions").select_default,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
          additional_args = function() return { "--hidden" } end,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<M-p>",      builtin.find_files,   { desc = "Find files" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files,   { desc = "Find files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep,    { desc = "Live grep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string,  { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics,  { desc = "Search diagnostics" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps,      { desc = "Search keymaps" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "Fuzzy search buffer" })
  end,
}