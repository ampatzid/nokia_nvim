-- MY SETTINGS (for more info about these option enter ":help <option>" in vi)
--
-- Use Vim settings, rather then Vi settings (much better!).
-- This must be first, because it changes other options as a side effect.
vim.g.nocompatible = true

vim.opt.bs = {"indent","eol","start"}  -- allow backspacing over everything in insert mode
vim.opt.ai = true                      -- always set autoindenting on
vim.opt.backup = false                 -- keep a backup file to false since we use undetree plugin
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
                             --  Tell vim to remember certain things when we exit
			                 -- '10  :  marks will be remembered for up to 10 previously edited files
			                 -- "100 :  will save up to 100 lines for each register
                             -- :20  :  up to 20 lines of command-line history will be remembered
                             -- %    :  saves and restores the buffer list

-- """"""""""" Settings for indenting """"""""""""""""""""""""""""""
vim.opt.expandtab = true    --  instead of tabs enter <tabstop> spaces when pressing <TAB> key
vim.opt.shiftwidth = 4      -- use 4 spaces for the autoindenting feature
vim.opt.tabstop = 4         -- use 4 spaces when pressing <TAB> key
vim.opt.smarttab = true     -- at beginning of line delete shiftwidth spaces when pressing <Backspace> key
vim.opt.softtabstop = 4

-- """"""""""" Useful convenience settings """"""""""""""""""""""""""
vim.opt.tags = {"./tags","tags"}  -- always load our tags file change BNG_ROOT in .bashrc and reread .bashrc after changing
vim.opt.tagstack = true           -- use tagstack to navigate forward between jumps with :tag
vim.opt.pastetoggle = "<F10>"     -- pasting multiple lines with mouse leads to strange indentation, press F10 before pasting to prevent it
vim.opt.incsearch = true          -- incremental search (start search while typing)
vim.opt.termguicolors = true

vim.opt.history = 50              -- keep 50 lines of command line history
vim.opt.ruler = true              -- show the cursor position all the time
vim.opt.nu = true                 -- show line number
vim.opt.relativenumber = true     -- show relative numbers
vim.opt.splitright = true         -- splits vertical window to the right
vim.opt.splitbelow = true         -- splits vertical window to the right
vim.opt.wrap = false              -- no line wrapping
vim.opt.mouse = "ar"
vim.opt.clipboard = "unnamedplus"   -- yank now go to clipboard so can be paste everyware
vim.opt.spell = true
vim.opt.complete:append('i')
vim.opt.completeopt={ "menuone","noinsert","noselect","preview"}
vim.opt.shortmess:append('c')
vim.opt.showtabline = 2
vim.opt.listchars.trail = "."
vim.opt.listchars.extends = ">"

vim.opt.updatetime = 50
vim.opt.cmdheight = 2

vim.g.loaded_perl_provider=0

-- Set python provider support for nvim
local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local pythonBinary = os.capture("which python", false)
if file_exists(pythonBinary ) then
   vim.g.python_host_prog = pythonBinary
end

local python3Binary = os.capture("which python3", false)
if file_exists(python3Binary) then
   vim.g.python3_host_prog = python3Binary
end

-- Finding files - Search down into subfolders
vim.opt.path:append '**'


local augroup = vim.api.nvim_create_augroup
local qfGroup = augroup('QuickFix', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd( 'FileType', {
    group = qfGroup,
    pattern = 'qf',
    callback = function ()
      vim.cmd('wincmd J')
    end
  } )
