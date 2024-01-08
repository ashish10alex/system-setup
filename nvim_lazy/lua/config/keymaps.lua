

vim.api.nvim_set_keymap("n", "<leader>[", ":bp!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>]", ":bn!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":bd<CR>", { noremap = true })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copies to system clipboard in normal, visual modes
vim.keymap.set({"n", "v"}, "Y", [["+y]])
-- copies current line to system clipboard in normal & visual modes 
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- removes highlighting when pressing escape
vim.api.nvim_set_keymap("n", "<Esc>", ":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<leader><Left>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader><Right>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<leader><Down>", ":resize +5<CR>")
vim.keymap.set("n", "<leader><Up>", ":resize -5<CR>")


vim.keymap.set('n', '<leader>P', ':let @+ = expand("%:p") <CR>')
vim.keymap.set('n', '<leader>p', ':let @+ = expand("%:t") <CR>')


