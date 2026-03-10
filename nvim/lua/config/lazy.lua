-- Bootstrap lazy.nvim (auto-install if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Leaders must be set before lazy loads plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{ import = "plugins" }, -- auto-imports all files in lua/plugins/
	},

	-- UI
	ui = {
		border = "rounded", -- nicer popup border
	},

	-- Automatically check for plugin updates
	checker = {
		enabled = true,
		notify = false, -- suppress the update notification badge
	},

	-- Don't spam change notifications on every startup
	change_detection = {
		notify = false,
	},

	-- Performance: cache and lazy-load luarocks if unused
	performance = {
		rtp = {
			-- Disable unused default plugins to speed up startup
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				-- "tutor",
				"zipPlugin",
			},
		},
	},
})
