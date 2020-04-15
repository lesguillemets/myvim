set guifont=Iosevka\ Term\ Slab\ 11
set guifontwide=Source\ Han\ Sans\ Regular
set bg=dark
colorscheme hybrid
set listchars+=eol:↲

set guioptions=ac

nnoremap <F11> :<C-u>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
