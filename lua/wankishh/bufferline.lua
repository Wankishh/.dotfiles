local remap = require("wankishh.keymap")
local nnoremap = remap.nnoremap

-- Bufferline helpers
nnoremap("<Leader>bw", function()
    vim.cmd(":BufferLineCycleNext")
end)

nnoremap("<Leader>be", function()
    vim.cmd(":BufferLineCyclePrev")
end)
nnoremap("<Leader>bq", function()
    vim.cmd(":BufferLinePickClose")
end)
-- Just for resetting purposes if plugin bugs
nnoremap("<Leader>b1", function()
    vim.cmd(":BufferLineGoToBuffer 1")
end)
