" Bassam Safadi's vimrc
" Compatible with vim and neovim
" samsafadi@berkeley.edu

let mapleader = " "

filetype off
set nocompatible            " Disable compatibility to old-time vi

" =============================================================================
" # PLUGINS
" =============================================================================
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" Semantic Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" look and feel
Plug 'gruvbox-community/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'romainl/Apprentice'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'christoomey/vim-tmux-navigator'

" makers and syntax checkers
Plug 'racer-rust/vim-racer', {'for': 'rust'}

" Git
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" syntactic language support
Plug 'rust-lang/rust.vim'

call plug#end()

" wiki
Plug 'vimwiki/vimwiki'

" use tab for trigger completion with characters ahead and navigate.
" use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" use <cr> to confirm completion, `<c-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<cr>"

" =============================================================================
" # Editor settings
" =============================================================================

" colors

nnoremap <leader>n :nohlsearch<cr>
"inoremap jk <esc>
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
set relativenumber number
noremap B ^
noremap E $
set mouse=a
syntax on
set wildmenu
set wildmode=longest:full,full
set background=dark
set splitbelow
set splitright
nnoremap <leader>r :so ~/.config/nvim/init.vim<cr>
set laststatus=1
"set noshowmode
set scrolloff=3
colo peachpuff
hi Comment 	ctermfg=green

" Set tabstop 2 for sql files
autocmd Filetype sql setlocal ts=2 sw=2 expandtab

filetype plugin indent on
" Terminal mode
tnoremap <c-[> <c-\><c-n>
if !has('nvim')
noremap <silent> <leader>t :term<cr>
    augroup TerminalStuff
        au!
        autocmd TerminalOpen * setlocal nonumber norelativenumber
    augroup END
endif
if has('nvim')
noremap <silent> <leader>t :sp <cr> :term <cr> :startinsert <cr>
    augroup TerminalStuff
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END
endif

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" permanent undo
set undodir=~/.vimdid
set undofile

" remember last position (nvim)
if has('nvim')
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
end

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

" transparent background keep at end
" :hi Normal guibg=NONE ctermbg=NONE
