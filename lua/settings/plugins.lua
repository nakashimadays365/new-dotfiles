local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end
vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- colorscheme -------------------------------------

	-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	--
	-- use({
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"lalitmee/cobalt2.nvim",
	-- 	requires = "tjdevries/colorbuddy.nvim",
	-- })
	--
	-- Install without configuration
	-- use({ "projekt0n/github-nvim-theme" })
	-- use("ellisonleao/gruvbox.nvim") --gruvbox-like theme
	-- use("Mofiqul/vscode.nvim") -- vscode
	-- use("jacoborus/tender.vim")
	-- use("rebelot/kanagawa.nvim")
	-- use("owickstrom/vim-colors-paramount")
	-- use("nyoom-engineering/oxocarbon.nvim")
	use("craftzdog/solarized-osaka.nvim")
	-- use("scottmckendry/cyberdream.nvim")
	-- use("tomasiser/vim-code-dark")
	-- 	----------------------------------------------------

	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- nvim-cmp source for displaying function signatures with the current parameter emphasized:
	use("hrsh7th/cmp-emoji") -- nvim-cmp source for emojis.
	use("neovim/nvim-lspconfig") -- LSP
	-- use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("nvimtools/none-ls.nvim")
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("weilbith/nvim-lsp-smag") -- It connects LSP and tagfunc.

	use({
		-- "glepnir/lspsaga.nvim",
		"nvimdev/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = {
			{ "kyazdani42/nvim-web-devicons" }, -- File icons
			{
				"nvim-treesitter/nvim-treesitter",
				run = function()
					require("nvim-treesitter.install").update({ with_sync = true })
				end,
			},
			{ "nvim-treesitter/nvim-treesitter-context" }, --[[ sticky scroll ]]
		},
	})
	use("L3MON4D3/LuaSnip")

	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("akinsho/nvim-bufferline.lua")
	-- use 'github/copilot.vim'

	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse

	--use 'darrikonn/vim-gofmt'

	-- comment out
	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})

	use("lukas-reineke/indent-blankline.nvim") -- indent line
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }) -- github diff
	-- for Unity
	-- use{ 'neoclide/coc.nvim', branch = 'release'}

	use("folke/trouble.nvim") -- 定義ジャンプをリッチにしてくれる。

	-- debug and test -> plugins
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use("christoomey/vim-tmux-navigator")
	use("elixir-editors/vim-elixir")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({ "echasnovski/mini.nvim", branch = "stable" })

	-- dashboard "hello world"
	use({
		"nvimdev/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({ "echasnovski/mini.indentscope", branch = "stable" })

	use("RRethy/vim-illuminate")
end)
