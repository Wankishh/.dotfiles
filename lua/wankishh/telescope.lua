
local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap

local telescope = require("telescope")
local which = require('wankishh.helpers.whichKey')
local actions = require("telescope.actions")

telescope.setup{
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,
		},
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close
			},
		},
	}
}
telescope.load_extension("fzf")
telescope.load_extension("lazygit")

nnoremap("<Leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<C-e>", function()
    require('telescope.builtin').buffers({
		sort_mru = true
	})
end)

nnoremap("<Leader>fg", function()
    require('telescope.builtin').git_files()
end)

which.registerNormal({
	f = {
		name = "Telescope",
		g = { "Git Files"},
		f = { "Find files" },
		s = { "Search in files" }
	},
	["<C-e"] = {
		name = "Recent Files",
		"Recent files"
	}
})
