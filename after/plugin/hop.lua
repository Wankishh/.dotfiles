local which = require("wankishh.helpers.whichKey")
local map = require("wankishh.keymap")
local nnoremap = map.nnoremap
local vnoremap = map.vnoremap
-- hop.nvim
-- require('hop').setup()

-- normal mode (easymotion-like)
-- nnoremap("<Leader><Leader>b", "<cmd>HopWordBC<CR>")
-- nnoremap("<Leader><Leader>w", "<cmd>HopWordAC<CR>")

-- -- visual mode (easymotion-like)
-- vnoremap("<Leader><Leader>b", "<cmd>HopWordBC<CR>")
-- vnoremap("<Leader><Leader>w", "<cmd>HopWordAC<CR>")

-- -- normal mode (sneak-like)
-- nnoremap("f", "<cmd>HopChar1AC<CR>")
-- nnoremap("t", "<cmd>HopChar1BC<CR>")

-- -- visual mode (sneak-like)
-- vnoremap("f", "<cmd>HopChar1AC<CR>")
-- vnoremap("t", "<cmd>HopChar1BC<CR>")

-- which.registerNormal({
-- 	["<Leader>"] = {
-- 		b = "Hop Word Backward",
-- 		w = "Hop Word Forward",
-- 	}
-- })

-- which.registerVisual({
-- 	["<Leader>"] = {
-- 		b = "Hop Word Backward",
-- 		w = "Hop Word Forward",
-- 	}
-- })
