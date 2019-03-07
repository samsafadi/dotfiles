filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()

let mapleader = ","

filetype plugin indent on  " allows auto-indenting depending on file type
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions

nnoremap <leader><space> :nohlsearch<CR>
:imap jk <Esc>
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set number
:colorscheme badwolf
:set showcmd
:set cursorline
:filetype indent on
:set wildmenu
:set lazyredraw
:set showmatch
:set incsearch
:set hlsearch
:nnoremap B ^
:nnoremap E $
:nnoremap $ <nop>
:nnoremap ^ <nop>
:set mouse=a
:syntax on

" Splits    
map <C-j> <C-W>j    
map <C-k> <C-W>k    
map <C-h> <C-W>h    
map <C-l> <C-W>l  

" airline
let g:airline_powerline_fonts = 1
