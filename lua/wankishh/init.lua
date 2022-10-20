local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug ('ThePrimeagen/refactoring.nvim')
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


local tabnine = require('cmp_tabnine.config')
local a = {
    max_lines = 1000
}
tabnine:setup(a)


local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false
})


lsp.on_attach(function(client, bufnr)
  local nnoremap = require("wankishh.keymap").nnoremap
  nnoremap("gd", function() vim.lsp.buf.definition() end)
  nnoremap("gr", function() vim.lsp.buf.references() end)
  nnoremap("gi", function() vim.lsp.buf.implementation() end)
  nnoremap("ca", function() vim.lsp.buf.code_action() end)
  nnoremap("rn", function() vim.lsp.buf.rename() end)
  nnoremap("K", function() vim.lsp.buf.hover() end)
  nnoremap("[d", function() vim.diagnostic.goto_next() end)
  nnoremap("<F2>", function()
      vim.diagnostic.goto_next()
      vim.diagnostic.open_float()
  end)
  nnoremap("]d", function() vim.diagnostic.goto_prev() end)
  inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end)

lsp.setup_nvim_cmp({
    sources = {
        -- tabnine completion? yayaya
        { name = "cmp_tabnine", keyword_length = 2 },

             { name = "nvim_lsp", keyword_length = 3 },
        -- For luasnip user.
             { name = "luasnip", keyword_length = 2 },
            { name = "buffer", keyword_length = 3 },
           { name = 'path'},
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = {'menu', 'abbr', 'kind'},

        -- change sources
    }
})

lsp.configure("eslint", {
    settings = {
        codeActionOnSave = {
            enable = true,
            mode = "all"
        },
    }
})


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
    vim.cmd("%bd! | e# | bd#")
end)

nnoremap("<Leader>s", function ()
    vim.cmd(":w")
end)


-- Yank to clipboard
nnoremap("<Leader>y", "\"+y")
vnoremap("<Leader>y", "\"+y")
map("<Leader>Y", "\"+Y")

-- Paste from register clipboard
nnoremap("<Leader>p", "\"+p")
vnoremap("<Leader>p", "\"+p")
map("<Leader>P", "\"+P")

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


require("wankishh.commands")
