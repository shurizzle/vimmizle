runtime bundle/vim-pathogen/autoload/pathogen.vim

colo    DarkSky
let g:android_sdk_path = '/opt/android-sdk'
set nocp
filetype off
"call pathogen#incubate()
execute pathogen#infect()
filetype on
filetype plugin indent on

let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save

set ofu=syntaxcomplete#Complete
set autoindent
syntax on
set smartindent
"set cindent
set cmdheight=1
set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8
"set guifont="Terminus 8"
set helplang=it
set history=50
set hlsearch
set foldenable
set incsearch
set ruler
set shiftwidth=2
set nowrap
set sidescroll=1
set tildeop
set exrc
set secure
if version >= 700
  set list listchars=tab:\ ·,trail:×,nbsp:%,eol:·,extends:»,precedes:«
else
  set list listchars=tab:\ >,trail:_,nbsp:%,eol:$,extends:>,precedes:<
endif

set showcmd
set mouse=c
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set tabstop=2
set expandtab
set window=53
set nu
set fdm=marker
set statusline=%F%m%r%h%w\ [Type:\ %Y]\ [Lines:\ %L\ @\ %p%%\ {%l;%v}]
set laststatus=2

let g:netrw_http_cmd = "wget -qO"

command -bar Hexmode call ToggleHex()
function ToggleHex()
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    let b:oldft=&ft
    let b:oldbin=&bin
    setlocal binary
    let &ft="xxd"
    let b:editHex=1
    %!xxd
  else
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    let b:editHex=0
    %!xxd -r
  endif
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

nnoremap <F3> :NumbersToggle<CR>
nnoremap <C-x> :Hexmode<CR>
inoremap <C-x> <Esc>:Hexmode<CR>
vnoremap <C-x> :<C-U>Hexmode<CR>
map <S-t> :digraph<CR>
silent map <Leader>pe :w<CR>:!perl %<CR>
map \c    :!irb -r %<CR>

map t :tabnew<CR>
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

"Activate NERDTree
map N :NERDTreeToggle<CR>
if $VIM_NERDTREE != '' && $VIM_NERDTREE != '0' && $VIM_NERDTREE != 'false'
  au VimEnter * :NERDTreeToggle
endif

"Lightline
if !has('gui_running')
  set t_Co=256
endif
set nocompatible
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }


"Syntastic
let g:syntastic_c_checker           = "clang"
let g:syntastic_c_compiler_options  = "-std=c11"

let g:syntastic_cpp_checker           = "clang"
let g:syntastic_cpp_compiler_options  = "-std=c++11"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['elixir'] }

"YouCompleteMe
let g:ycm_allow_changing_updatetime = 1
let g:ycm_global_ycm_extra_conf     = $HOME . '/.vim/ycm.py'
let g:ycm_key_invoke_completion     = '<Leader><Leader><Tab>'

let g:ycm_key_select_completion     = '<Tab>'

set complete-=preview

"android-vim
set tags+=/home/shura/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

"print a \t
map <C-m> :.!echo -e \\t<CR>
"Copy
vmap <silent> <C-c> y:call system("xclip -i", getreg("\""))<CR>
"Paste
nmap <silent> <C-v> :call setreg("\"",system("xclip -o"))<CR>p
imap <silent> <C-v> <C-o>:call setreg("\"",system("xclip -o"))<CR><C-o>p

map <S-s> :VimShell<CR>

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -
autocmd BufReadPost *.doc silent %!antiword "%" -
autocmd BufRead,BufNewFile *.vimp set ft=vim
autocmd BufRead,BufNewFile Emakefile set ft=erlang
autocmd BufRead,BufNewFile rebar.config set ft=erlang
autocmd BufRead,BufNewFile *.herml set ft=haml
autocmd BufRead,BufNewFile *.app.src set ft=erlang
autocmd BufRead,BufNewFile *.app set ft=erlang

if has("autocmd")
  augroup Binary
    au!

    au BufReadPre *.bin,*.hex setlocal binary

    au BufReadPost *
          \ if exists('b:editHex') && b:editHex |
          \   let b:editHex = 0 |
          \ endif

    au BufReadPost *
          \ if &binary | Hexmode | endif

    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
          \ endif

    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

function! MarkupPreview()
  silent update
  let output_name = tempname() . '.html'

  let output = system('~/.vim/bin/github-flavored-markup.rb "'.expand('%:p').'" > "'.output_name.'"')
  if v:shell_error
    call delete(output_name)
    let output = split(output, '\n')[0]
    echohl ErrorMsg
    echomsg output
    echohl NONE
  else
    exec 'silent !(xdg-open "'.output_name.'"; rm "'.output_name.'") &>/dev/null &'
    redraw!
  endif
endfunction
map <Leader>p :call MarkupPreview()<CR>
