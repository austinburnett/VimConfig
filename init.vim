" Vim-Plug-Begin
call plug#begin('~/.config/nvim/autoload/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Startup to show recent files
Plug 'mhinz/vim-startify'

" File explorer
Plug 'preservim/nerdtree'

" Tabline/Status improvement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shows lines that have been added/removed in git
Plug 'airblade/vim-gitgutter'

" Syntax checker
Plug 'vim-syntastic/syntastic'

" Git integration
Plug 'tpope/vim-fugitive'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Syntax highlighting for pug
Plug 'digitaltoad/vim-pug'

" Linter
"Plug 'dense-analysis/ale'

" Fzf
Plug 'nvim-telescope/telescope.nvim'
Plug 'sharkdp/fd'
Plug 'nvim-lua/plenary.nvim'

" Autocomplete (Language Server)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim-Plug-End
call plug#end()

" Vim settings go below here
"=============================

" VIM OPTIONS
set mouse=a
set number
set relativenumber
set nowrap
syntax on
set scrolloff=8

" INDENTATION
" Unsure whether tabstop and shiftwidth should be 2 or 4, 2 makes multi-line comments in js work
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
" new indent options, tesing them
set smarttab
set cindent

" FILETYPE
filetype on
filetype plugin on
filetype indent on

" VIM REGEX SEARCHING
" lowercase searches will be insensitive
" search with ONE uppercase will be sensitive
set ignorecase
set smartcase
set nohlsearch
set incsearch

" CHANGE MAP LEADER TO SPACE
let mapleader = ' '

" GIVE MORE SPACE FOR DISPLAYING MESSAGES
set cmdheight=2

" COLOR SCHEMES
set background=dark
colorscheme gruvbox
let g:airline_theme='tomorrow'

" NAVIGATING MULTIPLE PANES
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" TELESCOPE KEYMAPS
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" COC.VIM KEYMAPS
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" PLACE LUA SCRIPT HERE
"=============================
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    }

}
EOF

" Javascript (tab width 2 char)
autocmd FILETYPE javascript set tabstop=2
autocmd FILETYPE javascript set shiftwidth=2
autocmd FILETYPE javascript set softtabstop=2

