local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mfussenegger/nvim-jdtls'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

	use 'theHamsta/nvim-dap-virtual-text'
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"}
		}
	}
	use 'David-Kunz/jester'
	use 'mxsdev/nvim-dap-vscode-js'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'

    use 'lewis6991/gitsigns.nvim'

    use ("ThePrimeagen/harpoon")
    use ("nvim-treesitter/nvim-treesitter", { ['do']= ":TSUpdate"})

    -- Autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/diaglist.nvim'
    use 'onsails/lspkind.nvim'
    use 'saadparwaiz1/cmp_luasnip'

    --  Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'tpope/vim-commentary'
    use 'thaerkh/vim-workspace'
    use 'xuyuanp/nerdtree-git-plugin'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'doums/darcula'
    use 'windwp/nvim-autopairs'
    use 'vim-airline/vim-airline'
    use 'preservim/nerdtree'
    use 'pantharshit00/vim-prisma'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'pangloss/vim-javascript'    --  JavaScript support
    use 'leafgarland/typescript-vim' --  TypeScript syntax
    use 'maxmellon/vim-jsx-pretty'   -- JS and JSX syntax
    use 'jparise/vim-graphql'        -- GraphQL syntax
    use 'eslint/eslint'
    use 'morhetz/gruvbox'
    use 'kyazdani42/nvim-web-devicons' -- Recommended (for coloured icons)
    use ('akinsho/bufferline.nvim', {['tag']= 'v2.*' })

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'VonHeikemen/lsp-zero.nvim'
    use "github/copilot.vim"


	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
