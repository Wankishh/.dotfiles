
local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap

local telescope = require("telescope")
local tb = require("telescope.builtin")
local which = require('wankishh.helpers.whichKey')
local actions = require("telescope.actions")

local getVisualSelection = function()
  vim.cmd 'noau normal! ""'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '') -- text is always "" for v mode
  if #text > 0 then
    return text
  else
    return vim.fn.expand '<cword>' or ''
  end
end

telescope.setup{
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,
			case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
		},
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close
			},
		},
		layout_config = {
			prompt_position = "top",
		},
		layout_strategy = "vertical",
	}
}

telescope.load_extension("fzf")
telescope.load_extension("lazygit")

nnoremap("<Leader>fs", function()
    tb.grep_string({ search = vim.fn.input("Grep For > ")})
end)

vnoremap("<Leader>fs", function()
	local text = getVisualSelection()
    tb.grep_string({ search = text })
end)

nnoremap("<Leader>fw", function()
    tb.lsp_dynamic_workspace_symbols()
end)

nnoremap("<Leader>fr", function()
    tb.resume()
end)

nnoremap("<Leader>ff", function()
    tb.find_files()
end)

nnoremap("<C-e>", function()
    tb.buffers({
		sort_mru = true
	})
end)

nnoremap("<Leader>fg", function()
    tb.git_files()
end)

which.registerNormal({
	f = {
		name = "Telescope",
		r = { "Resume last picker" },
		g = { "Git Files"},
		f = { "Find files" },
		s = { "Search in files" }
	},
	["<C-e"] = {
		name = "Recent Files",
		"Recent files"
	}
})
