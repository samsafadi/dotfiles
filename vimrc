" Bassam Safadi's init.vim
" nvim 0.5.0 or greater
" samsafadi@berkeley.edu

let mapleader = " "
let maplocalleader = ","

filetype off
set nocompatible            " Disable compatibility to old-time vi

" =============================================================================
" # PLUGINS
" =============================================================================
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" look and feel
Plug 'gruvbox-community/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'
Plug 'romainl/vim-cool'
Plug 'hoob3rt/lualine.nvim'

" makers and syntax checkers
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

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

nnoremap <leader>n :noh<cr>
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set number relativenumber
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
nnoremap <leader>r :w<cr>:so ~/.config/nvim/init.vim<cr>:e<cr>:noh<cr>
set laststatus=2
set scrolloff=3
set t_co=256
colorscheme gruvbox
" hi Comment ctermfg=green
set backspace=indent,eol,start
set completeopt=menuone,noselect

" Set tabstop 4 for python files
autocmd Filetype python setlocal ts=4 sw=4 softtabstop=4 expandtab

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
" nnoremap <silent> j gj
" nnoremap <silent> k gk
" vnoremap <silent> j gj
" vnoremap <silent> k gk

" permanent undo
set undodir=~/config/nvim/vimdid
set undofile

" remember last position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" rooter
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

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

" lsp
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require'lspconfig'.jedi_language_server.setup{}
EOF

nnoremap <silent> <leader>t <cmd>lua vim.lsp.buf.definition()<CR>

" lsp
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
}

EOF

" completion
lua << EOF
local cmp = require'cmp'

require'cmp'.setup ({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      print("right")
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      print("left")
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end),
  },

  sources = {
    { name = 'nvim_lsp' }
  }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

EOF

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" lualine
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
