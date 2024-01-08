return {
    'akinsho/git-conflict.nvim', 
    version = "*",
    config = function()

        require("git-conflict").setup({
          default_mappings = true, -- disable buffer local mapping created by this plugin
          default_commands = true, -- disable commands created by this plugin
          disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
          list_opener = 'copen', -- command or function to open the conflicts list
          highlights = { -- They must have background color, otherwise the default color will be used
            incoming = 'DiffAdd',
            current  = 'DiffText',
          },
        })

        vim.keymap.set('n', '<leader>gr', ':GitConflictRefresh<CR>', {noremap = true, silent = true})
        vim.keymap.set('n', '<leader>gq', ':GitConflictQf<CR>', {noremap = true, silent = true})

        vim.api.nvim_create_autocmd('User', {
          pattern = 'GitConflictDetected',
          callback = function()
            vim.notify('Conflict detected in file '..vim.api.nvim_buf_get_name(0))
            vim.cmd('LspStop')
          end
        })

        vim.api.nvim_create_autocmd('User', {
          pattern = 'GitConflictResolved',
          callback = function()
            vim.cmd('LspRestart')
          end
        })
    end
}
