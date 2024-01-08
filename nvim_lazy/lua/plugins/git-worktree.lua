return {
     'ThePrimeagen/git-worktree.nvim',
     dependencies = {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
    },
    config = function()
        pcall(require("telescope").load_extension("git_worktree"))
        vim.api.nvim_set_keymap('n', '<leader>gw', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>gcw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', { noremap = true, silent = true })
    end,
}
