local nnoremap = require("wankishh.keymap").nnoremap
local inoremap = require("wankishh.keymap").inoremap
local cmp = require 'cmp'
local luasnip = require 'luasnip'

local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    tsserver = {},
    sumneko_lua = {
	Lua = {
	    workspace = { checkThirdParty = false },
	    telemetry = { enable = false },
	},
    },
    dockerls = {},
}


local on_attach = function(client, bufnr)
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("gr", function() vim.lsp.buf.references() end)
    nnoremap("gi", function() vim.lsp.buf.implementation() end)
    nnoremap("ca", function() vim.lsp.buf.code_action() end)
    nnoremap("rn", function() vim.lsp.buf.rename() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
    nnoremap("g[", function()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float()
    end)
    nnoremap("g]", function()
	vim.diagnostic.goto_prev()
	vim.diagnostic.open_float()
    end)
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end


cmp.setup{
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
    mapping = cmp.mapping.preset.insert {
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = cmp.mapping.confirm {
	    behavior = cmp.ConfirmBehavior.Replace,
	    select = true,
	},
	['<Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item()
	    elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	    else
		fallback()
	    end
	end, { 'i', 's' }),
	['<S-Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_prev_item()
	    elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	    else
		fallback()
	    end
	end, { 'i', 's' }),
    },
    sources = {
	{ name = "nvim_lsp", keyword_length = 3 },
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

require("mason-lspconfig").setup{
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

