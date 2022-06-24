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


" vnoremap <C-c><C-c> :<c-u>silent '<,'>write !xsel -b<cr>


set relativenumber
set textwidth=120

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

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

Plug 'tpope/vim-surround'

" Plug 'honza/vim-snippets'

Plug 'junegunn/vim-easy-align'

" Plug 'lervag/vimtex' " Latex plugins

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP 
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  "shows files, git-file in the current directory, Install bat for syntax highlighting 
Plug 'junegunn/fzf.vim' 


Plug 'yuttie/comfortable-motion.vim' " smooth scrolling 'C-d' or 'C-u'

"Themes for vim editor
Plug 'sonph/onehalf', { 'rtp': 'vim' } "preferred on linux server
Plug 'rakr/vim-one' " For mac

Plug 'tpope/vim-commentary' "commenting - `gcc` for commenting and un-commenting 

Plug 'tpope/vim-fugitive' "Git workflows

Plug 'tpope/vim-rhubarb' "Git - to go to github link in the browser

Plug 'vim-airline/vim-airline' "Shows status line - Fugitive status line depends on airline

Plug 'sheerun/vim-polyglot' " Syntax highlighting

Plug 'preservim/nerdtree' "nerd tree - shows files in folder in a vertical split

Plug 'Xuyuanp/nerdtree-git-plugin' " New nerd tree ?

Plug 'airblade/vim-gitgutter' "Git gutter

" Replace words with copied word
" Copy the words using - "yiw" (yank inner word)
" Go to the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto complete and very quick navigation between functions

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Markdown preview

Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
call plug#end()

" lua requires should be after plug#end to avoid errors
lua require('basic')

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Comfortable motion scrolling params
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 12.0

" MarkdownPreview settings
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
if ostype == "Darwin"
  colorscheme one
  set termguicolors
else
  set t_ut=
  colorscheme onehalfdark
  highlight Comment gui=none cterm=none
  let g:airline_theme='onehalfdark'
endif

" Press Space to turn off highlighting and clear any message already displayed.
noremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" https://stackoverflow.com/questions/6488683/how-do-i-change-the-cursor-between-normal-and-insert-modes-in-vim
" Regular mode - block,  Insert mode - vertical line, Replace mode - _
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR =  "\<Esc>]50;CursorShape=2\x7"
endif

" make the switch between insert and normal mode faster 
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
nmap ]q <cmd>cnext<CR>
nmap [q <cmd>cprev<CR>

"shows all files in the current directory 
nnoremap <leader>f <cmd>Telescope find_files<cr>

"shows all files store in buffer 
nnoremap <leader>b <cmd>Telescope buffers<cr>
"
" Recurrsive grep, must need to install ripgrep
" Mac - brew install ripgrep 
" Linux - sudo apt-get install ripgrep
nnoremap <leader>gb :lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>
nnoremap <leader>gr :lua require('telescope.builtin').live_grep()<CR>

let g:netrw_banner = 0
noremap <leader>nt :NERDTree<CR>

"reduce and increase the side of vertical split
noremap <leader><Left> :vertical resize +5<CR>
noremap <leader><Right> :vertical resize -5<CR>
noremap <leader><Down>  : resize +5<CR>
noremap <leader><Up> : resize -5<CR>

"Change split windows from vertical to horizontally
map <leader>tv <C-w>t<C-w>H
map <leader>th <C-w>t<C-w>K

 "Search and replace -> %s/<targetWord><replaceWith>/gI
 "To replace visual block do [Shift][:]s/<targetWord>/<replaceWith><CR>
noremap <leader>sr :%s//gI<Left><Left><Left>

" Disable arrow keys - hard mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Scrolling with keyboard
" Move up/down lines with [CTRL + u][CTRL + d]
" map <C-d> 5j
" map <C-u> 5k

" Git  mappings (fugitive and Telescope)
noremap <leader>gl <cmd>Telescope git_commits<CR>
noremap <leader>gd <cmd>Telescope git_status<CR>
noremap <leader>gc :G commit<CR>
noremap <leader>gp :G push<CR>
" Equivalent to git status
noremap <leader>gs :G <CR>
"open github url on web browser
noremap <leader>gb :GBrowse <CR> 

if ostype == "Linux"
   let python_highlight_all = 1
   let python_highlight_space_errors = 0
endif

" Show documentation when you press K
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Use K to show documentation in preview window.
" noremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
" xmap <leader>F  <Plug>(coc-format-selected)
" nmap <leader>F  <Plug>(coc-format-selected)
" format sql code
" noremap <leader>sql :CocCommand sql.Format <CR>

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation using coc
nmap <silent> gd <cmd>Telescope lsp_definitions <CR>
nmap <silent> gl <cmd>Telescope lsp_references <CR>
nmap <silent> td <cmd>Telescope lsp_type_definitions <CR>
" nmap <silent> sgd <cmd>call CocAction('jumpDefinition', 'split')<CR>

" Disable autocomplete for specific file types
" autocmd FileType python let b:coc_suggest_disable = 1
" autocmd FileType Markdown let b:coc_suggest_disable = 1
" autocmd FileType vim let b:coc_suggest_disable = 1

" For easy vertical navigation in markdown files
autocmd FileType markdown map j gj
autocmd FileType markdown map k gk

" Add  path to your node binary here - requirement for coc plugin
" Coc plugin also requires nmp for installing extension please refere to README on how to configure that 
" let g:coc_node_path = '$HOME/node-from-source/bin/node'

" Copy vim clipboard to system clipboard - https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
if ostype== "Darwin"
    noremap <silent>Y "*y
else
    noremap <silent>Y "+y
endif
set clipboard=unnamed " Does the something, might remove the one above


" Show hidden files in fzf
if ostype == "Darwin"
    " Different options for searching folder 
    " You can optionally exclude folders from being searched in case they contain way too many files 
    "
    " let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git --exclude exclude_me '
    " let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore-dir={exclude_me,} -l -g ""'
    let $FZF_DEFAULT_COMMAND = 'rg --files --follow --hidden -g "!.git" -g "!exclude_me"'
endif

" Grep the current file with fzf with preview
" To get preview with BLines - https://github.com/junegunn/fzf.vim/issues/374
command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
nnoremap <silent> <Leader>/ :BLines<CR>


" Move 1 more lines up or down in normal and visual selection modes.
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j>  :m '>+1<CR>gv=gv

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"       let col = col('.') - 1
"         return !col || getline('.')[col - 1]  =~ '\s'
"     endfunction

"     inoremap <silent><expr> <Tab>
"           \ pumvisible() ? "\<C-n>" :
"           \ <SID>check_back_space() ? "\<Tab>" :
"           \ coc#refresh()

"Tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger coc-autocomplete on pressing Enter
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Correct colors for Coc Pmenus
hi Pmenu ctermbg=234 ctermfg=145
hi PmenuSel ctermbg=237  ctermfg=145

