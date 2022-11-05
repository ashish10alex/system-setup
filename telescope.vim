" Possible congif for telescope in the future
" relevant plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'

" telescope config
nnoremap <leader>t :lua require('telescope').extensions.fzf_writer.files()<CR>
nnoremap <leader>/ :lua require('telescope').extensions.fzf_writer.staged_grep()<CR>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>c :lua require('telescope.builtin').git_bcommits()<cr>

lua <<EOF
require('telescope').setup {
    extensions = {
        fzf_writer = {
            use_highlighter = true
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

