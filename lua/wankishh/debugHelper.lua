local dap = require("dap")

local function debugJest(testName, filename)
	print("starting " .. testName .. " in " .. filename)
	dap.run({
		type = "node",
		request = "launch",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "-t", testName, "--", filename },
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		console = "integratedTerminal",
		port = 9229,
		name = "Jest",
	})
end

local function attach()
	print("attaching")
	dap.run({
		type = "node",
		request = "attach",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		name = "Attach",
	})
end

local function attachToRemote()
	print("attaching")
	dap.run({
		type = "node",
		request = "attach",
		address = "127.0.0.1",
		port = 9229,
		localRoot = vim.fn.getcwd(),
		remoteRoot = "/home/vcap/app",
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		name = "Attach Remote",
	})
end

local function debugNest()
	dap.run({
		type = "node",
		request = "launch",
		name = "Nest Debug",
		cwd = vim.fn.getcwd(),
		args = {"${workspaceFolder}/src/main.ts"},
		runtimeArgs = {
			"--nolazy",
			"-r",
			"ts-node/register"
		},
		restart = true,
		protocol = "inspector",
		sourceMaps = true,
		port = 9229,
		autoAttachChildProcesses = true,
	})
end

local function debugCreateListingInAutomoto()
	print(vim.fn.getcwd())
	dap.run({
		type = "node",
		request = "launch",
		name = "Node Debug",
		cwd = vim.fn.getcwd(),
		args = {"${workspaceFolder}/createListingBuilder.js"},
		restart = true,
		protocol = "inspector",
		sourceMaps = true,
		port = 9229,
		autoAttachChildProcesses = true,
	})
end


return {
	debugJest = debugJest,
	attach = attach,
	attachToRemote = attachToRemote,
	debugCreateListingInAutomoto = debugCreateListingInAutomoto,
	debugNest = debugNest,
}
