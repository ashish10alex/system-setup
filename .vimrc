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
"Smme  
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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Install VimPlug from - https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'

"shows files, git-file in the current directory 
"Also support recurssive grep (Note install rg first -> https://github.com/BurntSushi/ripgrep#installation)
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

" Manage git branches with fzf
" Plug 'stsewd/fzf-checkout.vim'


" Replace words with copied word
" Copy the words using - "yiw" (yank inner word)
" Go to the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'

" Autocomplete and very quick navigation between functions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

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


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:gitgutter_async=0

set cursorline
if system('uname -s') == "Darwin\n"
  "OSX
  colorscheme one
  set termguicolors
else
  "Linux
  " For One half theme
 " Change the value of cterm in `~/.vim/plugged/onehalf/vim/colors/onehalfdark.vim` if your background in mac iterm is brownish let s:black       = { "gui": "#282c34", "cterm": "236" }
  " Find the appropriate value for cterm from - https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg


  " enable 256 colors
  set t_Co=256
  set t_ut=
  colorscheme onehalfdark
  let g:airline_theme='onehalfdark'
  " lightline
  " let g:lightline = { 'colorscheme': 'onehalfdark' }
endif

" colorscheme gruvbox

" For one dark theme
" syntax on
" colorscheme onedark
" set cursorline


" to get fzf preview syntax highlighting with bat
" First install bat - (https://github.com/sharkdp/bat#installation) - Mac OS  brew install bat
"add this to your ~/.zhrc or ~/.bashrc
" export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Syntax highlighted grep
" brew install eth-p/software/bat-extras-batgrep

" Makes tags recurssively in the directory and can navigate between functions using CTRL + ]
" Go back to the last navigation using CTRL + T
" CTRL + W CTRL = ] opens the definition in a new tab
command! MakeTags !ctags -R .
set tags=./tags;/

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
" Inster mode - line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" make the switch between insert and normal mode fater 
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
"
"reduce and increase the side of vertical split
noremap <leader><Left> :vertical resize +5<CR>
noremap <leader><Right> :vertical resize -5<CR>
noremap <leader><Down>  : resize +5<CR>
noremap <leader><Up> : resize -5<CR>
"Change split windows from vertical to horizonal
map <leader>tv <C-w>t<C-w>H
map <leader>th <C-w>t<C-w>K


" Auto complete parenthesis vim
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

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

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
