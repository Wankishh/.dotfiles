local augroup = vim.api.nvim_create_augroup
WankishhGroup = augroup("wankishh", {})

local autocmd = vim.api.nvim_create_autocmd
local userCommand = vim.api.nvim_create_user_command

-- autocmd({ "BufWinEnter" }, {
-- 	group = WankishhGroup,
-- 	pattern = "*",
-- 	command = "normal zR",
-- })

-- autocmd({ "BufWritePre" }, {
-- 	group = WankishhGroup,
-- 	pattern = "*",
-- 	command = "%s/\\s\\+$//e",
-- })

autocmd({ "BufLeave" }, {
	group = WankishhGroup,
	pattern = { "*.ts" },
	command = ":wa",
})

-- autocmd({ "BufWritePre" }, {
-- 	group = WankishhGroup,
-- 	pattern = { "*.ts" },
-- 	command = ":EslintFixAll",
-- })

userCommand("W", function()
	vim.cmd(":w")
end, {})

userCommand("Q", function()
	vim.cmd(":q")
end, {})

userCommand("Format", function()
	vim.lsp.buf.format({ async = false })
end, {})


userCommand("ReloadEnvironment", function()
	vim.cmd(":so ~/.config/nvim/init.lua")
end, {})

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

userCommand("Lint", function()
	if project_name == "mce" then
		vim.cmd(":EsLintFixAll")
		return
	else
		vim.cmd("!npm run lint")
	end
end, {})
