return {
	-- Auto-closing brackets and quotes
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Commenting utility
	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gb" }, -- lazy-load on comment keymaps
		config = function()
			require("Comment").setup({
				-- optionally, you can configure toggler mappings
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				-- extra mappings
				opleader = {
					line = "gc",
					block = "gb",
				},
				-- ignore empty lines
				ignore = "^$",
			})
		end,
	},
}
