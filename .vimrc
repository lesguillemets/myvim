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


set smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set hlsearch incsearch
set number relativenumber
set showcmd


"- Mapping ------------------------------------------------------
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
