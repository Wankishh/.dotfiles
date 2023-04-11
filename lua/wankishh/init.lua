local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'ThePrimeagen/refactoring.nvim'
    Plug 'David-Kunz/jester'
    Plug 'mxsdev/nvim-dap-vscode-js'
    Plug 'nvim-telescope/telescope-dap.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'

    Plug 'lewis6991/gitsigns.nvim'

    Plug ("ThePrimeagen/harpoon")
    Plug ("nvim-treesitter/nvim-treesitter", { ['do']= ":TSUpdate"})

    -- Autocomplete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/diaglist.nvim'
    Plug 'onsails/lspkind.nvim'
    Plug 'saadparwaiz1/cmp_luasnip'

    --  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

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

    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'mfussenegger/nvim-jdtls'
    --" Use release branch (recommend)
vim.call('plug#end')

require("mason").setup()

require("nvim-autopairs").setup {}
require("wankishh.telescope")
require("wankishh.lsp")
require("wankishh.harpoon")
require("wankishh.refactoring")
require("wankishh.gitCommands")

-- local dapVscode = require("dap-vscode-js")
-- local dap = require("dap")
-- require("nvim-dap-virtual-text").setup()
-- require("dapui").setup()

-- dapVscode.setup({
--     adapters = {
--         'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal',
--         'pwa-extensionHost'
--     },
--     debugger_path = "/home/ivelinov/.config/nvim/plugged/vscode-js-debug/"
-- })


-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { "/home/ivelinov/apps/vscode-node-debug2/out/src/nodeDebug.js" },
-- }

-- require("wankishh.debug")

-- Nerdtree
map("<C-n>", function()
    vim.cmd(":NERDTreeToggle %")
end)


-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("<Leader>qa", function ()
    vim.cmd("%bd! | e# | bd#")
end)

nnoremap("<Leader>s", function ()
    vim.cmd(":w")
end)

-- How to exit vim??!?
nnoremap("<C-q>", function ()
    local num = vim.nvim_get_current_buf()
    vim.cmd(":%bd " .. num)
end)


-- Yank to clipboard
nnoremap("<Leader>y", "\"+y")
vnoremap("<Leader>y", "\"+y")
map("<Leader>Y", "\"+Y")

-- Paste from register clipboard
nnoremap("<Leader>p", "\"+p")
vnoremap("<Leader>p", "\"+p")
map("<Leader>P", "\"+P")

require("wankishh.commands")
require("wankishh.bufferline")
