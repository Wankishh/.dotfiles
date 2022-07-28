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

set relativenumber" show absolute line numbers
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

call plug#begin('~/.config/nvim/plugged')
    Plug 'mfussenegger/nvim-dap'
    Plug 'tpope/vim-commentary'
    Plug 'thaerkh/vim-workspace'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'doums/darcula'
    Plug 'windwp/nvim-autopairs'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'windwp/nvim-autopairs'
    Plug 'pantharshit00/vim-prisma'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
    Plug 'jparise/vim-graphql'        " GraphQL syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'eslint/eslint'
    Plug 'morhetz/gruvbox'
    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
call plug#end()


colorscheme gruvbox
" highlight Normal guibg=None
syntax on

lua << EOF
require("bufferline").setup{
    options = {
        diagnostics = "coc",
        close_icon = "x",
        numbers = "buffer_id",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false
    }

}
require('telescope').setup{}
require("nvim-autopairs").setup {}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('lazygit')
EOF
" coc ts server
let g:coc_global_extensions = ['coc-tsserver']


nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gf :lua require('telescope.builtin').git_files()<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> K :call CocAction('definitionHover')<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run jest for current test
nnoremap <leader>ts :call CocAction('runCommand', 'jest.singleTest')<CR>

nnoremap <silent><leader>w :BufferLineCycleNext<CR>
nnoremap <silent><leader>e :BufferLineCyclePrev<CR>
nnoremap <silent><leader>q :BufferLinePickClose <CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
" nnoremap <silent><leader>q :BufferLineMoveNext<CR>
" nnoremap <silent><leader>e :BufferLineMovePrev<CR>
map <C-n> :NERDTreeToggle %<CR>

" map for lazygit
nnoremap <silent> <leader>gg :LazyGit<CR>
" Toggle workspace vim
nnoremap <leader>svw :ToggleWorkspace<CR>

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

nnoremap <silent> <leader>qa :w <bar> %bd <bar> e# <bar> bd# <CR><CR>


" Run Flow tests
command -nargs=? FlowTest :!npm run test:dev -- <q-args>
command -nargs=? FlowBuild :!cd ~/projects/developsoft/mce/src/apps/flows && npm run prepublishOnly-dev
command -nargs=? MceEslint :!cd ~/projects/developsoft/mce && npm run check:eslint
command -nargs=? LernaBootstrap :!cd ~/projects/developsoft/mce && npm run bootstrap 
command -nargs=1 FlowRetailRun :!cd ~/projects/developsoft/mce/src/apps/flows/__tests__/flow-runner && npm run flow -- 1 --flow <q-args> --mocks freedom/retail/web/beta.ts --displayLayer false 
command -nargs=1 FlowMobileRun :!cd ~/projects/developsoft/mce/src/apps/flows/__tests__/flow-runner && npm run flow -- 1 --flow <q-args> --mocks mlp.ts --displayLayer false 

