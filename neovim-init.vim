" Change map leader from \ to ,
let mapleader = ","

filetype off
set nocompatible            " Disable compatibility to old-time vi

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
"Plug 'davidhalter/jedi-vim'
"Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
"Plug 'Townk/vim-autoclose'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on   

nnoremap <leader><space> :nohlsearch<CR>
:imap jk <Esc>
:set tabstop=4
:set softtabstop=4           
:set shiftwidth=4
:set expandtab              
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
:set ignorecase             
:nnoremap B ^
:nnoremap E $
:nnoremap $ <nop>
:nnoremap ^ <nop>
:vnoremap B ^
:vnoremap E $
:vnoremap ^ <nop>
:vnoremap $ <nop>
:set mouse=a
:syntax on
:set wildmode=longest,list   

" Splits    
map <C-j> <C-W>j    
map <C-k> <C-W>k    
map <C-h> <C-W>h    
map <C-l> <C-W>l  

" airline
let g:airline_powerline_fonts = 1
