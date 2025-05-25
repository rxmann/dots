-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

