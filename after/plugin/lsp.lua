local lsp = require("lsp-zero")
local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local javaConfig = require("wankishh.Java")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'eslint',
  'jdtls'
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('jdtls', javaConfig)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local on_attach = lsp.on_attach(function(client, bufnr)
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("gr", function() require("telescope.builtin").lsp_references() end)
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
    inoremap("<c-h>", function() vim.lsp.buf.signature_help() end)
end)

lsp.on_attach(on_attach)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
