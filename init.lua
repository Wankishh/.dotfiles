vim.g.mapleader = " "
--
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("wankishh")
-- vim.opt.guicursor = ""

vim.opt.mouse = a
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false

-- tabs

vim.opt.expandtab = false -- false - tab, true - spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true


-- god mode
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.wrap = false



vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.hidden = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.cmdheight = 1
vim.opt.shortmess:append("c")


vim.opt.updatetime = 50


vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.diffopt:append("vertical")

vim.cmd "colorscheme gruvbox"
vim.cmd "syntax on"

vim.diagnostic.config({ virtual_text = true })
vim.diagnostic.open_float();

-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

