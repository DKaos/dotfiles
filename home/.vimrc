set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'tpope/vim-fugitive' " the ultimate git helper
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set relativenumber
set number

set hidden
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set autoread " detect when a file is changed
set wildmenu

set history=1000         " remember more commands and search history
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set clipboard^=unnamed,unnamedplus
set pastetoggle=<F2>

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

let mapleader = "\<Space>"

if &diff                             " only for diff mode/vimdiff
	set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
	nmap <Leader>k [c
	nmap <Leader>j ]c
endif

set t_Co=256
syntax on
colorscheme Tomorrow-Night

" Keep undo history across sessions by storing it in a file
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

nnoremap <silent> // :nohl<CR>

nnoremap j gj
nnoremap k gk

" create window split easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" tab movements
noremap <Leader>h <ESC>:tabprevious<CR>
noremap <Leader>l <ESC>:tabnext<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" fast file switch
nnoremap <Leader><Leader> <C-^>

" save and exit keys
nnoremap <Leader>w :w<CR>
nnoremap <Leader>Z :q!<CR>
nnoremap <Leader>z :q<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" jk is escape in insert mode
inoremap jk <esc>

" NERDTree
noremap <leader>t :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\.egg$', '\.o$', '\~$', '__pycache__$', '\.egg-info$']

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
