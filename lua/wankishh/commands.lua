local augroup = vim.api.nvim_create_augroup
WankishhGroup = augroup("wankishh", {})

local autocmd = vim.api.nvim_create_autocmd
local userCommand = vim.api.nvim_create_user_command
local projectUtils = require("wankishh.project")
local nmap = require("wankishh.keymap").nmap
local which = require("wankishh.helpers.whichKey")

autocmd({ "BufLeave" }, {
	group = WankishhGroup,
	pattern = { "*.ts" },
	command = ":wa",
})


userCommand("W", function()
	vim.cmd(":w")
end, {})

userCommand("Q", function()
	vim.cmd(":q")
end, {})

local function triggerEslintFix()
	vim.cmd(":EslintFixAll")
end

userCommand("Format", function()
	if projectUtils.isMceProject() then
		triggerEslintFix()
	else
		vim.lsp.buf.format({ async = false })
	end
end, {})

nmap("\\f", ":Format<CR>")

-- Fix gitsigns bug
nmap("\\g", ":Gitsigns attach<CR>")


userCommand("ReloadEnvironment", function()
	vim.cmd(":so ~/.config/nvim/init.lua")
end, {})

nmap("\\r", ":ReloadEnvironment<CR>")


userCommand("Lint", function()
	if projectUtils.isMceProject() then
		triggerEslintFix()
	else
		vim.cmd("!npm run lint")
	end
end, {})

nmap("\\l", ":Lint<CR>")


userCommand("FixFold", function()
	vim.cmd(":set foldmethod=syntax")
end, {})

nmap("\\z", ":FixFold<CR>")

which.registerNormal({
	["\\"] = {
		name = "UserCommands",
		f = "Format file",
		l = "Lint file",
		z = "Fix fold",
	},
})
