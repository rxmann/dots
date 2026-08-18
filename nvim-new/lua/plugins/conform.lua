return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },

				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },

				lua = { "stylua" },
				bash = { "shfmt" },

				sql = { "sql_formatter" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		vim.keymap.set({ "n", "v" }, "<M-S-f>", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format file" })
	end,
}
