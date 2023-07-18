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
	})
end

local function debugFlashFlow()
	print("starting node")
	dap.run({
		type = "node",
		request = "launch",
		name = "Run Flash",
		cwd = vim.fn.getcwd(),
		args = {
			"${workspaceFolder}/__tests__/flow-runner/index.ts",
			"--flow",
			"flash",
			"--mocks",
			"mlp-flash.ts",
			"displayLayer",
			"false"
		},
		runtimeArgs = { "--nolazy", "-r", "ts-node/register" },
		sourceMaps = true,
		autoAttachChildProcesses = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**" },
		env = {
			NODE_ENV = "development",
			DEBUG = "mce*",
			TS_NODE_TRANSPILE_ONLY = true,
			MCEDEBUG = true,
			MCESTANDALONE = true,
		},
	})
end

local function debugNest()
	print("Starting Nest")
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


return {
	debugJest = debugJest,
	attach = attach,
	attachToRemote = attachToRemote,
	debugFlashFlow = debugFlashFlow,
	debugNest = debugNest,
}
