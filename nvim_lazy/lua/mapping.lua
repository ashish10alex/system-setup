-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Move through buffers
vim.keymap.set('n', '<leader>[', '<cmd>bp!<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>bn!<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>')


-- Move through buffers
vim.keymap.set('n', '[q', '<cmd>cnext<CR>')
vim.keymap.set('n', ']q', '<cmd>cprev<CR>')


--- Resize split windows
vim.keymap.set('n', '<leader><left>', '<cmd>vertical resize -5<CR>')
vim.keymap.set('n', '<leader><right>', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<leader><up>', '<cmd>resize -5<CR>')
vim.keymap.set('n', '<leader><down>', '<cmd>resize +5<CR>')

-- Quickly switch between vertical and hortizontal splits
vim.keymap.set('n', '<leader>tv', '<C-w>t<C-w>H')
vim.keymap.set('n', '<leader>th', '<C-w>t<C-w>K')

