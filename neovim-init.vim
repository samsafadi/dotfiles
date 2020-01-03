" Change map leader from \ to ,
let mapleader = ","

filetype off
set nocompatible            " Disable compatibility to old-time vi

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" Semantic Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
"
" makers and syntax checkers
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'

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
:colorscheme base16-default-dark
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


" Linter
" only lint on save
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_save = 0
"let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {
            \'rust': ['rls'],
            \'c': ['clang'],
            \'python':['flake8', 'pylint'],
            \}
let g:ale_completion_enabled = 1
let g:ale_rust_rls_toolchain = 'stable'
"highlight link ALEWarningSign Todo
"highlight link ALEErrorSign WarningMsg
"highlight link ALEVirtualTextWarning Todo
"highlight link ALEVirtualTextInfo Todo
"highlight link ALEVirtualTextError WarningMsg
"highlight ALEError guibg=None
"highlight ALEWarning guibg=None
"let g:ale_sign_error = "✖"
"let g:ale_sign_warning = "⚠"
"let g:ale_sign_info = "i"
"let g:ale_sign_hint = "➤"
:highlight ALEError ctermbg=none cterm=underline

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" latexmk
let g:tex_flavor = "latex"
let g:tex_fast = "cmMprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:vimtex_view_general_viewer = 'evince'

:set foldlevel=99

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

