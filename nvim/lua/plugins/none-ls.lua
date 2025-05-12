return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- LUA
        null_ls.builtins.formatting.stylua,

        -- JavaScript / TypeScript
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d")

        -- Prisma
        

        -- JAVA
        -- null_ls.builtins.formatting.google_java_format,
        -- null_ls.builtins.diagnostics.checkstyle.with({
        -- extra_args = { "-c", "/google_checks.xml" },
        -- }),
      },
    })

    vim.keymap.set("n", "<A-S-F>", vim.lsp.buf.format, {})
  end,
}
