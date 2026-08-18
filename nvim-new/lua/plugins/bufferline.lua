return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- separator_style = "slant",
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", {
      desc = "Close buffers to the right",
    })

    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", {
      desc = "Close buffers to the left",
    })
  end,
}
