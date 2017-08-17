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
Plugin 'benmills/vimux' "interaction with tmux
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy find files
"Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'tpope/vim-fugitive' " the ultimate git helper
"Plugin 'scrooloose/syntastic' " syntax highlighting
Plugin 'tpope/vim-sensible' "sensible defaults
"Plugin 'klen/python-mode' "for python dev
"Plugin 'davidhalter/jedi-vim' " python autocomplete
Plugin 'easymotion/vim-easymotion' " python autocomplete
"Plugin 'Lokaltog/vim-powerline' "status line
"Plugin 'jistr/vim-nerdtree-tabs' "nerdtree in independent tabs
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

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set relativenumber
set number

set hidden
set nowrap

set tabstop=4 " number of space a tab is visually
set shiftwidth=4
set expandtab " turn tab into spaces
set smarttab
set autoindent
set copyindent

set backspace=indent,eol,start
set shiftround
set ignorecase
set smartcase

set hlsearch " highlight previous search pattern
set incsearch " incremental search
set showmatch " highlight matching [{()}]s

set autoread " detect when a file is changed
set wildmenu " menu for completion

set lazyredraw

set history=1000         " remember more commands and search history
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set clipboard^=unnamed,unnamedplus
set pastetoggle=<F2>

set splitbelow
set splitright

let mapleader = "\<Space>"

if &diff                             " only for diff mode/vimdiff
	set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
	nnoremap <Leader>k [c
	nnoremap <Leader>j ]c
endif

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

nnoremap <silent> // :nohl<CR>

nnoremap j gj
nnoremap k gk

" create window split easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" tab movements
noremap <Leader>h <ESC>:tabprevious<CR>
noremap <Leader>l <ESC>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

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
nnoremap <Leader>E :qa!<CR>

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
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg$', '\.o$', '__pycache__$', '\.egg-info$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

" Settings for ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" autocmd FileType python PymodeLintAuto
let g:pymode_breakpoint = 1 
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_rope = 0

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
