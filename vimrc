" Bassam Safadi's vimrc
" Compatible with vim and neovim
" samsafadi@berkeley.edu

let mapleader = " "
let maplocalleader = ","

filetype off
set nocompatible            " Disable compatibility to old-time vi

" =============================================================================
" # PLUGINS
" =============================================================================
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" look and feel
" Plug 'romainl/Apprentice'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'

" makers and syntax checkers
Plug 'racer-rust/vim-racer', {'for': 'rust'}

" Git
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Python
Plug 'psf/black', { 'branch': 'master' }

" syntactic language support
Plug 'rust-lang/rust.vim'

" latex
Plug 'lervag/vimtex', {'for': ['tex']}

call plug#end()

" =============================================================================
" # Editor settings
" =============================================================================

" colors
nnoremap <leader>n :noh<cr>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set showcmd
filetype indent on
set lazyredraw
set showmatch
set incsearch
set hlsearch
set ignorecase
noremap B ^
noremap E $
set mouse=a
syntax on
set wildmenu
set wildmode=longest:full,full
set background=dark
set splitbelow
set splitright
nnoremap <leader>r :so ~/.vimrc<cr>
set laststatus=1
set scrolloff=3
colo default
set backspace=indent,eol,start

" color adjustments
hi Comment 	ctermfg=green

" Set tabstop 2 for sql files
autocmd Filetype sql setlocal ts=2 sw=2 expandtab

filetype plugin indent on
" Terminal mode
tnoremap <c-[> <c-\><c-n>

" buffers
set hidden
nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader>[ :bp!<cr>
nnoremap <silent> <leader>] :bn!<cr>
nnoremap <silent> <leader>d :bd<cr>
nnoremap <silent> <leader>D :bd!<cr>
" From fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>

" deal with wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" permanent undo
set undodir=~/.vimdid
set undofile

" remember last position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" sneak highlight color
highlight Sneak guifg=black guibg=white ctermfg=black ctermbg=white
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" tmux integration
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-\> :TmuxNavigatePrevious<cr>

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
