" New vim not old vi ?
set nocompatible
"
" removes annoying error sound
set noerrorbells
set belloff=all
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'


" Install VimPlug from - https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"shows files, git-file in the current directory 
"Also support recurssive grep (Note install rg first -> https://github.com/BurntSushi/ripgrep#installation)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

"themes for vim editor
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'joshdick/onedark.vim'

"commenting 
Plug 'tpope/vim-commentary'

"Git "
Plug 'tpope/vim-fugitive'

"Git - to go to github link in the browser"
Plug 'tpope/vim-rhubarb'

"Shows status line - Futuve status line depends on airline"
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
" Go to the the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'

" Autocomplete and very quick navigation between functions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
:set relativenumber

" Pasting with indent
nnoremap p p=`]
nnoremap <c-p> p

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

" For one dark theme
" syntax on
" colorscheme onedark
" set cursorline

" For One half theme
syntax on 
" Change the value of cterm in `~/.vim/plugged/onehalf/vim/colors/onehalfdark.vim` if your backgound in mac iterm is brownish 
" let s:black       = { "gui": "#282c34", "cterm": "236" }
" Find the appropraite value for cterm from - https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

" enable 256 colors
set t_Co=256
set t_ut=
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

" to get fzf preview syntax highlighting with bat
" First install bat - (https://github.com/sharkdp/bat#installation) - Mac OS  brew install bat
"add this to your ~/.zhrc or ~/.bashrc
" export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
"
"Lets to find files in the directory and subdirectory by using find:<filename>
" set path+=**

" Makes tags recurssively in the directory and can navigate between functions using CTRL + ]
" Go back to the last navigation using CTRL + T
" CTRL + W CTRL = ] opens the definition in a new tab
command! MakeTags !ctags -R .
set tags=./tags;/

set termguicolors
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
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

" file browser
" Start NERDTree when opring any folder and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p



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

" This seems to mess up code
" Autoformat document                                                                                                                     
" nnoremap F gg=G''

" tv will bring a pane that shows the current directory tree - which is
" verically resized to to 30 units 
let g:netrw_banner = 0
noremap <leader>nt :NERDTree<CR>
" noremap <leader>tv :vsp<bar> :Ex <bar> : vertical resize 30<CR>
"
"
"reduce and increase the side of vertical split
noremap <leader>h :vertical resize +5 <CR>
noremap <leader>l :vertical resize -5 <CR>

" Easy naviation btw vertical splits by CTRL + <h, l, j, k>
" Not so easy after all maybe
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>

" Autocomple paranthesis vim
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
 "Search and replace -> %s/<targetWord><replaceWith>/gI
noremap <leader>sr :%s//gI<Left><Left><Left>

" Disable arrow keys - hard mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Scrolling with keyboard
" Move up/down lines with [CTRL + u][CTRL + d]
map <C-d> 5j
map <C-u> 5k

" Show git logs using git fugitive plugin 
" Ypu can go see the diff in the commit by pressing enter on the git commit id 
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


" GoTo code navigation using coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Disable autocomplete
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType Markdown let b:coc_suggest_disable = 1
autocmd FileType vim let b:coc_suggest_disable = 1

