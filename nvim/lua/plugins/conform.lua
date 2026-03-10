return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript      = { "prettier" },
				typescript      = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json            = { "prettier" },
				css             = { "prettier" },
				html            = { "prettier" },
				lua             = { "stylua" },
				java            = { "google-java-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<M-S-f>", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format file" })
	end,
}