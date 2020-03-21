" Change map leader from \ to ,
let mapleader = " "

filetype off
set nocompatible            " Disable compatibility to old-time vi

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" Semantic Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Look and feel
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
"
" makers and syntax checkers
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'


" Syntactic Language Support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
" latex
Plug 'lervag/vimtex'
call plug#end()

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

filetype plugin indent on   

nnoremap <leader><space> :nohlsearch<CR>
:imap jk <Esc>
:set tabstop=4
:set softtabstop=4           
:set shiftwidth=4
:set expandtab              
:set autoindent
:set number
:colorscheme jellybeans
:set showcmd
:filetype indent on
:set wildmenu
:set lazyredraw
:set showmatch
:set incsearch
:set hlsearch
:set ignorecase             
:set relativenumber number
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
:set termguicolors

" permanent undo
set undodir=~/.vimdid
set undofile

" ncm2 options
" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
"set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" latexmk
let g:tex_flavor = "xelatex"
let g:tex_fast = "cmMprs"
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Coc-Explorer
nmap <space>e :CocCommand explorer<CR>
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

