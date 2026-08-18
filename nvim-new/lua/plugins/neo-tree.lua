return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup({

        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},


      close_if_last_window = true,
      window = {
        position = "left",
        width = 30,
        highlight_opened_files = true,
      },
    })


    -- Toggle sticky left sidebar
    vim.keymap.set("n", "<M-n>", "<cmd>Neotree toggle position=left reveal<CR>", {
      desc = "Toggle file tree sidebar",
    })

    -- Toggle centered floating modal
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle position=float reveal<CR>", {
      desc = "Toggle file tree modal",
    })
    
    vim.keymap.set("n", "\\", "<cmd>Neotree reveal<CR>", {
      desc = "Reveal current file",
    })
  end,
}
