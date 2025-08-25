return {
	-- Auto-closing brackets and quotes
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen
			delay = 0,
			icons = {
				mappings = true,
				keys = {},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
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
