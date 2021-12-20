let g:ale_disable_lsp = 1

call plug#begin()
" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'dense-analysis/ale'
Plug 'tpope/vim-rails'

" Visual Plugins
Plug 'sainnhe/edge'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'Shopify/vim-sorbet'

" Functional Plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'andymass/vim-matchup'
call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.eruby = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = {"src/parser.c"}
  },
  used_by = {"erb", "html.erb", "html.ejs", "ejs"} -- additional filetypes that use this parser
}
EOF

" Theme options
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
if has('termguicolors')
  set termguicolors
endif
let g:edge_style = 'neon'
" function! s:edge_custom() abort
"   highlight! link rubyBlockParameterList Purple
"   highlight! link rubySymbol Yellow
"   highlight! link cOperator Purple
" endfunction

" augroup EdgeCustom
"   autocmd!
"   autocmd ColorScheme edge call s:edge_custom()
" augroup END

colorscheme edge

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set noshowmode
set noruler
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set signcolumn=yes
set relativenumber
set backspace=indent,eol,start
set hidden
set incsearch
set wildmenu
set number
set mouse=a
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=20
set omnifunc=syntaxcomplete#Complete
set laststatus=2
set autoread
set colorcolumn=+1
set colorcolumn=120

autocmd FileType text setlocal wrap
autocmd FileType text setlocal linebreak

autocmd FileType tagbar,nerdtree,startify setlocal signcolumn=no
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=35
let NERDTreeMinimalUI=0
let NERDTreeQuitOnOpen=0
let g:airline_powerline_fonts = 1
let g:airline#extensions#nerdtree_statusline = 0

autocmd FileType pug setlocal listchars+=space:␣
autocmd FileType pug setlocal list 

" nnoremap <silent> <expr> <c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" autocmd VimEnter * NERDTree | wincmd p | if !&modifiable || exists('s:empty') || isdirectory(bufname()) | wincmd p | endif
" let g:NERDTreeHijackNetrw=0
" augroup NERDTreeHijackNetrw
"   autocmd VimEnter * silent! autocmd! FileExplorer
" augroup END

" Stop all folds from opening when auto-pairs
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

map <C-b> :NERDTreeFocus<CR>
noremap <leader>t :bel terminal<CR> 

" Autopair
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
au FileType eruby let b:AutoPairs = AutoPairsDefine({'<%' : '%>', '<%=' : '%>'})

:command! Inite :e ~/.config/nvim/init.vim
:command! Inits :source ~/.config/nvim/init.vim

nnoremap <silent> <expr> <c-[> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <silent> <expr> <c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
nnoremap <silent> <expr> <c-\> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <silent> <expr> <c-]> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <C-f> :Rg <cr>
nnoremap <silent> <expr> <c-L> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

source ~/.config/nvim/visual.vim
" source ~/.config/nvim/coc.vim
