-- LSP (Language Server Protocol) — gives Neovim IDE features:
-- autocomplete, go-to-definition, hover docs, rename, diagnostics etc.
--
-- mason.nvim              — installs and manages LSP servers (like a package manager)
-- mason-lspconfig.nvim    — bridges mason package names to lsp config names
-- mason-tool-installer    — auto-installs all servers listed in `servers` table
-- fidget.nvim             — shows LSP loading spinner bottom-right
-- cmp-nvim-lsp            — lets the completion plugin (cmp) use LSP as a source
-- nvim-jdtls              — special Java LSP handling (jdtls needs extra setup)
--
-- LspAttach autocmd       — runs when any LSP connects to a buffer, sets keymaps:
--   gd  = go to definition
--   gr  = find references
--   gI  = go to implementation
--   K   = hover docs
--   rn  = rename symbol
--   ca  = code action
--
-- servers table           — list of LSPs to install and enable
-- capabilities            — tells each LSP what Neovim+cmp can handle
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", config = true },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        automatic_enable = {
          exclude = { "jdtls" },
        },
      },
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = {
          window = { winblend = 0 },
        },
      },
    },
    "hrsh7th/cmp-nvim-lsp",
    "mfussenegger/nvim-jdtls",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd",         require("telescope.builtin").lsp_definitions,         "Goto Definition")
        map("gr",         require("telescope.builtin").lsp_references,          "Goto References")
        map("gI",         require("telescope.builtin").lsp_implementations,     "Goto Implementation")
        map("<leader>D",  require("telescope.builtin").lsp_type_definitions,    "Type Definition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols,    "Document Symbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
        map("<leader>cr", vim.lsp.buf.rename,                                   "Rename")
        map("<leader>ca", vim.lsp.buf.code_action,                              "Code Action")
        map("K",          vim.lsp.buf.hover,                                    "Hover Documentation")
        map("gD",         vim.lsp.buf.declaration,                              "Goto Declaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Highlight references of word under cursor on hold
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf, group = augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf, group = augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        -- Toggle inlay hints (<leader>th)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle Inlay Hints")
        end
      end,
    })

    local capabilities = vim.tbl_deep_extend("force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
            format = { enable = false },
          },
        },
      },
      jdtls                          = {},
      ts_ls                          = {},
      jsonls                         = {},
      sqlls                          = {},
      yamlls                         = {},
      bashls                         = {},
      dockerls                       = {},
      docker_compose_language_service = {},
      graphql                        = {},
      prismals                       = {},
      html = { filetypes = { "html", "twig", "hbs" } },
    }

    require("mason-tool-installer").setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    for server, cfg in pairs(servers) do
      cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
      vim.lsp.config(server, cfg)
      vim.lsp.enable(server)
    end
  end,
}
