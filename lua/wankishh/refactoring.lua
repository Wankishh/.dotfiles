-- load refactoring Telescope extension
require('refactoring').setup({})
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})


-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
vim.api.nvim_set_keymap("n", "<leader>rv", ":lua require('refactoring').debug.print_var({ normal = true })<CR>", { noremap = true })
-- Remap in visual mode will print whatever is in the visual selection
vim.api.nvim_set_keymap("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })

-- Cleanup function: this remap should be made in normal mode
vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })
