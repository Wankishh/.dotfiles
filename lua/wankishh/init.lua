local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap


require("wankishh.packer")
require("mason").setup()
require("nvim-autopairs").setup {}

require("wankishh.telescope")
require("wankishh.harpoon")
require("wankishh.refactoring")
require("wankishh.gitCommands")

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
