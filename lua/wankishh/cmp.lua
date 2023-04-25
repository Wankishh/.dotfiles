
local cmp = require 'cmp'
local luasnip = require 'luasnip'

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
}


cmp.setup{
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
	sources = {
		{ name = "nvim_lsp", keyword_length = 2 },
		-- For luasnip user.
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
		{ name = 'path'},
	},
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = {'menu', 'abbr', 'kind'},
		-- change sources
	}
}
