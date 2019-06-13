" Change map leader from \ to ,
let mapleader = ","

filetype off
set nocompatible            " Disable compatibility to old-time vi

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'


call plug#end()

let g:deoplete#enable_at_startup = 1
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

" tab completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" transparent background
hi Normal guibg=NONE ctermbg=NONE
