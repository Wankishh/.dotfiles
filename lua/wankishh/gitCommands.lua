local gitsigns = require("gitsigns")
local map = require("wankishh.keymap").nmap
local vmap = require("wankishh.keymap").vnoremap
local nnoremap = require("wankishh.keymap").nnoremap
local which = require("wankishh.helpers.whichKey")

gitsigns.setup{
	on_attach = function(buf)
		map("<Leader>gn", function() gitsigns.next_hunk()   end)
		map("<Leader>gN", function() gitsigns.prev_hunk()   end)

		map("<Leader>gp", function() gitsigns.preview_hunk()   end)
		vmap("<Leader>gp", function() gitsigns.preview_hunk()   end)

		map("<Leader>gb", function() gitsigns.blame_line()   end)
		vmap("<Leader>gb", function() gitsigns.blame_line()   end)

		map("<Leader>gr", function() gitsigns.reset_hunk()   end)
		vmap("<Leader>gr", function() gitsigns.reset_hunk()   end)
	end
}

-- Lazygit
nnoremap("<Leader>gg", function()
    vim.cmd(":LazyGit")
end)

which.registerNormal({
	g = {
		name = "Git",
		g = { "Open Lazy Git"},
		n = { "Next Change" },
		N = { "Prev change" },
		p = { "Next Preview" },
		P = { "Prev Preview" },
		b = { "Blame Line" },
		r = { "Reset hunk" },
	},
})

which.registerVisual({
	g = {
		name = "Git",
		b = { "Blame"},
		r = { "Reset"},
	}
})
