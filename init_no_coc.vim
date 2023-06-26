"Shows an exhaustive list during tab completion
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" removes annoying error sound
set noerrorbells

set scrolloff=10 "Smooth scrolling at the bottom

" While over the incorrect work in normal mode :z=1 to see suggestions
"[s and ]s to go navigate through misspelled word
set spell spelllang=en_us

" Set internal encoding of vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
" Remove the messages that pop up at the bottom
" set shortmess=a
" set cmdheight=2

set mouse=

" vnoremap <C-c><C-c> :<c-u>silent '<,'>write !xsel -b<cr>


set relativenumber
set textwidth=120

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set lazyredraw
set updatetime=50
set termguicolors

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

set formatoptions-=c formatoptions-=r formatoptions-=o " To stop comments from continuing 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set incsearch
set hlsearch
set ic " case insensitive search
set foldmethod=indent
set foldlevel=99

" Install VimPlug from - https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'folke/zen-mode.nvim'

Plug 'andres-lowrie/vim-sqlx'


Plug 'dstein64/vim-startuptime'


Plug 'tpope/vim-surround'

Plug 'ThePrimeagen/git-worktree.nvim'

"Treesitter plugins
Plug 'nvim-treesitter/nvim-treesitter'
" Enables sticky scroll, i.e shows function name at the top
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP 
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" AI Autocomplete plugins
Plug 'github/copilot.vim'
" Plug 'jackMort/ChatGPT.nvim'

" Auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" sql
Plug 'nanotee/sqls.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  "shows files, git-file in the current directory, Install bat for syntax highlighting 
Plug 'junegunn/fzf.vim' 

Plug 'folke/noice.nvim'
" Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'

Plug 'yuttie/comfortable-motion.vim' " smooth scrolling 'C-d' or 'C-u'
"Themes for vim editor
Plug 'sonph/onehalf', { 'rtp': 'vim' } "preferred on linux server
" Plug 'rakr/vim-one' " For mac
Plug 'tpope/vim-commentary' "commenting - `gcc` for commenting and un-commenting 


Plug 'tpope/vim-fugitive' "Git workflows
Plug 'tpope/vim-rhubarb' "Git - to go to github link in the browser


Plug 'vim-airline/vim-airline' "Shows status line - Fugitive status line depends on airline
" Plug 'sheerun/vim-polyglot' " Syntax highlighting

Plug 'preservim/nerdtree' "nerd tree - shows files in folder in a vertical split

Plug 'Xuyuanp/nerdtree-git-plugin' " New nerd tree ?


Plug 'airblade/vim-gitgutter' "Git gutter
" Replace words with copied word
" Copy the words using - "yiw" (yank inner word)
" Go to the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'


Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'folke/neodev.nvim'

call plug#end()

" lua requires should be after plug#end to avoid errors
lua require('basic')

lua << EOF
require("catppuccin").setup {
    flavour = "macchiato" -- mocha, macchiato, frappe, latte
}
EOF

" Change git worktrees using Telescope
"
lua require("telescope").load_extension("git_worktree")
nnoremap <leader>wt :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>cwt :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }


"Comfortable motion scrolling params
"
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 12.0

" MarkdownPreview settings
"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
let g:gitgutter_async=0

let ostype = substitute(system('uname'), "\n", "", "")

set cursorline
set t_Co=256

" Colorscheme settings
"
 if ostype == "Darwin"
     colorscheme catppuccin
 else
   set t_ut=
   colorscheme onehalfdark
   highlight Comment gui=none cterm=none
   let g:airline_theme='onehalfdark'
 endif


" Github copilot auto completion keymap
"
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" Press Space to turn off highlighting and clear any message already displayed.
"
noremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" https://stackoverflow.com/questions/6488683/how-do-i-change-the-cursor-between-normal-and-insert-modes-in-vim
" Regular mode - block,  Insert mode - vertical line, Replace mode - _
"
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
    "this works for Centos
    if $TERM == 'xterm-256color'
        "echo "For Centos"
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[2 q"
    else
        "echo "For other Linux distros"
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        let &t_SR =  "\<Esc>]50;CursorShape=2\x7"
    endif
endif

" make the switch between insert and normal mode faster 
"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" map the leader key to space bar
let mapleader = " "

" move through buffers - Leader key is currently mapped to space bar
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" Move through quickfix list
"
nmap ]q <cmd>cnext<CR>
nmap [q <cmd>cprev<CR>


nmap n nzzzv
nmap N Nzzzv


let g:netrw_banner = 0
noremap <leader>nt :NERDTree<CR>

"reduce and increase the side of vertical split
"
noremap <leader><Left> :vertical resize +5<CR>
noremap <leader><Right> :vertical resize -5<CR>
noremap <leader><Down>  : resize +5<CR>
noremap <leader><Up> : resize -5<CR>

"Change split windows from vertical to horizontally
"
map <leader>tv <C-w>t<C-w>H
map <leader>th <C-w>t<C-w>K


" Disable arrow keys - hard mode
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"Telescope stuff shows all files in the current directory 
"
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>


"shows all files store in buffer 
"
nnoremap <leader>b <cmd>Telescope buffers<cr>
"
" Recurrsive grep, must need to install ripgrep
nnoremap <leader>greb :lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>
"greps the whole directory
"
nnoremap <leader>grep :lua require('telescope.builtin').live_grep()<CR>

" Git  mappings (fugitive and Telescope)
"
noremap <leader>gl <cmd>Telescope git_commits<CR>
noremap <leader>gd <cmd>Telescope git_status<CR>
noremap <leader>gc :G commit<CR>
noremap <leader>gp :G push<CR>

" Navigate through git hunks and preview them
"
nmap ]g <cmd>GitGutterNextHunk<CR>
nmap [g <cmd>GitGutterPrevHunk<CR>
nmap gp <cmd>GitGutterPreviewHunk<CR>


" Equivalent to git status
"
noremap <leader>gs :G <CR>
"open github url on web browser
"
noremap <leader>gb :GBrowse <CR> 

" Code navigation 
"
nmap <silent> gd <cmd>Telescope lsp_definitions <CR>
nmap <silent> gl <cmd>Telescope lsp_references <CR>
nmap <silent> gt <cmd>Telescope lsp_type_definitions <CR>
nmap <silent> sd <cmd>Telescope diagnostics <CR>

if ostype == "Linux"
   let python_highlight_all = 1
   let python_highlight_space_errors = 0
endif

" For easy vertical navigation in markdown files
"
autocmd FileType markdown map j gj
autocmd FileType markdown map k gk


" Copy vim clipboard to system clipboard - https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
"
if ostype== "Darwin"
    noremap <silent>Y "*y
else
    noremap <silent>Y "+y
endif
set clipboard=unnamed " Does the something, might remove the one above


" Move 1 more lines up or down in normal and visual selection modes.
"
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j>  :m '>+1<CR>gv=gv

"Tab to navigate completion list
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"Correct colors for Pmenus
hi Pmenu ctermbg=234 ctermfg=145
hi PmenuSel ctermbg=237  ctermfg=145

" execute sql query under cursor 
"
nnoremap <silent> <Leader>qe :<C-U>silent! '{,'}SqlsExecuteQuery<CR>

"
"
let g:noice_diagnostic_disable = 1

" Disable Copilot by default
"
let g:copilot_enabled = v:false

