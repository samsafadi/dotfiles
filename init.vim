" Bassam Safadi's vimrc
" Compatible with vim and neovim
" samsafadi@berkeley.edu

set shell=/bin/zsh
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
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'justinmk/vim-sneak'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'itchyny/lightline.vim'

" makers and syntax checkers
Plug 'racer-rust/vim-racer', {'for': 'rust'}
"Plug 'davidhalter/jedi-vim'

" Git
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" syntactic language support
Plug 'rust-lang/rust.vim'

" latex
Plug 'lervag/vimtex'
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

" latexmk
let g:tex_flavor = "xelatex"
let g:tex_fast = "cmmprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:vimtex_view_general_viewer = 'evince'

set foldlevel=99
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" vimwiki
let g:vimwiki_list = [{'path':'~/Dropbox/vimwiki', 'path_html':'~/Dropbox/vimwiki/public_html'}]

" airline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" =============================================================================
" # Editor settings
" =============================================================================

" colors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
"let g:jellybeans_use_term_italics = 1

nnoremap <leader>n :nohlsearch<cr>
inoremap jk <esc>
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
set laststatus=2
set noshowmode
set scrolloff=3

filetype plugin indent on
" Terminal mode
tnoremap jk <c-\><c-n>
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

" Sneak instead fof f (because f sucks)
" Use <leader>s to use 2 character sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

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
