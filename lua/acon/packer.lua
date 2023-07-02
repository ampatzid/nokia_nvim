-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File explores
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ( 'nvim-telescope/telescope-fzy-native.nvim')

  use ( 'scrooloose/nerdtree' )
  use ( 'xuyuanp/nerdtree-git-plugin' )
  use ( 'jistr/vim-nerdtree-tabs' )
  use ( 'MattesGroeger/vim-bookmarks' )
  use ( 'tpope/vim-unimpaired' )

  -- Editing Utilities
  use ( 'universal-ctags/ctags' )
  use ( 'tpope/vim-commentary' )
  use ( 'tpope/vim-surround' )
  use ( 'Raimondi/delimitMate' )
  use ( 'majutsushi/tagbar' )
  use ( 'xolox/vim-misc' )
  use ( 'sheerun/vim-polyglot' )
  use ( 'mbbill/undotree' )

  -- Themes
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ( 'nvim-treesitter/playground' )
  use ( 'nvim-treesitter/nvim-treesitter-context' )

  -- Manage Repo
  use ( 'ThePrimeagen/git-worktree.nvim' )
  use ( 'tpope/vim-fugitive' )
  use ( 'airblade/vim-gitgutter' )

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
          {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
          {'octaltree/cmp-look'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use ( 'nvim-tree/nvim-web-devicons' )
  use ( 'm-pilia/vim-ccls' )
  use ( 'onsails/lspkind-nvim' )
  use ( 'hoob3rt/lualine.nvim' )
  use ( 'nvim-lua/popup.nvim' )
  use ( 'folke/lsp-colors.nvim' )
  use ( 'norcalli/nvim-colorizer.lua' )
  use ( 'romgrk/barbar.nvim' )

end)
