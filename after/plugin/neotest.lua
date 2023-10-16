local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap
local project = require("wankishh.project")

local root = project.getProjectRoot or nil

if not root then
	print "No .git found"
	return
end

local command = root .. "/node_modules/.bin/jest"

require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = command,
		}),
	},
})

nnoremap("<leader>tt", function()
	require("neotest").run.run()
end)
