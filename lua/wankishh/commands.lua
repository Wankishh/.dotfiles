
local augroup = vim.api.nvim_create_augroup
WankishhGroup = augroup('wankishh', {})

local autocmd = vim.api.nvim_create_autocmd


autocmd({"BufReadPost,FileReadPost"}, {
	group = WankishhGroup,
	pattern = "*",
	command = "normal zR"
})

autocmd({"BufWritePre"}, {
    group = WankishhGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd({"BufLeave"}, {
    group = WankishhGroup,
    pattern = { "*.ts"},
    command = ":wa"
})

autocmd({"BufWritePre"}, {
    group = WankishhGroup,
    pattern = { "*.ts"},
    command = ":EslintFixAll",
})

