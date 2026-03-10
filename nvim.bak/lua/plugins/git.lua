return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost", -- load when a buffer is opened
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitGutterAdd", text = "│" },
					change = { hl = "GitGutterChange", text = "│" },
					delete = { hl = "GitGutterDelete", text = "_" },
					topdelete = { hl = "GitGutterDelete", text = "‾" },
					changedelete = { hl = "GitGutterChangeDelete", text = "~" },
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				watch_gitdir = { interval = 1000, follow_files = true },
				current_line_blame = false,

				preview_config = { border = "rounded" },
				on_attach = function(bufnr)
					local gs = require("gitsigns")
					local opts = { buffer = bufnr, desc = "Gitsigns" }

					vim.keymap.set("n", "]c", gs.next_hunk, opts)
					vim.keymap.set("n", "[c", gs.prev_hunk, opts)
					vim.keymap.set("n", "<leader>ph", gs.preview_hunk, opts)
					vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "git [d]iff against index" })
					vim.keymap.set(
						"n",
						"<leader>gb",
						gs.toggle_current_line_blame,
						{ buffer = bufnr, desc = "Toggle blame line" }
					)
					vim.keymap.set(
						"n",
						"<leader>gD",
						gs.preview_hunk_inline,
						{ buffer = bufnr, desc = "Preview deleted inline" }
					)
				end,
			})
		end,
	},
}
