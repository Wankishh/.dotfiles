local nnoremap = require("wankishh.keymap").nnoremap
local inoremap = require("wankishh.keymap").inoremap
local root_pattern = require("lspconfig.util").root_pattern
local javaConfig = require("wankishh.languages.Java")

local servers = {
	tsserver = {},
	jsonls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostic = {
				globals = { "vim" }
			}
		},
	},
	dockerls = {},
	eslint = {
		root_dir = root_pattern(
		".eslintrc.js",
		"node_modules",
		".git"
		),
	},
	html = {},
	sqlls = {},
	prismals = {},
	bashls = {},
	jdtls = javaConfig.settings,
}


local on_attach = function()
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


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

require("mason-lspconfig").setup{
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		local language = {}
		language.capabilities = capabilities
		language.on_attach = on_attach
		language.settings = servers[server_name]

		if(server_name == "jdtls") then
			language.cmd = javaConfig.cmd
		end

		require('lspconfig')[server_name].setup(language)
	end,
}



