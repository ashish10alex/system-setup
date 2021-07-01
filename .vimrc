" removes annoying error sound
set noerrorbells
set belloff=all

" While over the incorrect work in normal mode :z=1 to see suggestions
"[s and ]s to go navigate through misspelled word
set spell spelllang=en_us

" Set internal encoding of vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" To stop comments from continuing 
set formatoptions-=c formatoptions-=r formatoptions-=o

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Install VimPlug from - https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'


Plug 'junegunn/vim-easy-align'

" Latex plugins
Plug 'lervag/vimtex'

"shows files, git-file in the current directory 
"Also support recurssive grep (Note install rg first -> https://github.com/BurntSushi/ripgrep#installation)
"Install bat for syntax highlighting 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'

"Themes for vim editor
"preferred on the server
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" For mac
" Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

"commenting 
Plug 'tpope/vim-commentary'


"Git "
Plug 'tpope/vim-fugitive'

"Git - to go to github link in the browser"
Plug 'tpope/vim-rhubarb'

"Shows status line - Fugitive status line depends on airline"
Plug 'vim-airline/vim-airline'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

"nerd tree - shows files in folder in a vertical split
Plug 'preservim/nerdtree'

" New nerd tree ?
Plug 'Xuyuanp/nerdtree-git-plugin'

"Git gutter
Plug 'airblade/vim-gitgutter'

" Replace words with copied word
" Copy the words using - "yiw" (yank inner word)
" Go to the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'

" Autocomplete and very quick navigation between functions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Comfortable motion scrolling params
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 12.0

" markdown-preview.nvim
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
set relativenumber
set textwidth=120

let g:gitgutter_async=0
  " set termguicolors

set cursorline
set t_Co=256
if system('uname -s') == "Darwin\n"
  colorscheme one
else
  set t_ut=
  colorscheme onehalfdark
  highlight Comment gui=none cterm=none
  let g:airline_theme='onehalfdark'
endif


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set incsearch
set hlsearch
" case insensitive search
set ic
" change to below to not ignore case 
" :set noic
" Press Space to turn off highlighting and clear any message already displayed.
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" code folding
set foldmethod=indent
set foldlevel=99


" https://stackoverflow.com/questions/6488683/how-do-i-change-the-cursor-between-normal-and-insert-modes-in-vim
" change cursor in insert mode 
" Regular mode - block
" Insert mode - line
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


"Shows an exhaustive list during tab completion
set wildmode=longest,list,full

" map the leader key to space bar
let mapleader = " "

" move through buffers - Leader key is currently mapped to space bar
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>


"shows all files in the current directory 
noremap <leader>f :Files<CR> 
"shows all git files in the current directory 
noremap <leader>gf :GFiles<CR> 
"shows all files store in buffer 
noremap <leader>b :Buffers<CR> 
" Recurrsive grep
" Must need to install rg 
" Mac - brew install ripgrep 
" Linux - sudo apt-get install ripgrep
noremap <leader>grep :Rg! 


" tv will bring a pane that shows the current directory tree - which is
" vertically resized to to 30 units 
let g:netrw_banner = 0
noremap <leader>nt :NERDTree<CR>
"

"reduce and increase the side of vertical split
noremap <leader><Left> :vertical resize +5<CR>
noremap <leader><Right> :vertical resize -5<CR>
noremap <leader><Down>  : resize +5<CR>
noremap <leader><Up> : resize -5<CR>
"Change split windows from vertical to horizonal
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

" Show git logs using git fugitive plugin 
" You can go see the diff in the commit by pressing enter on the git commit id 
" Shown in the log
noremap <leader>gl :G log<CR>
noremap <leader>gc :G commit<CR>
noremap <leader>gp :G push<CR>
" Equivalent to git status
noremap <leader>gs :G <CR>
"open github url on web browser
noremap <leader>gb :GBrowse <CR> 

" Tab completion of paths in vim
" imap <Tab> <C-X><C-F>


if system('uname -s') == "Darwin\n"
else
    "Linux
    let python_highlight_all = 1
    let python_highlight_space_errors = 0
endif


" Show documentation when you press K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Use K to show documentation in preview window.
noremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" GoTo code navigation using coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent> sgd :call CocAction('jumpDefinition', 'split')<CR>

" Disable autocomplete for specific file types
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType Markdown let b:coc_suggest_disable = 1
autocmd FileType vim let b:coc_suggest_disable = 1

" For easy vertical navigation in markdown files
autocmd FileType markdown map j gj
autocmd FileType markdown map k gk

" Add  path to your node binary here - requirement for coc plugin
" Coc plugin also requires nmp for installing extension please refere to README
" on how to configure that 
" let g:coc_node_path = '$HOME/node-from-source/bin/node'

" Copy vim clipboard to system clipboard 
"https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
if system('uname -s') == "Darwin\n"
    "OSX
    noremap <silent>Y "*y
else
    "Linux
    noremap <silent>Y "+y
endif
set clipboard=unnamed " Does the something, might remove the one above


"CTRL-A CTRL-Q to select all and build quickfix list
":cexpr [] to delete all items from the quick fix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Show hidden files in fzf
if system('uname -s') == "Darwin\n"
    "OSX
    " Show hidden files in fzf
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
else
endif
"
" Move 1 more lines up or down in normal and visual selection modes.
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j>  :m '>+1<CR>gv=gv


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()

"Tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Correct colors for Coc Pmenus
hi Pmenu ctermbg=234 ctermfg=145

