return {
-- 	"olivercederborg/poimandres.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Local state
-- 		local bg_transparent = false

-- 		-- Setup function to apply the theme with current transparency setting
-- 		local function apply_poimandres()
-- 			require("poimandres").setup({
-- 				bold_vert_split = true,
-- 				dim_nc_background = false,
-- 				disable_background = bg_transparent,
-- 				disable_float_background = false,
-- 				disable_italics = false,
-- 			})
-- 			vim.cmd("colorscheme poimandres")
-- 		end

-- 		-- Initial apply
-- 		apply_poimandres()

-- 		-- Toggle function for background transparency
-- 		local function toggle_transparency()
-- 			bg_transparent = not bg_transparent
-- 			apply_poimandres()
-- 		end

-- 		-- Keybinding to toggle background
-- 		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
-- 	end,

-- 	-- Optional init function (can be removed since it's handled in config now)
-- 	init = function()
-- 		-- Do nothing here; moved to config
-- 	end,
}
