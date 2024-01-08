return {
    'tpope/vim-fugitive',
    dependencies = {
        'vim-airline/vim-airline',
        'tpope/vim-rhubarb',
        'shumphrey/fugitive-gitlab.vim',
        'airblade/vim-gitgutter',
    },
    config = function()
        vim.keymap.set('n', '<leader>gs', ':Git<CR>', {silent = true})
        vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', {silent = true})
        vim.keymap.set('n', '<leader>gp', ':Git push<CR>', {silent = true})
        vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', {silent = true})
        vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {silent = true})
        vim.keymap.set('n', '<leader>gl', ':Git log<CR>', {silent = true})

        vim.keymap.set('n', ']g', ':GitGutterNextHunk<CR>', {noremap = true, silent = true})
        vim.keymap.set('n', '[g', ':GitGutterPrevHunk<CR>', {noremap = true, silent = true})
        vim.keymap.set('n', 'guh', ':GitGutterUndoHunk<CR>', {noremap = true, silent = true})
        vim.keymap.set('n', 'gp', ':GitGutterPreviewHunk<CR>', {noremap = true, silent = true})


        vim.g.netrw_banner = 0 -- disable netrw banner for GitBrowse to work
        vim.g.fugitive_gitlab_domains = { os.getenv("JLR_GITLAB_ADDRESS") }
        vim.keymap.set('n', '<leader>gb', ':GBrowse<CR>', {silent = true})

    end
}

