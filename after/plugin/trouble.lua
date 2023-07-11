local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap
local which = require("wankishh.helpers.whichKey")


nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")


which.registerNormal({
	x = {
		name = "Trouble",
		x = "Trouble Toggle",
		w = "Trouble Workspace",
		d = "Trouble Document",
		l = "Trouble Loclist",
		q = "Trouble Quickfix",
		"Trouble References",
	},
}, "Leader")

which.registerNormal({
	g = {
		name = "Git",
		R = "Trouble References",
	},
}, "None")



