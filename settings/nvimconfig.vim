" {{{ General Settings
" ---------------------------------------------------------------------

" init autocmd
autocmd!

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" MY SETTINGS (for more info about these option enter ":help <option>" in vi)

set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on

""""""""""" Settings for indenting """"""""""""""""""""""""""""""
set expandtab               " instead of tabs enter <tabstop> spaces when pressing <TAB> key
set shiftwidth=4            " use 4 spaces for the autoindenting feature
set tabstop=4               " use 4 spaces when pressing <TAB> key
set smarttab                " at beginning of line delete shiftwidth spaces when pressing <Backspace> key

""""""""""" Useful convenience settings """"""""""""""""""""""""""
set tags                    " always load our tags file change BNG_ROOT in .bashrc and reread .bashrc after changing
set tagstack                " use tagstack to navigate forward between jumps with :tag
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set undodir=$HOME/.local/share/nvim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

set pastetoggle=<F10>       " pasting multiple lines with mouse leads to strange indentation, press F10 before pasting to prevent it
set incsearch               " incremental search (start search while typing)

set viminfo='10,\"100,:20,%,n~/.viminfo
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set nu                  " show line number
set splitbelow
set splitright          " splits vertical window to the right
set nowrap
set mouse=ar
set clipboard=unnamedplus   " yank now go to clipboard so can be paste everyware
set relativenumber
set spell
set complete+=i
set completeopt=menu,menuone,noinsert
set shortmess+=c
set showtabline=2

set list listchars=trail:.,extends:>

" Finding files - Search down into subfolders
set path+=**

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Set python provider support for nvim
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" }}}

" {{{ Visual Settings
" ---------------------------------------------------------------------

if version >= 700 && &term != 'cygwin' && !has('gui_running')
  " In the color terminal, try to use CSApprox.vim plugin or
  " guicolorscheme.vim plugin if possible in order to have consistent
  " colors on different terminals.
  "
  " Uncomment one of the following lines to force 256 or 88 colors if
  " your terminal supports it. Or comment both of them if your terminal
  " supports neither 256 nor 88 colors. Unfortunately, querying the
  " number of supported colors does not work on all terminals.
  set t_Co=256
  "set t_Co=88
  if &t_Co == 256 || &t_Co == 88
    " Check whether to use CSApprox.vim plugin or guicolorscheme.vim plugin.
    if has('gui') &&
      \ (filereadable(expand("$HOME/.vim/plugin/CSApprox.vim")) ||
      \  filereadable(expand("$HOME/vimfiles/plugin/CSApprox.vim")))
      let s:use_CSApprox = 1
    endif
  endif
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
set termguicolors
endif

"-------------OneDark setup----------------
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  set hlsearch
endif

if exists('s:use_CSApprox')
  " Can use the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  colorscheme acononedark
else
  colorscheme acononedark
endif

autocmd FileType qf wincmd J

" }}}

" {{{ Move Utilities
" ---------------------------------------------------------------------

" Move Commands for vim using h,j,k,l keys.
map <silent> <leader>wc :wincmd q<cr>

" Resize window
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terminal mode configuration
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

" Search Maps
nnoremap <C-f> /
inoremap <C-f> <Esc>/
nnoremap <C-S-f> ?
inoremap <C-S-f> <Esc>?

nnoremap <silent> <leader>tn :exe "tabn" nr2char(getchar())<cr>

" }}}

" {{{ Copy Paste Settings
" New Copy/Paste commands using ctrl-p/v/x

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>      "+gP

cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
vnoremap <C-V> <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Move highlighted text up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Use CTRL-B to do what CTRL-V used to do
nnoremap <C-B> <C-V>

" SHIFT-x will close the buffer
nnoremap <S-x> :bd<CR>
" vim: ts=8

" }}}

" {{{ Save files and Terminal Options
" ----------------------------------------

" Use Ctr-S to save
noremap <silent> <C-S>   :update<CR>
vnoremap <silent> <C-S>  <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR><Esc>

" Terminal mode configuration
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

" }}}

" vim: set foldmethod=marker foldlevel=0:
