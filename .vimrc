" removes annoying error sound
set belloff=all
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'


" Install VimPlug from - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"shows files, git-file in the current directory 
"Also support recurssive grep (Note install rg first -> https://github.com/BurntSushi/ripgrep#installation)

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

"current theme of vim editor
Plug 'sonph/onehalf', { 'rtp': 'vim' }

"commenting 
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" to get fzf preview syntax highlighting with bat
" First install bat - (https://github.com/sharkdp/bat#installation) - Mac OS  brew install bat
"add this to your ~/.zhrc or ~/.bashrc
" export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

syntax on 
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

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

" map the leader key to space bar
let mapleader = " "


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
"noremap <leader>tv :vsp<bar> :Ex <bar> : vertical resize 30<CR>
"
"
"reduce and increase the side of vertical split
noremap <leader>+ :vertical resize +5<CR>
noremap <leader>- :vertical resize -5<CR>

" Autocomple paranthesis vim
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
