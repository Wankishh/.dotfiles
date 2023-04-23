local nnoremap = require("wankishh.keymap").nnoremap
local which = require("wankishh.helpers.whichKey")

local silent = { silent = true }

nnoremap("<leader>ha", function() require("harpoon.mark").toggle_file() end, silent)
nnoremap("<leader>hq", function() require("harpoon.mark").clear_all() end, silent)
nnoremap("<leader>he", function() require("harpoon.ui").toggle_quick_menu() end, silent)

which.registerNormal({
	h = {
		name = "Harpoon",
		a = { "Harpoon Mark"},
		e = { "Open Harpoon" },
		q = { "Clear harpoon" }
	}
})

