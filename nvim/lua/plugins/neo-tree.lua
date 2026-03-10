return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					default = "",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added = "",
						modified = "M",
						deleted = "D",
						renamed = "R",
						untracked = "U",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "!",
					},
				},
				symlink_target = {
					enabled = true,
				},
			},

			window = {
				position = "left",
				width = 30,
				mapping_options = { noremap = true, nowait = true },
				mappings = {
					["<space>"] = { "toggle_node", nowait = false },
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel",
					["P"] = { "toggle_preview", config = { use_float = true } },
					["l"] = "open",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					["a"] = { "add", config = { show_path = "none" } },
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["m"] = "move",
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
					["i"] = "show_file_details",
				},
			},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						".DS_Store",
						"thumbs.db",
						"node_modules",
						"__pycache__",
						".git",
						".venv",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						["<bs>"] = "navigate_up",
						["."] = "set_root",
						["H"] = "toggle_hidden",
						["/"] = "fuzzy_finder",
						["D"] = "fuzzy_finder_directory",
						["f"] = "filter_on_submit",
						["<c-x>"] = "clear_filter",
						["[g"] = "prev_git_modified",
						["]g"] = "next_git_modified",
					},
					fuzzy_finder_mappings = {
						["<down>"] = "move_cursor_down",
						["<C-n>"] = "move_cursor_down",
						["<up>"] = "move_cursor_up",
						["<C-p>"] = "move_cursor_up",
					},
				},
			},

			buffers = {
				follow_current_file = { enabled = true, leave_dirs_open = false },
				group_empty_dirs = true,
				show_unloaded = true,
				window = {
					mappings = {
						["bd"] = "buffer_delete",
						["<bs>"] = "navigate_up",
						["."] = "set_root",
					},
				},
			},

			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
					},
				},
			},
		})

		-- keymaps
		vim.keymap.set("n", "<M-n>", ":Neotree toggle position=left<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>e", ":Neotree float git_status<CR>", { noremap = true, silent = true })
	end,
}