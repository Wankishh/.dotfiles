local null_ls = require("null-ls")
local projectUtils = require("wankishh.project")

local config = {
	find_json = function(root)
		local project_name = projectUtils.project_name
		local folderPath = "/home/ivelinov/apps/cspell/" .. project_name
		local path = "/home/ivelinov/apps/cspell/" .. project_name .. "/cspell.json"

		if vim.fn.isdirectory(folderPath) == 0 then
			vim.fn.system("mkdir -p " .. folderPath)
		end

		if vim.fn.filewritable(path) == 0 then
			vim.fn.system("touch " .. path)
		end

		print("CSPell PAth:" .. path)

		return vim.fn.expand(path)
	end,
}

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.prismaFmt,
		-- null_ls.builtins.diagnostics.cspell.with({ config = config }),
		-- null_ls.builtins.code_actions.cspell.with({ config = config }),
		null_ls.builtins.code_actions.refactoring,
	},
})
