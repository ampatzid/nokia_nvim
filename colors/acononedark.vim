"Maintainer:
"Last Change:
"Version:       1.1
"URL:

set background=dark
if version > 580
    "no guarantees for version 5.8 and below, but this makes it stop complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="acononedark"

hi Normal       guifg=#839496     guibg=#171928

hi DiffDelete   guifg=#171928     guibg=#203040
hi DiffAdd      guibg=#002851
hi DiffChange   guibg=#450303
hi DiffText     guibg=#990909     gui=none

hi diffAdded    guifg=#00bf00     guibg=#1d2c1b
hi diffRemoved  guifg=#e00000     guibg=#2d1c20

hi Cursor       guibg=khaki       guifg=slategrey
hi VertSplit    guibg=#102030     guifg=#102030   gui=none
hi Folded       guifg=#cccccc     guibg=#405060
hi FoldColumn   guibg=grey30      guifg=tan
hi IncSearch    guifg=slategrey   guibg=khaki
hi LineNr       guifg=#556575     guibg=#101322
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=#171928     guibg=#171928
hi Question     guifg=springgreen
hi Search       guibg=#ffff7d     guifg=#000000
hi SpecialKey   guifg=yellowgreen
hi StatusLine   guibg=#102030     guifg=grey70    gui=none
hi StatusLineNC guibg=#203040     guifg=grey50    gui=none
hi Title        guifg=indianred
hi Visual       gui=none          guifg=white     guibg=#D04040
hi WarningMsg   guifg=salmon
hi Directory    guifg=#6699D0
hi SignColumn   guifg=#0000FF     guibg=#203040

if version >= 700 " Vim 7.x specific colors
    hi CursorLine   guifg=NONE    guibg=#101322 gui=NONE
    hi CursorLineNr guibg=NONE    guibg=#101322 gui=NONE
    hi CursorColumn guifg=NONE    guibg=#101322 gui=NONE
    hi MatchParen   guifg=red     guibg=#171928 gui=BOLD
    hi Pmenu        guifg=#f6f3e8 guibg=#152535 gui=NONE
    hi PmenuSel     guifg=#000000 guibg=#cae682 gui=NONE
endif

if version >= 703 " Vim 7.x specific colors
    hi ColorColumn  guifg=#e8ecf0 guibg=#283848
endif

" syntax highlighting groups
hi Comment    guifg=#8090a0   gui=none
hi Constant   guifg=#ff6070   gui=none
hi Identifier guifg=#70d080   gui=none
hi Function   guifg=#61afef   gui=bold
hi Statement  guifg=#6699D0   gui=none
hi PreProc    guifg=indianred gui=none
hi Type       guifg=#8cd0d3   gui=none
hi Special    guifg=#ecad2b   gui=none
hi Delimiter  guifg=#8090a0
hi Number     guifg=#FFFF80
hi Ignore     guifg=grey40    gui=none
hi Todo       guifg=orangered guibg=#171928 gui=none
hi ExtraWhitespace ctermbg=red guibg=red

"vim: sw=4
