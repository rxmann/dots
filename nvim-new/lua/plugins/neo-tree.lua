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
      close_if_last_window = true,
      window = {
        position = "left",
        width = 30,
      },
    })

    -- Toggle sticky left sidebar
    vim.keymap.set("n", "<M-n>", "<cmd>Neotree toggle position=left<CR>", {
      desc = "Toggle file tree sidebar",
    })

    -- Toggle centered floating modal
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle position=float<CR>", {
      desc = "Toggle file tree modal",
    })
    
    vim.keymap.set("n", "\\", "<cmd>Neotree reveal<CR>", {
      desc = "Reveal current file",
    })
  end,
}
