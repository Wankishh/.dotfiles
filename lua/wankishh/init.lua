local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local which = require("wankishh.helpers.whichKey")


require("wankishh.packer")
require("mason").setup()
require("nvim-autopairs").setup {}
require("wankishh.telescope")
require("wankishh.harpoon")
require("wankishh.refactoring")
require("wankishh.gitCommands")
-- require("wankishh.lsp")
-- require("wankishh.cmp")

-- Nerdtree
map("<C-n>", function()
    vim.cmd(":NERDTreeToggle %")
end)

which.registerNormal({
	n = { name = "Files", "Toggle NerdTree" }
}, "Control")


-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

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
