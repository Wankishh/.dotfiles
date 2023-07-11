local remap = require("wankishh.keymap")
local map = remap.nmap
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local which = require("wankishh.helpers.whichKey")
local null_ls = require("null-ls")

require("wankishh.packer")
require("mason").setup()
require("nvim-autopairs").setup({})
require("wankishh.telescope")
require("wankishh.harpoon")
require("wankishh.refactoring")
require("wankishh.gitCommands")
require("wankishh.debug")
require("nvim-tree").setup {}
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prismaFmt,
	},
	-- on_attach = function(client, bufnr)
		-- 	if client.supports_method("textDocument/formatting") then
		-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
				-- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				-- 				-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
				-- 				vim.lsp.buf.format({ async = false })
				-- 			end,
				-- 		})
				-- 	end
				-- end,
			})

map("<leader>e", function()
	vim.cmd(":NvimTreeFindFileToggle")
end)

which.registerNormal({
	e = { name = "Files", "Toggle Nvim Tree" },
}, "Leader")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Yank to clipboard
nnoremap("<Leader>y", '"+y')
vnoremap("<Leader>y", '"+y')
map("<Leader>Y", '"+Y')

-- Paste from register clipboard
nnoremap("<Leader>p", '"+p')
vnoremap("<Leader>p", '"+p')
map("<Leader>P", '"+P')

require("wankishh.commands")
require("wankishh.bufferline")
