local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap


vim.lsp.set_log_level("debug")


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
-- -- Setup nvim-cmp.
-- local cmp = require("cmp")
-- local source_mapping = {
-- 	buffer = "[Buffer]",
-- 	nvim_lsp = "[LSP]",
-- 	nvim_lua = "[Lua]",
-- 	cmp_tabnine = "[TN]",
-- 	path = "[Path]",
-- }
-- 
-- local lspkind = require("lspkind")
-- 
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			-- For `vsnip` user.
-- 			-- vim.fn["vsnip#anonymous"](args.body)
-- 
-- 			-- For `luasnip` user.
-- 			require("luasnip").lsp_expand(args.body)
-- 
-- 			-- For `ultisnips` user.
-- 			-- vim.fn["UltiSnips#Anon"](args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
--         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 		["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-d>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 	}),
-- 
-- 	formatting = {
-- 		format = function(entry, vim_item)
-- 			vim_item.kind = lspkind.presets.default[vim_item.kind]
-- 			local menu = source_mapping[entry.source.name]
-- 			if entry.source.name == "cmp_tabnine" then
-- 				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
-- 					menu = entry.completion_item.data.detail .. " " .. menu
-- 				end
-- 				vim_item.kind = ""
-- 			end
-- 			vim_item.menu = menu
-- 			return vim_item
-- 		end,
-- 	},
-- 
-- 	sources = {
-- 		-- tabnine completion? yayaya
-- 		{ name = "cmp_tabnine" },
-- 
-- 		{ name = "nvim_lsp" },
-- 		-- For luasnip user.
-- 		{ name = "luasnip" },
-- 		{ name = "buffer" },
-- 	},
-- })
-- 
-- 
-- 
-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
-- 	max_lines = 1000;
-- 	max_num_results = 20;
-- 	sort = true;
-- 	run_on_every_keystroke = true;
-- 	snippet_placeholder = '..';
-- 	ignored_file_types = { -- default is not to ignore
-- 		-- uncomment to ignore in lua:
-- 		-- lua = true
-- 	};
-- 	show_prediction_strength = false;
-- })

local custom_on_attach =  function()
    nnoremap("<Leader>gd", function() vim.lsp.buf.definition() end)
    nnoremap("<leader>gr", function() vim.lsp.buf.references() end)
    nnoremap("<Leader>gi", function() vim.lsp.buf.implementation() end)
    nnoremap("<Leader>ca", function() vim.lsp.buf.code_action() end)
    nnoremap("<Leader>rn", function() vim.lsp.buf.rename() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
    -- nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    -- nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
    nnoremap("[d", function() vim.diagnostic.goto_next() end)
    nnoremap("<F2>", function() vim.diagnostic.goto_next() end)
    nnoremap("]d", function() vim.diagnostic.goto_prev() end)
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("<Leader>gd", function() vim.lsp.buf.definition() end)
			nnoremap("<leader>gr", function() vim.lsp.buf.references() end)
			nnoremap("<Leader>gi", function() vim.lsp.buf.implementation() end)
			nnoremap("<Leader>ca", function() vim.lsp.buf.code_action() end)
			nnoremap("<Leader>rn", function() vim.lsp.buf.rename() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			-- nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			-- nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("<F2>", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require('lspconfig').tsserver.setup{
    on_attach = custom_on_attach,
}
