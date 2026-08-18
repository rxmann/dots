return {
	"nvim-lualine/lualine.nvim",

	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			globalstatus = true,
			disabled_filetypes = { "neo-tree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "filename" },
			lualine_x = { "diagnostics", "diff", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
