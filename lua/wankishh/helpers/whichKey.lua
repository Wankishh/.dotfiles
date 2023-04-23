
local which = {}

which.registerNormal = function (mappings, prefix)
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		error(
			"WhichKey Is not defined"
		)
		return
	end

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = prefix or "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	which_key.register(mappings, opts)
end

which.registerVisual = function (mappings, prefix)
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		error(
			"WhichKey Is not defined"
		)
		return
	end

	local vopts = {
		mode = "v", -- VISUAL mode
		prefix = prefix or "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}
end


return which;
