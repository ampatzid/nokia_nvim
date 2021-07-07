" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" {{{ File Utilities

Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-unimpaired'

" }}}

" {{{ Repo Utilities

Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" }}}

" {{{ Editing Utilities

Plug 'universal-ctags/ctags'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'

" }}}

" {{{ Theme Utilites

Plug 'lifepillar/vim-solarized8'
Plug 'overcache/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" }}}

" {{{

if has("nvim")
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/completion-nvim'
    Plug 'm-pilia/vim-ccls'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'folke/lsp-colors.nvim'
endif

" }}}

" All of your Plugs must be added before the following line
" Initialize plugin system
call plug#end()
" To ignore plugin indent changes, instead use:
" filetype plugin on

