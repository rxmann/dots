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
				numhl = true,
				linehl = false,
				watch_gitdir = { interval = 1000, follow_files = true },
				current_line_blame = false,

				preview_config = { border = "rounded" },
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local opts = { buffer = bufnr, desc = "Gitsigns" }

					vim.keymap.set("n", "]c", gs.next_hunk, opts)
					vim.keymap.set("n", "[c", gs.prev_hunk, opts)
					vim.keymap.set("n", "<leader>ph", gs.preview_hunk, opts)
					-- vim.keymap.set("n", "<leader>sh", gs.stage_hunk, opts)
					-- vim.keymap.set("n", "<leader>rh", gs.reset_hunk, opts)
				end,
			})
		end,
	},
}
