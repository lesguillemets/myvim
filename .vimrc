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
set belloff=all
set cryptmethod=blowfish2 " files can NOT be read by vim 7.3 and older.

set cursorline
set display="truncate"
set fileencodings=utf-8,iso-2022-jp-3,euc-jisx0213,cp932,euc-jp,sjis,jis,latin,iso-2022-jp
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
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" FIXME: comflicts with deoplete?
" function! ImStatus()
"   let is_active = system('fcitx-remote') == 2
"   return is_active
" endfunction
" set imstatusfunc=ImStatus

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
" consider using eol :┆, ╱, ??
set showmatch matchtime=2
set pyxversion=3 " prefer python 3
set scrolloff=2
set spelllang=en_gb,cjk
set splitbelow splitright
set nostartofline

set statusline=%f\ %m%h%r%y%=%<[%{fnamemodify(getcwd(),':~')}]%02.l/%02.L;c%v\ %5P[%n]
" tags
if has('termguicolors')
    set termguicolors
endif
set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set tags+=../../../../../../tags,../../../../../../../tags
set t_Co=256
set tildeop
set timeout ttimeout timeoutlen=2000 ttimeoutlen=50
set virtualedit=block
set wildmode=list:longest,full

"- Mapping ------------------------------------------------------
nnoremap <silent> <Esc><Esc> :<C-u> nohlsearch<CR>
nnoremap Y y$

nnoremap * *N
" search for selected text in visual mode
" at the cost of the l register.
" from : http://memo.officebrook.net/20091022.html
" via http://labs.timedia.co.jp/2014/09/learn-about-vim-in-the-workplace.html
vnoremap * "ly:let @/ = @l<CR>n

" set working directory to the current file
nnoremap ,cd :lcd %:p:h <CR>

" when in command line, it feels a little like we're in shell..
cnoremap <C-a> <Home>
cnoremap <C-k> <End><C-u>
" but let's keep handy digraph
cnoremap <C-g> <C-k>

" 'stronger' h and l.
nnoremap <C-h> ^
vnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-l> $

" smash. <C-y> n is sometimes mistaken
nnoremap <C-n> <Nop>
nnoremap <C-p> <Nop>

" Paste and fix indentation.
" cf: github:gregstallings/vimfiles/vimrc
nnoremap <Leader>p p`[v`]=
nnoremap <Leader>P P`[v`]=

" from reading_vimrc #128, by Songmu
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k


" Paste what yanked in C-v mode as a independent block.
function! MakeLineWise()
    call setreg(v:register, getreg(),'l')
endfunction
nnoremap <silent> ,p :<C-u>call MakeLineWise()<CR>p
nnoremap <silent> ,P :<C-u>call MakeLineWise()<CR>P

augroup MyAppearance
  autocmd!
  autocmd ColorScheme * hi ExtraWhiteSpace ctermbg=darkgrey guibg=darkgrey
  autocmd ColorScheme * hi ZenkakuSpace ctermbg=white guibg=white
  autocmd VimEnter,WinEnter,Bufread * call s:syntax_additional()
augroup END
function! s:syntax_additional()
  let l:matches = [
        \ matchadd("ZenkakuSpace", '　', 0),
        \ matchadd('ExtraWhiteSpace', '\s\+$',0),
        \ ]
  return l:matches
endfunction

"
" http://qiita.com/kefir_/items/c725731d33de4d8fb096 {{{
if has("vim_starting") && !has('gui_running') && has('vertsplit')
  function! g:EnableVsplitMode()
    " enable origin mode and left/right margins
    let &t_CS = "y"
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l\e[999H" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6;69h" ], "/dev/tty", "a")
  endfunction

  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>

  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R g:EnableVsplitMode()
  set t_F9=[3;3R
  map <expr> <t_F9> g:EnableVsplitMode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif
" }}}
