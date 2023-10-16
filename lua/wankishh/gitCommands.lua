local gitsigns = require("gitsigns")
local map = require("wankishh.keymap").nmap
local vmap = require("wankishh.keymap").vnoremap
local nnoremap = require("wankishh.keymap").nnoremap
local which = require("wankishh.helpers.whichKey")

gitsigns.setup({
	debug_mode = true,
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		map("<Leader>gn", function() gs.next_hunk()   end, { buffer = bufnr })
		map("<Leader>gN", function() gs.prev_hunk()   end, { buffer = bufnr })

		map("<Leader>gp", function() gs.preview_hunk()   end, { buffer = bufnr })
		vmap("<Leader>gp", function() gs.preview_hunk()   end, { buffer = bufnr })

		map("<Leader>gb", function() gs.blame_line()   end, { buffer = bufnr })
		vmap("<Leader>gb", function() gs.blame_line()   end, { buffer = bufnr })

		map("<Leader>gr", function() gs.reset_hunk()   end, { buffer = bufnr })
		vmap("<Leader>gr", function() gs.reset_hunk()   end, { buffer = bufnr })
	end
})

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
