-- ============================================================================
-- Options & Utility Functions
-- ============================================================================
local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, desc, extra_opts)
	local options = vim.tbl_extend("force", opts, extra_opts or {})
	if desc then
		options.desc = desc
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Disable spacebar's default behavior (useful if Space is your leader key)
map({ "n", "v" }, "<Space>", "<Nop>", "Disable Space")

-- ============================================================================
-- 1. File & Buffer Management
-- ============================================================================
-- Save & Quit
map("n", "<C-s>", "<cmd>w<CR>", "Save file")
map("n", "<leader>sn", "<cmd>noautocmd w<CR>", "Save file without auto-format")
map("n", "<C-M-q>", "<cmd>q<CR>", "Quit file")
map("n", "<C-q>", "<cmd>qa<CR>", "Quit all")
map("n", "<leader>qq", "<cmd>qa<CR>", "Quit all")

-- Buffer operations
map("n", "<leader>fn", "<cmd>enew<CR>", "New empty buffer")
map("n", "<C-w>", "<cmd>bdelete!<CR>", "Close current buffer")

-- BufferLine navigation (if using BufferLine plugin)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", "Previous buffer")
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", "Next buffer")

-- ============================================================================
-- 2. Window & Split Management
-- ============================================================================
-- Split creation & closing
map("n", "<leader>v", "<C-w>v", "Split window vertically")
map("n", "<leader>h", "<C-w>s", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Make split windows equal size")
map("n", "<leader>xs", "<cmd>close<CR>", "Close current split")
map("n", "<leader>sc", "<cmd>close<CR>", "Close current split")

-- Split navigation (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", "Go to left window")
map("n", "<C-j>", "<C-w>j", "Go to lower window")
map("n", "<C-k>", "<C-w>k", "Go to upper window")
map("n", "<C-l>", "<C-w>l", "Go to right window")

-- Split navigation backup (Ctrl + Alt + hjkl)
map("n", "<C-A-h>", "<C-w>h", "Go to left window (Alt)")
map("n", "<C-A-j>", "<C-w>j", "Go to lower window (Alt)")
map("n", "<C-A-k>", "<C-w>k", "Go to upper window (Alt)")
map("n", "<C-A-l>", "<C-w>l", "Go to right window (Alt)")

-- Resize splits with arrow keys
map("n", "<Up>", "<cmd>resize -2<CR>", "Decrease window height")
map("n", "<Down>", "<cmd>resize +2<CR>", "Increase window height")
map("n", "<Left>", "<cmd>vertical resize +2<CR>", "Increase window width")
map("n", "<Right>", "<cmd>vertical resize -2<CR>", "Decrease window width")

-- ============================================================================
-- 3. Tab Management
-- ============================================================================
map("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
map("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
map("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")

-- ============================================================================
-- 4. Editing, Movement & Centering
-- ============================================================================
-- Delete single character without copying into default register
map("n", "x", '"_x', "Delete character without yank")

-- Keep last yanked text when pasting over selection in visual mode
map("v", "p", '"_dP', "Paste over selection without losing register")

-- Vertical scrolling & center cursor
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")


-- Search navigation & center cursor
map("n", "n", "nzzzv", "Next search match (centered)")
map("n", "N", "Nzzzv", "Previous search match (centered)")

-- Join lines while keeping cursor position intact
map("n", "J", "mzJ`z", "Join line below with cursor intact")

-- Clear search highlights on Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")

-- Toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle line wrapping")

-- Move lines up/down in Normal mode
map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move line up")

-- Move selection up/down in Visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Stay in visual mode after indenting
map("v", "<", "<gv", "Indent left and keep selection")
map("v", ">", ">gv", "Indent right and keep selection")

-- ============================================================================
-- 5. Native Diagnostics (Neovim 0.10+ compatible)
-- ============================================================================
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, "Go to previous diagnostic")

map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, "Go to next diagnostic")

map("n", "<leader>d", vim.diagnostic.open_float, "Open floating diagnostic")
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostics location list")
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { noremap = true, silent = true, desc = "Quit Neovim" })
vim.keymap.set("n", "<leader>cs", "<cmd>source $MYVIMRC<CR>", { desc = "Source $MYVIMRC" })

-- Using <leader>th for Theme
vim.keymap.set("n", "<leader>th", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Select colorscheme" })
