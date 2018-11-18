"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:fileencoding=utf-8 ts=2 sts=2 sw=2
scriptencoding  utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" load miv
filetype off
if has('vim_starting')
    set rtp^=~/.vim/miv/miv/
endif

"----------------------------------------------------------------

syntax on
filetype plugin on
filetype indent on


set smartindent smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set hlsearch incsearch
set number relativenumber
set showcmd

set noautowrite
set backspace=
set cryptmethod=blowfish2 " files can NOT be read by vim 7.3 and older.

set cursorline
set display="truncate"
set fillchars=vert:║,fold:┅
" other candidates; ░, ▚

set foldcolumn=0
set foldmethod=marker
" set foldtext : TODO
" set highlight
set history=2000

" IM
set imactivatekey="C-space"
" turn off IM automatically when leaving insert mode
inoremap <ESC> <ESC>:set iminsert=0<CR>

function! ImStatus()
  let is_active = system('fcitx-remote') == 2
  return is_active
endfunction
set imstatusfunc=ImStatus

set imactivatefunc=ImActivate
function! ImActivate(active)
  if a:active
    call system('fcitx-remote -o')
  else
    call system('fcitx-remote -c')
  endif
endfunction
set imactivatefunc=ImActivate

set laststatus=2
set lazyredraw
set nolinebreak

set list listchars=tab:>-
set showmatch matchtime=2
set pyxversion=3 " prefer python 3
set scrolloff=2
set spelllang=en_gb,cjk
set splitbelow splitright
set nostartofline

set statusline=%f\ %m%h%r%y%=%<[%{fnamemodify(getcwd(),':~')}]%02.l/%02.L;c%v\ %5P[%n]
" tags

"- Mapping ------------------------------------------------------
nnoremap <Esc><Esc> :<C-u>silent! nohlsearch<CR>
