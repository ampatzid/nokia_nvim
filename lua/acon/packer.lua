-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File explores
  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  -- or                            , tag = '0.1.0',
	  requires = {
        {'nvim-lua/plenary.nvim'},
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("live_grep_args")
    end
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
  use { "catppuccin/nvim", as = "catppuccin" }

  use ( 'stevearc/dressing.nvim' )
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ( 'nvim-treesitter/playground' )
  -- use ( 'nvim-treesitter/nvim-treesitter-context' )

  -- Manage Repo
  use ( 'ThePrimeagen/git-worktree.nvim' )
  use ( 'tpope/vim-fugitive' )
  use { 'lewis6991/gitsigns.nvim' }
  -- use ( 'airblade/vim-gitgutter' )

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

  -- Debugger Support
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use ( 'theHamsta/nvim-dap-virtual-text' )
  use ( 'nvim-telescope/telescope-dap.nvim' )

  -- Utilities
  use ( 'nvim-tree/nvim-web-devicons' )
  use ( 'm-pilia/vim-ccls' )
  use ( 'onsails/lspkind-nvim' )
  use ( 'hoob3rt/lualine.nvim' )
  use ( 'nvim-lua/popup.nvim' )
  use ( 'folke/lsp-colors.nvim' )
  use ( 'norcalli/nvim-colorizer.lua' )
  use ( 'romgrk/barbar.nvim' )

  -- navigation
  use ( 'christoomey/vim-tmux-navigator' )

end)
