local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug ('folke/tokyonight.nvim', { ['branch']= 'main' })
    -- LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

    -- Autocomplete 
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/diaglist.nvim'
    Plug 'onsails/lspkind.nvim'
    Plug ('tzachar/cmp-tabnine', { ['do']= './install.sh' })
    Plug 'saadparwaiz1/cmp_luasnip'



    --  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'


    Plug 'VonHeikemen/lsp-zero.nvim'

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
    Plug 'pangloss/vim-javascript'    --  JavaScript support
    Plug 'leafgarland/typescript-vim' --  TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   -- JS and JSX syntax
    Plug 'jparise/vim-graphql'        -- GraphQL syntax
    Plug 'eslint/eslint'
    Plug 'morhetz/gruvbox'
    Plug 'kyazdani42/nvim-web-devicons' -- Recommended (for coloured icons)
    Plug ('akinsho/bufferline.nvim', {['tag']= 'v2.*' })
vim.call('plug#end')


local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require("nvim-autopairs").setup {}
require("nvim-lsp-installer").setup{
    automatic_installation = true
}

-- Telescope
local telescope = require("telescope")

telescope.setup{}
telescope.load_extension("fzy_native")
telescope.load_extension("lazygit")

nnoremap("<Leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<Leader>fb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<Leader>gf", function()
    require('telescope.builtin').git_files()
end)

-- Nerdtree
map("<C-n>", function()
    vim.cmd(":NERDTreeToggle %")
end)

-- Lazygit
nnoremap("<Leader>gg", function()
    vim.cmd(":LazyGit")
end)

-- Bufferline helpers
nnoremap("<Leader>w", function()
    vim.cmd(":BufferLineCycleNext")
end)

nnoremap("<Leader>e", function()
    vim.cmd(":BufferLineCyclePrev")
end)
nnoremap("<Leader>q", function()
    vim.cmd(":BufferLinePickClose")
end)
-- Just for resetting purposes if plugin bugs
nnoremap("<Leader>1", function()
    vim.cmd(":BufferLineGoToBuffer 1")
end)


-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("<Leader>qa", function ()
    vim.cmd("%bd | e# | bd#")
end)

require("bufferline").setup{
    options = {
        -- diagnostics = "coc",
        close_icon = "x",
        numbers = "buffer_id",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false
    }
}
