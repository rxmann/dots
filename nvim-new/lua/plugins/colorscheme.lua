return {
  {
    "nickkadutskyi/jb.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      local transparent = false

      local function apply()
        require("jb").setup({ transparent = transparent })
        vim.cmd("colorscheme jb")
      end

      apply()

      vim.keymap.set("n", "<leader>tt", function()
        transparent = not transparent
        apply()
      end, { desc = "Toggle transparency" })
    end,
  },

  {
    "mellow-theme/mellow.nvim",
    lazy = false,
    config = function()
      vim.g.mellow_bold_functions = false
      vim.g.mellow_italic_functions = false
      vim.cmd("colorscheme mellow")
    end
   },

  {
    "CosecSecCot/cosec-twilight.nvim",
    lazy = true,
    priority = 1000,
    dependencies = "rktjmp/lush.nvim",
    -- no setup function required (didn't make one :P)
    -- (you can change and customize it using lush according to your preference)
    }
}
