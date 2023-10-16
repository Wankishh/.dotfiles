local root_pattern = require("lspconfig.util").root_pattern
require("nvim-test").setup()

local root = root_pattern(".git")()

if not root then
	return
end

local command = root .. "/node_modules/.bin/jest"

require("nvim-test.runners.jest"):setup({
	command = command or "", -- a command to run the test runner
	args = { "--collectCoverage=false" }, -- default arguments
	env = { CUSTOM_VAR = "value" }, -- custom environment variables

	file_pattern = "\\v(.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
	find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

	filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
	working_directory = nil, -- set working directory (cwd by default)
})
