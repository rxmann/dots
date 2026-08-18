return {
  "saghen/blink.cmp",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  version = "1.*",

  opts = {
    -- Completion keymaps
    keymap = {
      preset = "none",

      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-Space>"] = {
        "show",
        "fallback",
      },

      ["<C-e>"] = { "cancel", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      -- Automatically show completion
      menu = {
        border = "rounded",
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },

      ghost_text = {
        enabled = false,
      },
    },

    snippets = {
      preset = "default",
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}
