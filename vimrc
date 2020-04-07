" Change map leader from \ to ,
let mapleader = " "

filetype off
set nocompatible            " Disable compatibility to old-time vi

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" Semantic Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" look and feel
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'
Plug 'justinmk/vim-sneak'

" makers and syntax checkers
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'morhetz/gruvbox'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" syntactic language support
Plug 'rust-lang/rust.vim'
" latex
Plug 'lervag/vimtex'
call plug#end()

" deal with colors
if !has('gui_running')
  set t_co=256
endif
if (match($term, "-256color") != -1) && (match($term, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

filetype plugin indent on   

nnoremap <leader><space> :nohlsearch<cr>
imap jk <esc>
set tabstop=4
set softtabstop=4           
set shiftwidth=4
set expandtab              
set autoindent
set number
colorscheme gruvbox
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
set wildmode=list:longest,full
set background=dark
set splitbelow
set splitright
nnoremap <leader>r :so ~/.vimrc<cr>

" Terminal mode
tnoremap jk <c-\><c-n>
if !has('nvim')
noremap <silent> <leader>g :term<cr>
    augroup TerminalStuff
        au!
        autocmd TerminalOpen * setlocal nonumber norelativenumber
    augroup END
endif
if has('nvim')
noremap <silent> <leader>g :sp <cr> :term <cr>
    augroup TerminalStuff
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber insertmode
    augroup END
endif

" buffers
set hidden
nnoremap <silent> <leader>[ :bp!<cr>
nnoremap <silent> <leader>] :bn!<cr>
nnoremap <silent> <leader>d :bd<cr>
nnoremap <silent> <leader>D :bd!<cr>
" From fzf (wow i love this)
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>

" Sneak instead fof f (because f sucks)
" Use <leader>s to use 2 character sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" permanent undo
set undodir=~/.vimdid
set undofile

" ncm2 options
" enable ncm2 for all buffers
"autocmd bufenter * call ncm2#enable_for_buffer()

" important: :help ncm2popupopen for more information
"set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'the only match' and 'pattern not
" found' messages
"set shortmess+=c

" ctrl-c doesn't trigger the insertleave autocmd . map to <esc> instead.
inoremap <c-c> <esc>

" when the <enter> key is pressed while the popup menu is visible, it only
" hides the menu. use this mapping to close the menu and also start a new
" line.
inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")


" latexmk
let g:tex_flavor = "xelatex"
let g:tex_fast = "cmmprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:vimtex_view_general_viewer = 'evince'

:set foldlevel=99

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

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


" NERDTree 
nmap <leader>e :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" remember last position (nvim)
if has('nvim') 
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
endif 
