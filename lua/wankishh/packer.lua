local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("mfussenegger/nvim-jdtls")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use("theHamsta/nvim-dap-virtual-text")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use("David-Kunz/jester")
	use("mxsdev/nvim-dap-vscode-js")
	use("nvim-telescope/telescope-dap.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")

	use("lewis6991/gitsigns.nvim")

	use("ThePrimeagen/harpoon")

	-- Autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/diaglist.nvim")
	use("onsails/lspkind.nvim")
	use("saadparwaiz1/cmp_luasnip")

	--  Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	use("tpope/vim-commentary")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("kdheepak/lazygit.nvim")
	use("doums/darcula")
	use("windwp/nvim-autopairs")
	-- use({
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	requires = {
	-- 		"nvim-tree/nvim-web-devicons", -- optional
	-- 	},
	-- })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("pantharshit00/vim-prisma")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("pangloss/vim-javascript") --  JavaScript support
	use("leafgarland/typescript-vim") --  TypeScript syntax
	use("maxmellon/vim-jsx-pretty") -- JS and JSX syntax
	use("jparise/vim-graphql") -- GraphQL syntax
	use("eslint/eslint")
	use("morhetz/gruvbox")
	use("kyazdani42/nvim-web-devicons") -- Recommended (for coloured icons)
	use("akinsho/bufferline.nvim", { ["tag"] = "v2.*" })

	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("VonHeikemen/lsp-zero.nvim")
	use("github/copilot.vim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/neodev.nvim")

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"folke/tokyonight.nvim",
	})

	use({
		"tpope/vim-surround",
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	use({ "stevearc/dressing.nvim" })
	use({ "MunifTanjim/nui.nvim" })
	use("rcarriga/nvim-notify")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"nvimdev/lspsaga.nvim",
	})

	use({
		"tpope/vim-fugitive",
	})

	use({
		"Joakker/lua-json5",
		run = "./install.sh",
	})
	use({
		"christoomey/vim-tmux-navigator",
	})
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
	})

	use({
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup()
		end,
	})


	use({
		"nvim-telescope/telescope-symbols.nvim",
	})


	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
