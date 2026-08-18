return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = { winblend = 0 },
				},
			},
		},
	},

	config = function()
		-- 1. Initialize Mason
		require("mason").setup()

		-- 2. Define LSP Server Configurations
		local servers = {
			lua_ls = {},
			ts_ls = {
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
				},
			},
			jsonls = {},
			yamlls = {},
			html = { filetypes = { "html", "twig", "hbs" } },
			cssls = {},
			bashls = {},
			dockerls = {},
			docker_compose_language_service = {},
			graphql = {},
			prismals = {},
			sqlls = {},
		}

		-- 3. Define Non-LSP Tools (Formatters)
		local formatters = {
			"prettier",
			"stylua",
			"shfmt",
			"sql-formatter",
		}

		local linters = {
			"eslint_d",
		}

		-- 4. Setup mason-lspconfig (LSPs ONLY)
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		-- 5. Setup mason-tool-installer (LSPs + Formatters)
		require("mason-tool-installer").setup({
			ensure_installed = vim.list_extend(vim.tbl_keys(servers), vim.list_extend(formatters, linters)),
		})

		-- 6. Diagnostics UI Setup
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				spacing = 4,
			},
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "ℹ",
				},
			},
			severity_sort = true,
			update_in_insert = false,
		})

		-- 7. LspAttach Keymaps and Autocmds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, {
						buffer = event.buf,
						desc = "LSP: " .. desc,
					})
				end

				-- Navigation
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gy", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")

				-- Documentation
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- Symbols / usages
				map("td", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				-- map("uu", require("telescope.builtin").lsp_references, "Show Usages")
				-- map("ug", require("telescope.builtin").lsp_references, "Find Usages")
				-- map("ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				-- map("ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				-- map("oo", require("telescope.builtin").lsp_document_symbols, "Document Symbols")

				-- Diagnostics
				map("]e", function()
					vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
				end, "Next Error")
				map("[e", function()
					vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
				end, "Previous Error")

				-- Method navigation
				map("<A-[>", "[m", "Previous Method")
				map("<A-]>", "]m", "Next Method")

				-- Code actions
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>cr", vim.lsp.buf.rename, "Rename")

				map("<leader>co", function()
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.organizeImports" },
							diagnostics = {},
						},
					})
				end, "Organize Imports")

				-- Toggle Inlay Hints
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })

					map("<leader>uh", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }),
							{ bufnr = event.buf }
						)
					end, "Toggle Inlay Hints")
				end
			end,
		})

		-- 8. Capabilities & Server Loop
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		for server, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
