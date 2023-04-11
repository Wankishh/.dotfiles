local gitsigns = require("gitsigns")
local map = require("wankishh.keymap").nmap
local vmap = require("wankishh.keymap").vnoremap
local nnoremap = require("wankishh.keymap").nnoremap
gitsigns.setup{
	on_attach = function(buf)

		-- // 1. next change
		-- // 2. prev change
		-- // 3. preview

		map("<Leader>gn", function() gitsigns.next_hunk()   end)
		map("<Leader>gN", function() gitsigns.prev_hunk()   end)

		map("<Leader>gp", function() gitsigns.preview_hunk()   end)
		vmap("<Leader>gp", function() gitsigns.preview_hunk()   end)

		map("<Leader>gb", function() gitsigns.blame_line()   end)
		vmap("<Leader>gb", function() gitsigns.blame_line()   end)

		map("<Leader>gr", function() gitsigns.reset_hunk()   end)
		vmap("<Leader>gr", function() gitsigns.reset_hunk()   end)

		-- map('<leader>hr', ':Gitsigns reset_hunk<CR>')
		-- vmap('<leader>hr', ':Gitsigns reset_hunk<CR>')
		-- map('<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
		-- map('<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
		-- map('<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
		-- map('<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
		-- map('<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
		-- map('<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
		-- map('<leader>hd', '<cmd>Gitsigns diffthis<CR>')
		-- map('<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
		-- map('<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

		-- -- Text object
		-- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		-- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}

-- Lazygit
nnoremap("<Leader>gg", function()
    vim.cmd(":LazyGit")
end)
