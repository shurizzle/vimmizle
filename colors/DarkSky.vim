"Author: shura

hi      clear
syntax  on
set     background=dark

if exists("syntax on")
    syntax reset
endif

let g:colors_name = "DarkSky"


hi  Normal      cterm=bold          ctermfg=LightGray   ctermbg=Black
hi  Directory   cterm=bold          ctermfg=LightBlue
hi  ErrorMsg    cterm=standout      ctermfg=White       ctermbg=Red
hi  NonText     cterm=bold          ctermfg=DarkGray
hi  SpecialKey  cterm=bold          ctermfg=Red
hi  LineNr      cterm=bold          ctermfg=DarkBlue
hi  IncSearch   cterm=reverse
hi  Search      cterm=reverse       ctermfg=Yellow      ctermbg=Black
hi  Visual      cterm=bold,reverse
hi  VisualNOS   cterm=bold,underline
hi  MoreMsg     cterm=bold          ctermfg=DarkGreen 
hi  ModeMsg     cterm=bold
hi  Question    cterm=standout      ctermfg=DarkGreen
hi  WarningMsg  cterm=standout      ctermfg=Red
hi  WildMenu    cterm=standout      ctermfg=Black       ctermbg=Yellow
hi  DiffAdd     cterm=bold                              ctermbg=Blue
hi  DiffChange  cterm=bold                              ctermbg=DarkYellow
hi  DiffDelete  cterm=bold                              ctermbg=DarkMagenta
hi  DiffText    cterm=reverse                           ctermbg=DarkRed
hi  StatusLine  cterm=reverse
hi  StatusLineNC cterm=reverse
hi  VertSplit   cterm=reverse
hi  Title       cterm=bold          ctermfg=DarkMagenta
hi  Pmenu       cterm=standout      ctermfg=DarkBlue    ctermbg=Black
hi  PmenuSel    cterm=standout      ctermfg=Black       ctermbg=DarkBlue
hi  PmenuSbar   cterm=standout                          ctermbg=DarkBlue
hi  CursorColumn                                        ctermbg=DarkGray
hi  Folded      cterm=underline     ctermfg=Black       ctermfg=DarkBlue
hi  FoldColumn  cterm=underline     ctermfg=Black       ctermfg=DarkBlue

hi  Comment     cterm=bold          ctermfg=DarkRed
hi  PreProc                         ctermfg=DarkGreen
hi  Constant                        ctermfg=DarkBlue
hi  Type        cterm=underline     ctermfg=DarkBlue
hi  Statement   cterm=bold          ctermfg=Yellow
hi  Identifier                      ctermfg=DarkGreen
hi  Ignore      cterm=bold          ctermfg=DarkGray
hi  Special                         ctermfg=Brown
hi  Error       cterm=reverse       ctermfg=Gray
hi  Todo        cterm=reverse       ctermfg=Black       ctermbg=DarkBlue
hi  Underlined  cterm=underline     ctermfg=DarkBlue
hi  Number                          ctermfg=DarkBlue
hi  String                          ctermfg=DarkBlue

hi  link        Character           String
hi  link        Number              Constant
hi  link        Boolean             Constant
hi  link        Float               Number
hi  link        Function            Identifier
hi  link        Number              Constant
hi  link        Conditional         Statement
hi  link        Repeat              Statement
hi  link        Label               Statement
hi  link        Keyword             Statement
hi  link        Exception           Statement
hi  link        Operator            Statement
hi  link        Include             PreProc
hi  link        Define              PreProc
hi  link        Macro               PreProc
hi  link        PreCondit           PreProc
hi  link        StorageClass        Type
hi  link        Structure           Type
hi  link        Typedef             Type
hi  link        Tag                 Special
hi  link        SpecialChar         Special
hi  link        Delimiter           Normal
hi  link        SpecialComment      Special
hi  link        Debug               Special
