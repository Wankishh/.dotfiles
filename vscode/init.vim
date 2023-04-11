"  default options
" set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " if I accidentally use the mouse
set splitright " splits to the rightj
set splitbelow " splits below
set nohlsearch

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set relativenumber " show absolute line numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set colorcolumn=80
set updatetime=50 " time until update
set scrolloff=8 " keep the cursor at least 8 rows of the bottom
set nu
set nowrap
set foldmethod=syntax
set foldlevelstart=99
" set undofile " persists undo tree
let mapleader = " " " space as leader key
if (has("termguicolors"))
 set termguicolors " better colors, but makes it sery slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript',  'json=javascript'] " syntax highlighting in markdown
" let g:workspace_autocreate = 0
" let g:workspace_autosave_always = 1
" 

if exists('g:vscode')
  source /home/ivelinov/.config/nvim/vscode/settings.vim
endif

call plug#begin('~/.config/nvim/plugged')
call plug#end()

