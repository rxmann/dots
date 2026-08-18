-- ============================================================================
-- Neovim Options (options.lua)
-- ============================================================================

-- Line Numbers
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = false-- Use absolute line numbers
vim.opt.numberwidth = 4       -- Set number column width
vim.opt.signcolumn = "yes"    -- Always show sign column (prevents text shift on LSP/git warnings)

-- Tabs & Indentation
vim.opt.tabstop = 4           -- 4 spaces per tab
vim.opt.softtabstop = 4       -- 4 spaces for tab editing operations
vim.opt.shiftwidth = 4        -- 4 spaces for auto-indentation
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.autoindent = true     -- Copy indent from current line when starting new line
vim.opt.smartindent = true    -- Smart auto-indenting on new lines
vim.opt.breakindent = true   -- Wrapped lines retain indent level

-- Search Settings
vim.opt.ignorecase = true     -- Case-insensitive searching...
vim.opt.smartcase = true      -- ...UNLESS uppercase letters are typed
vim.opt.hlsearch = true       -- Highlight search matches

-- Text Wrapping & Scrolling
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.linebreak = true      -- Don't break words when wrapping
vim.opt.scrolloff = 4         -- Keep 4 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 8     -- Keep 8 columns to the left/right of cursor

-- Splits & Window Behavior
vim.opt.splitbelow = true     -- Force horizontal splits to go below
vim.opt.splitright = true     -- Force vertical splits to go to the right
vim.opt.showtabline = 2       -- Always show tab bar at the top
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bold = true }) -- Solid split borders

-- System & Files
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.mouse = "a"           -- Enable mouse support
vim.opt.swapfile = false      -- Disable swap files
vim.opt.backup = false        -- Disable backup files
vim.opt.writebackup = false   -- Disable writebackup
vim.opt.undofile = true       -- Save undo history to disk
vim.opt.fileencoding = "utf-8" -- Standard file encoding

-- UI & Display
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.showmode = false      -- Hide mode display (e.g. -- INSERT --) since statuslines show it
vim.opt.cursorline = false    -- Disable current line highlighting
vim.opt.cmdheight = 0         -- Keep command line hidden until needed
vim.opt.pumheight = 10        -- Max items in popup completion menu
vim.opt.conceallevel = 0      -- Ensure backticks in Markdown remain visible

-- Timing & Behavior
vim.opt.updatetime = 250      -- Faster completion & diagnostic updates
vim.opt.timeoutlen = 300      -- Time (ms) to wait for mapped key sequence
vim.opt.whichwrap = "bs<>[]hl"-- Allow arrow keys and hjkl to wrap to prev/next line
vim.opt.backspace = "indent,eol,start" -- Allow backspace over everything
vim.opt.completeopt = "menuone,noselect" -- Better auto-completion menu feel

-- Syntax Append/Remove Hooks
vim.opt.shortmess:append("c") -- Suppress completion messages
vim.opt.iskeyword:append("-")  -- Treat hyphenated words (like my-variable) as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Stop auto-commenting new lines


