return {
  "Mofiqul/vscode.nvim",
  config = function()
    local vscode = require("vscode")
    local c = require('vscode.colors').get_colors()
    local is_transparent = false

    local function apply_theme()
      vscode.setup({
        transparent = is_transparent,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,
        color_overrides = {
          vscBack = is_transparent and "NONE" or "#181818",
          vscLineNumber = '#FFFFFF',
        },
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        }
      })
      vim.cmd([[colorscheme vscode]])
    end

    apply_theme()

    -- Toggle command
    vim.keymap.set("n", "<leader>bg", function()
      is_transparent = not is_transparent
      apply_theme()
    end, { desc = "Toggle VSCode theme transparency" })
  end
}

