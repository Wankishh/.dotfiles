
local augroup = vim.api.nvim_create_augroup
WankishhGroup = augroup('wankishh', {})


local autocmd = vim.api.nvim_create_autocmd
local user_command = vim.api.nvim_create_user_command

local mceFolder = "~/projects/developsoft/mce"

autocmd({"BufWritePre"}, {
    group = WankishhGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd({"BufWritePre"}, {
    group = WankishhGroup,
    pattern = { "*.ts", "*.js", "*.tsx"},
    command = ":EslintFixAll",
})

user_command("MceFlowTest", function(args)
    local arg = vim.fn.input "Args: "
    vim.cmd("!npm run test:dev -- " .. arg)
end, {})

user_command("MceEslint", function()
    vim.cmd("!cd " .. mceFolder .. " && npm run check:eslint")
end, {})

user_command("MceBootstrap", function()
    vim.cmd("!cd " .. mceFolder .. " && npm run bootstrap")
end, {})

user_command("MceBootstrap", function()
    vim.cmd("!cd " .. mceFolder .. " && npm run bootstrap")
end, {})

