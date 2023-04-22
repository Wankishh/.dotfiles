
local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap

local telescope = require("telescope")

telescope.setup{}
telescope.load_extension("fzy_native")
telescope.load_extension("lazygit")

nnoremap("<Leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<Leader>fb", function()
    require('telescope.builtin').buffers({
		sort_mru = true
	})
end)

nnoremap("<Leader>fg", function()
    require('telescope.builtin').git_files()
end)
