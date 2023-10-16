local dap = require("dap")
local dapui = require("dapui")
local debugHelper = require("wankishh.debugHelper")
local which = require("wankishh.helpers.whichKey")
local project = require("wankishh.project")

local parse = require'json5'.parse

require('dap.ext.vscode').json_decode = parse
require("nvim-dap-virtual-text").setup({ enabled = true })

dapui.setup()

local remap = require("wankishh.keymap")
local map = remap.nmap

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js' },
}


dap.listeners.after.event_initialized["dapui_config"] = function()
	require("notify")("Debug Initialized")
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	require("notify")("Debug Terminated")
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	require("notify")("Debug Exited")
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',
                   {text = '🟦', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '⭐️', texthl = '', linehl = '', numhl = ''})

map('<leader>db', function() dap.toggle_breakpoint() end)
map('<leader>dh', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('<leader>do', function() dap.step_over() end)
map('<leader>dc', function() dap.continue() end)
map('<leader>dd', function() dap.restart() end)
map('<leader>dn', function() dap.run_to_cursor() end)
map('<leader>dq', function() dap.terminate() end)
map('<leader>dR', function() dap.clear_breakpoints() end)
map('<leader>de', function() dap.set_exception_breakpoints({"all"}) end)

map('<leader>dA', function() debugHelper.attach() end)
map('<leader>da', ':Telescope dap configurations<CR>')

map('<leader>di', function() require"dap.ui.widgets".hover() end)

map('<leader>d?', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end)

map('<leader>dk', ':lua require"dap".up()<CR>zz')
map('<leader>dj', ':lua require"dap".down()<CR>zz')
map('<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('<leader>du', ':lua require"dapui".toggle()<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')

map('<leader>ds', ':Telescope dap frames<CR>')
map('<leader>dl', function() require("dap.ext.vscode").load_launchjs(project.getProjectDebugVsCodeConfiguration()) end)
map('<leader>dB', ':Telescope dap list_breakpoints<CR>')

which.registerNormal({
	d = {
		name = "Debug",
		b = { "Toggle breakpoint" },
		h = { "Toggle breakpoint with condition" },
		B = { "Telescope breakpoints" },
		R = { "Remove all breakpoints" },
		s = { "Telescope frames" },
		u = { "Toggle Dap UI" },
		r = { "Toggle Dap Console" },
		a = { "Choose debug Configuration" },
		d = { "Restart Last Configuration" },
		A = { "Attach to Nodejs" },
		i = { "Show variable information" },
		n = { "Go back to breakpoint" },
		q = { "Terminate" },
		l = { "Load Launch JSON" },
		c = { "Continue" },
		o = { "Step Over" },
		["?"] = { "Show Windowed UI" },
	},
})

