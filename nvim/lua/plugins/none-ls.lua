return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		require("mason-null-ls").setup({
			ensure_installed = { "eslint_d", "prettier", "stylua", "google-java-format" },
			automatic_installation = true,
		})

		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}