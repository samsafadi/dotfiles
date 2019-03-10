filetype off
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
"Plug 'davidhalter/jedi-vim'
"Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/YouCompleteMe'

" All of your Plugs must be added before the following line
call plug#end()

let mapleader = ","

filetype plugin indent on   " allows auto-indenting depending on file type
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
