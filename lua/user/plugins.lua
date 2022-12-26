local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
  use({ "folke/which-key.nvim" })
  use({ "ms-jpq/coq_nvim", branch = "coq" }) -- coc, but faster
  use("gpanders/editorconfig.nvim") -- Plugin for adjust editorconfig
  use({ "Tastyep/structlog.nvim" }) -- Structured Logging for nvim, using Lua
  use("nacro90/numb.nvim") -- go to line
  use("f-person/git-blame.nvim") -- Git blame in normal mode
  use("windwp/nvim-ts-autotag") -- auto close tag
  use("p00f/nvim-ts-rainbow") -- treesitter more beaultiful
  use("ray-x/lsp_signature.nvim") -- see signature of methods
  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- diagnostic for telescope, lsp
  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }) -- beaultiful comments
  use("HerringtonDarkholme/yats.vim") -- syntax highlight for typescript
  use({ "williamboman/mason.nvim" }) -- manage  external tooling
  use({ "rcarriga/nvim-notify" }) -- notification beaulty
  use({ "phaazon/hop.nvim", branch = "v2", config = function()
      require("hop").setup({keys = "etovxqpdygfblzhckisuran"})
    end
  })
  use("mhinz/vim-startify")
  use({ "nvim-treesitter/playground"})
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  use({ "mfussenegger/nvim-jdtls" })
  use({ "petertriho/nvim-scrollbar" })

  -- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use("lunarvim/darkplus.nvim")
  use("morhetz/gruvbox")
  use("rafamadriz/neon")
  use("bluz71/vim-nightfly-guicolors")
  use("mhartington/oceanic-next")
  use({
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  })
	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use({ "lvimuser/lsp-inlayhints.nvim" }) -- inlay hints

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter"	})
  use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
