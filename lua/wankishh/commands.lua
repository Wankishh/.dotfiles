
local augroup = vim.api.nvim_create_augroup
WankishhGroup = augroup('wankishh', {})


local autocmd = vim.api.nvim_create_autocmd
local user_command = vim.api.nvim_create_user_command


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

local mceFolder = "~/projects/developsoft/mce"

autocmd({"BufWritePre"}, {
    group = WankishhGroup,
    pattern = { mceFolder .. "/*.ts", mceFolder .. "/*.tsx"},
    command = ":EslintFixAll",
})

user_command("MceFlowTest", function(args)
    local arg = vim.fn.input "Args: "
	local collectCoverage = vim.fn.input("Coverage: ", "")
	local extraCmd = ""

	if collectCoverage ~= "" then
		extraCmd = "--collectCoverageFrom="	.. collectCoverage
	end

    vim.cmd("!npm run test:dev -- " .. arg .. extraCmd)
end, {})

user_command("MceEslint", function()
    vim.cmd("!cd " .. mceFolder .. " && npm run check:eslint")
end, {})

user_command("MceBootstrap", function()
    vim.cmd("!cd " .. mceFolder .. " && npm run bootstrap")
end, {})

