return {
	{
		"MagicDuck/grug-far.nvim",
		keys = {
			-- Search & Replace in CURRENT FILE only
			{
				"<leader>sf",
				function()
					local grug = require("grug-far")
					local prefills = { flags = vim.fn.expand("%") }

					-- If in visual mode, also pre-fill the search text with selection
					if vim.fn.mode():sub(1, 1) == "v" or vim.fn.mode():sub(1, 1) == "V" then
						grug.with_visual_selection({ prefills = prefills })
					else
						grug.open({ prefills = prefills })
					end
				end,
				mode = { "n", "v" },
				desc = "Search & Replace in Current File",
			},

			-- Search & Replace in WHOLE PROJECT
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					if vim.fn.mode():sub(1, 1) == "v" or vim.fn.mode():sub(1, 1) == "V" then
						grug.with_visual_selection()
					else
						grug.open()
					end
				end,
				mode = { "n", "v" },
				desc = "Search & Replace in Project",
			},
		},
		opts = {},
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			-- optional picker via telescope
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		opts = {},
	},
}
