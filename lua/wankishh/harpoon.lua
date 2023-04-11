local nnoremap = require("wankishh.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>a", function() require("harpoon.mark").toggle_file() end, silent)
nnoremap("<C-Shift-Q>", function() require("harpoon.mark").clear_all() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader>h", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>j", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(4) end, silent)
nnoremap("<leader>;", function() require("harpoon.ui").nav_next() end, silent)
nnoremap("<leader>,", function() require("harpoon.ui").nav_prev() end, silent)

