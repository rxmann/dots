return {
  "nickkadutskyi/jb.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local transparent = false

    local function apply(t)
      require("jb").setup({ transparent = t })
      vim.cmd("colorscheme jb")
    end

    apply(transparent)

    vim.keymap.set("n", "<leader>tt", function()
      transparent = not transparent
      apply(transparent)
    end, { desc = "Toggle transparency" })
  end,
}