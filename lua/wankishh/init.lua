local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local which = require("wankishh.helpers.whichKey")

require("wankishh.packer")
require("mason").setup()
require("nvim-autopairs").setup({})
require("wankishh.telescope")
require("wankishh.harpoon")
require("wankishh.refactoring")
require("wankishh.debug")
require("neo-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore = { ".git", "node_modules", ".cache" },
	auto_close = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git_hl = true,
})

require("lualine").setup({
	options = {
		theme = "gruvbox",
	},
})
require("wankishh.gitCommands")

map("<leader>e", function()
	vim.cmd(":Neotree toggle reveal")
end)

which.registerNormal({
	e = { name = "Files", "Toggle Neo Tree" },
}, "Leader")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Yank to clipboard
nnoremap("<Leader>y", '"+y')
vnoremap("<Leader>y", '"+y')
map("<Leader>Y", '"+Y')

-- Paste from register clipboard
nnoremap("<Leader>p", '"+p')
vnoremap("<Leader>p", '"+p')
map("<Leader>P", '"+P')

map("C-h", function()
	vim.cmd(":TmuxNavigateLeft")
end)
map("C-j", function()
	vim.cmd(":TmuxNavigateDown")
end)
map("C-k", function()
	vim.cmd(":TmuxNavigateUp")
end)
map("C-l", function()
	vim.cmd(":TmuxNavigateRight")
end)

map("C-q", function()
	vim.cmd(":q<CR>")
end)

require("wankishh.commands")
require("wankishh.bufferline")
