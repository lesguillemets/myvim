""""""""""""""""""""""""""""""""""""""""
" vim:fileencoding=utf-8 ts=4 sts=4 sw=4
scriptencoding  utf-8
"_________________________________________
" display startup time on start {{{
" from: https://gist.github.com/thinca/1518874
if has('vim_starting') && has('reltime')
    let s:startuptime = reltime()
    augroup vimrc-startuptime
        autocmd! VimEnter *
        \ redraw!
        \ | echomsg 'startuptime: ' . reltimestr(reltime(s:startuptime))
        \ | unlet s:startuptime
    augroup END
endif
" }}}

filetype off
if has('vim_starting')
    set rtp^=~/.vim/miv/miv/
endif

command! LoadColors echo 'colors loaded'
"_________________________________________
"_________________________________________
" general settings {{{

syntax on
filetype plugin on
filetype indent on
set smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set ignorecase smartcase
set hlsearch incsearch
set ruler
set title
set number
set showcmd
set showmode  " tells us which mode we're in.
set showtabline=1
set laststatus=2 " always show
set backspace=
set synmaxcol=200
set tildeop
set cursorline
set nocursorcolumn
set splitbelow splitright
set history=255
set nostartofline "don't move with <C-f>, etc.
set tags+=codex.tags " haskell

set spelllang=en_gb,cjk
" cjk seems unavailable for some environment: should check later
set helplang=en

set wildmode=longest,list,full
set wildmenu

" make invisible chars visible.
set list
set listchars=tab:>-
" supermomonga
" set listchars=tab:\ ,trail:˼,extends:»,precedes:«,nbsp:%
set conceallevel=1
set matchpairs=(:),{:},[:]
set showmatch
set matchtime=2

set t_Co=256
if has('termguicolors')
    set termguicolors
endif


" what does <C-a> increment?
set nrformats&

" folding?
"set foldmethod=manual
set foldmethod=marker
set foldcolumn=0

set modeline

set lazyredraw
set timeout timeoutlen=1000 ttimeoutlen=10

" <C-v> et voila!
set virtualedit&
set virtualedit+=block

" disable mouse
set mouse=

let g:typewritersound = 0

augroup UserHooks
    autocmd QuickFixCmdPost vimgrep cwindow
augroup END

" }}}
"_________________________________________
"_________________________________________
" maps without plugin {{{

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap Y y$
nnoremap * *N
" comments with # don't remove indentations
inoremap # X<C-h>#
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

" Paste what yanked in C-v mode as a independent block.
nnoremap <silent> ,p :<C-u>call MakeLineWise()<CR>p
nnoremap <silent> ,P :<C-u>call MakeLineWise()<CR>P

" No more 'oops, vim froze? No way!'s
nnoremap ჯ :echoerr "You're using Georgian keyboard!"<CR>
nnoremap კ :echoerr "You're using Georgian keyboard!"<CR>

" let vim ignore mousewheel
" cf. http://vim.1045645.n5.nabble.com/disable-the-mouse-wheel-td1166386.html
noremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
" I don't know, but do real vimmers need this?
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" better moving ?
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" current line at the top - but not the very top
nnoremap zt zt2<C-y>
nnoremap zT zt
nnoremap zb zb2<C-e>
nnoremap zB zb

" from reading_vimrc #128, by Songmu
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

" I know what you wanted to type here..
noremap <F1> <Esc>
inoremap <F1> <Esc>
" ` might be a little too far
noremap <F3> `

" activate shell keeping vim visible.
" http://mattn.kaoriya.net/software/vim/20070510122133.htm
nnoremap <silent> gsh :set t_te= t_ti= <CR>:sh<CR>:set t_te& t_ti&<CR>

" from: vim-reading #94,
" github:gcmt/dotfiles/vim/.vimrc (@2afa347)
" selects the current line without indentation
nnoremap vv ^vg_

nnoremap ,scr :<C-u>windo set scrollbind<CR>

" edit vimrc from everywhere you go.
nnoremap <Leader>vim :<C-u>ed $MYVIMRC<CR>

" stop NUL key from misbehaving
inoremap <C-@> <Nop>

" search for selected text in visual mode
" at the cost of the l register.
" from : http://memo.officebrook.net/20091022.html
" via http://labs.timedia.co.jp/2014/09/learn-about-vim-in-the-workplace.html
vnoremap * "ly:let @/ = @l<CR>n

" handy with quickrun
command! Pynew call s:quick_new('python', 's')
command! VPynew call s:quick_new('python', 'v')

" open current buffer in firefox
function! s:open_in_firefox()
    let l:t_ti_back=&t_ti
    let l:t_te_back=&t_te
    set t_ti= t_te=
    silent! exec "! firefox % &"
    let &t_ti=l:t_ti_back
    let &t_te=l:t_te_back
endfunction
command! Firefox call s:open_in_firefox()
function! s:open_in_chromium()
    let l:t_ti_back=&t_ti
    let l:t_te_back=&t_te
    set t_ti= t_te=
    silent! exec "! chromium-browser % &"
    let &t_ti=l:t_ti_back
    let &t_te=l:t_te_back
endfunction
command! Chromium call s:open_in_chromium()

function! s:setLatin()
    inoremap a- ā
    inoremap e- ē
    inoremap i- ī
    inoremap o- ō
    inoremap u- ū
    inoremap A- Ā
    inoremap E- Ē
    inoremap I- Ī
    inoremap O- Ō
    inoremap U- Ū
endfunction
command! SetLatin call s:setLatin()
" }}}
"_________________________________________
"_________________________________________
" appearance {{{
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None

augroup myappearance
    autocmd!
    autocmd ColorScheme * hi ExtraWhiteSpace ctermbg=darkgrey guibg=darkgrey
    autocmd ColorScheme * hi ZenkakuSpace ctermbg=white guibg=white
    autocmd VimEnter,WinEnter,Bufread * call s:syntax_additional()
    autocmd VimEnter * hi MatchParen ctermfg=7 ctermbg=240 guifg=#aaaaaa guibg=#000000
augroup END

let g:jellybeans_background_color_256 = 'NONE'
let g:jellybeans_background_color = '000000'
" although this does not seem to be working...
let g:jellybeans_overrides = {
    \'CursorLine' : {'ctermbg' : '235'},
    \'rubyRegexp' : {'ctermfg':'200'},
    \'rubyRegexpSpecial' : {'ctermfg':'206'},
    \'rubyRegexpDelimiter' : {'ctermfg': '126'},
    \}
" colorscheme jellybeans
colorscheme hybrid
hi Search term=reverse cterm=underline
hi SpecialKey term=bold ctermfg=237 ctermbg=234 guifg=#444444 guibg=#1c1c1c

set fillchars=vert:║,fold:-
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}][%{GitBranch()}]\ %=[%{&ff}]\ L[%2.l/%2.L]\ C[%2.c]%5P
" [4] .vimrc [+] [vim] [~/] [master]                     [unix]  L[ 474/ 981] C[ 65] 45%
" set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}]\ %=L[%2.l/%2.L]\ C[%2.c]%5P
" [4] .vimrc [+] [vim] [~/]                      L[ 474/ 981] C[ 65] 45%

" I expect colorschemes to override these highlight settings.
function! MyHighlights()
    hi VertSplit ctermfg=144 ctermbg=NONE guifg=lightblue guibg=NONE
    hi Visual term=reverse ctermbg=30 guibg=#004499
    hi CursorLine  ctermbg=235 guibg=#303030
    if (&bg == "dark")
        hi StatusLine cterm=bold ctermbg=235 ctermfg=2 gui=bold guibg=black guifg=#00aa00
        hi StatusLineNC cterm=bold ctermbg=black ctermfg=22 guibg=black guifg=#005500
        hi ColorColumn ctermbg=237 guibg=#224422
    else
        hi StatusLine cterm=bold ctermbg=2 ctermfg=235 gui=bold guibg=white guifg=#00aa00
        hi StatusLineNC cterm=bold ctermbg=white ctermfg=22 guibg=white guifg=#005500
        hi ColorColumn ctermbg=237 guibg=#99ff99
    endif
endfunction
function! TransparentBackground()
    if (&bg == "dark")
        let l:gbg = "black"
    else
        let l:gbg = "white"
    endif
    exec "hi Normal ctermbg=NONE guibg=" . l:gbg
    exec "hi NonText ctermbg=NONE guibg=" . l:gbg
    exec "hi VertSplit ctermbg=NONE guibg=" . l:gbg
    exec "hi LineNr ctermbg=NONE guibg=" . l:gbg
endfunction

augroup HightlightInit
    autocmd!
    autocmd VimEnter * call MyHighlights()
    autocmd VimEnter * call TransparentBackground()
augroup END

" foldtext (from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext) {{{
set foldtext=NeatFoldText()
" }}}

"_________________________________________
" Typewriter {{{

if !exists("g:typewritersound")
    let g:typewritersound = 0
endif
if g:typewritersound
    let s:se_path = "~/Music/typewriter/"
    let s:se_ext = ".wav"
    function! s:change_sound_name(base_name)
        return expand(s:se_path . a:base_name . s:se_ext)
    endfunction
    
    function! PlaySE(name)
        call sound#play_wav(s:change_sound_name(a:name))
    endfunction
    augroup typesound
        autocmd!
        autocmd CompleteDone * call PlaySE("spacebarpress")
        autocmd BufEnter * call PlaySE("Clamp")
        autocmd InsertCharPre * call PlaySE("key1pressrelease")
        autocmd BufWrite * call PlaySE("Ding")
        autocmd InsertEnter * call PlaySE("Ding")
        autocmd InsertLeave * call PlaySE("Ding")
        autocmd TabEnter * call PlaySE("newline1")
    augroup END
    nnoremap <silent> j j:<C-u>call PlaySE("arrowkeypressrelease")<CR>
    nnoremap <silent> k k:<C-u>call PlaySE("arrowkeypressrelease")<CR>
    nnoremap <silent> l l:<C-u>call PlaySE("arrowkeypressrelease")<CR>
    nnoremap <silent> h h:<C-u>call PlaySE("arrowkeypressrelease")<CR>
endif
" }}}
"_________________________________________
"_________________________________________
"language specific modifications {{{1

augroup myftsettings
autocmd!

" python {{{2
autocmd FileType python call SetTabs(4)
autocmd FileType python setlocal foldlevel=1
function! JJPythonFold()
    source $HOME/.vim/syntax/jjpythonfold.vim/syntax/jjpythonfold.vim
endfunction
command! PyFold call JJPythonFold()
" }}}

"haskell {{{2
autocmd FileType haskell call SetTabs(4)
autocmd FileType haskell setlocal shiftround
autocmd FileType haskell setlocal nojoinspaces
autocmd FileType haskell setlocal fdm=marker
autocmd FileType haskell setlocal foldlevel=0
autocmd FileType haskell setlocal cpoptions+=M
" inspired by gregstallings's vimrc, from reading_vimrc #145.
" <C-l> <Space> is hard to type because <C-<Space>> is taken by the os.
autocmd FileType haskell inoremap <buffer> <C-l>  <Space>-> 
autocmd FileType haskell setlocal colorcolumn=79
autocmd FileType haskell command! -buffer DocTest !doctest %
" }}}

" clojure {{{
autocmd FileType clojure call SetTabs(2)
autocmd FileType clojure setlocal nojoinspaces
autocmd FileType clojure setlocal colorcolumn=79
autocmd BufRead *.cljs set makeprg=lein\ cljsbuild\ once
" }}}

autocmd FileType rust inoremap <buffer> <C-l>  <Space>-> 

" ruby {{{2
autocmd FileType ruby call SetTabs(2)
" }}}

" C, C++  {{{2
autocmd FileType c,cpp call SetTabs(2)
" }}}

" golang, just in case {{{2
autocmd FileType go set noexpandtab
autocmd FileType go call SetTabs(4)
" }}}

" java {{{2
autocmd FileType java call SetTabs(2)
"}}}

" lua {{{
autocmd FileType lua call SetTabs(2)
" }}}

" HTML, XHTML {{{2
autocmd FileType html,xhtml call SetTabs(2)
autocmd FileType html,xhtml call s:displaymovement()
autocmd FileType html,xhtml setlocal mps+=<:>
autocmd FileType html,xhtml inoremap <buffer> </ </<C-x><C-o>
autocmd FileType html,xhtml inoremap <buffer> <C-b> <br />
autocmd FileType html,xhtml setlocal synmaxcol=300

autocmd FileType css setlocal noexpandtab
" }}}

" XML {{{2
autocmd FileType xml inoremap <buffer> </ </<C-x><C-o>
autocmd FileType xml call s:displaymovement()
"}}}

" javascript {{{2
autocmd FileType javascript call SetTabs(2)
autocmd FileType javascript nnoremap <buffer> <Space>q :<C-u>JSHint<CR>
autocmd FileType javascript vnoremap <buffer> <Space>q :<C-u>JSHint<CR>
"}}}

" typescript {{{
autocmd FileType typescript call SetTabs(2)
autocmd FileType typescript nmap <buffer> <Space>R <Plug>(TsuquyomiReferences)
" }}}

" vim {{{2
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim call SetTabs(4)
" view help for the word under cursor.
autocmd FileType vim nnoremap <buffer> K :<C-u>help <C-r>=expand("<cword>")<CR><CR>
" and open project pages for plugins with <leader>b.
autocmd FileType vim nnoremap <leader>b :<C-u>call OpenBundle()<CR>
" }}}

" sh {{{2
" use ~/.bash_history for completions
autocmd FileType sh badd ~/.bash_history
" }}}

" markdown {{{2
" I want it to be consistent. ref:#16
autocmd FileType markdown call SetTabs(2)
autocmd FileType markdown call s:displaymovement()
autocmd FileType markdown nnoremap <buffer> ,tim a<C-r>=strftime("%Y-%m-%d %H:%M:%S UTC+9")<CR><Esc>
let g:markdown_fenced_languages = [
\ 'python', 'ruby', 'vim', 'haskell', 'javascript'
\]
"}}}

" {{{ coq
autocmd FileType coq inoremap <buffer> <C-l>  <Space>-> 
autocmd FileType coq setlocal colorcolumn=79
autocmd FileType coq call SetTabs(2)
" }}}

" mediawiki {{{2
autocmd FileType mediawiki call s:displaymovement()
autocmd FileType mediawiki inoremap <buffer> </ </<C-x><C-o>
autocmd FileType mediawiki setlocal synmaxcol=-1
autocmd FileType mediawiki setlocal foldexpr=
            \getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
autocmd FileType mediawiki setlocal foldmethod=expr
"autocmd FileType mediawiki QuotableEducateOn
" }}}

" TeX {{{2
"autocmd FileType tex,plaintex,latex map <buffer> <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
"autocmd FileType tex,plaintex,latex map <buffer> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
" par http://www.reddit.com/r/vim/comments/2pwis9/cn0z01p
let g:tex_flavor="latex"
autocmd FileType tex,plaintex,latex call s:displaymovement()
autocmd FileType tex,plaintex,latex call SetTabs(2)
autocmd FileType tex,plaintex,latex setlocal noexpandtab
autocmd FileType tex,plaintex,latex setlocal conceallevel=0
" hiding $$ ? hiding \textbf? doesn't sound like a good idea at all.
let g:tex_conceal=""
" }}}

" common lisp {{{2
autocmd FileType lisp call SetTabs(2)
"}}}

" csv {{{
autocmd FileType csv setlocal nowrap
" }}}

" quickrun output {{{2
autocmd FileType quickrun call s:displaymovement()
"}}}

" w3m {{{2
autocmd FileType w3m call s:displaymovement()
"}}}

" NERDTree {{{
autocmd FileType nerdtree setlocal shiftwidth=2
autocmd FileType nerdtree setlocal softtabstop=2
autocmd FileType nerdtree setlocal tabstop=2
"}}}

augroup END
" }}}
"_________________________________________
"
" Alias for filetype {{{
augroup FTAlias
    autocmd!
    autocmd FileType js setlocal ft=javascript
    autocmd FileType md setlocal ft=markdown
    autocmd FileType py setlocal ft=python
    autocmd FileType rb setlocal ft=ruby
    autocmd FileType hs setlocal ft=haskell
    autocmd FileType txt setlocal ft=text
augroup END
" }}}
"_________________________________________
" user functions {{{1
"
" :SyntaxInfo to display the syntax info. {{{2
" from http://cohama.hateblo.jp/entry/2013/08/11/020849,
"_______________________________________________
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
"_______________________________________________
" }}}

" dm in normal mode {{{
" (http://lingr.com/room/vim/archives/2014/04/12#message-18780856)
function! s:norelativenumber()
    augroup restore_op
        autocmd!
        autocmd CursorMoved * setlocal norelativenumber
        autocmd CursorMoved * augroup restore_op | execute "autocmd!" | execute "augroup END"
        autocmd CursorHold * setlocal norelativenumber
        autocmd CursorHold * augroup restore_op | execute "autocmd!" | execute "augroup END"
    augroup END
    return ""
endfunction

function! s:ToggleRelativeNumber()
    if &relativenumber
        set norelativenumber
        let &number = exists("b:togglernu_number") ? b:togglernu_number : 1
    else
        let b:togglernu_number = &number
        set relativenumber
    endif
    redraw!  " these two lines required for omap
    
    return ''
endfunction

nnoremap <silent> <Space>r :call <SID>ToggleRelativeNumber()<CR>
onoremap <expr> r <SID>ToggleRelativeNumber() . <SID>norelativenumber()
"}}}

" detect filetype based on shebang {{{
function! s:mydetectft()
    if did_filetype()
        return
    endif
    let shebang = getline(1)
    if shebang =~# '^#!.*python[23]\=$'
        setfiletype python
    elseif shebang =~# '^#!.*ruby[0-9\.]*$'
        setfiletype ruby
    elseif shebang =~# '^#!.*perl[0-9\.]*$'
        setfiletype perl
    endif
    unlet shebang
endfunction
augroup detectft
autocmd!
autocmd BufRead call mydetectft
augroup END
" }}}

" foldtext (from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext) {{{
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
" }}}

" set shiftwidth, softtabstop, tabstop.{{{
function! SetTabs(n)
    let &l:shiftwidth = a:n
    let &l:softtabstop = a:n
    let &l:tabstop = a:n
endfunction
" }}}

" {{{ mapping j as gj, etc.
function! s:displaymovement()
    noremap <buffer> j gj
    noremap <buffer> k gk
    noremap <buffer> gj j
    noremap <buffer> gk k
    noremap <buffer> $ g$
    noremap <buffer> g$ $
    noremap <buffer> ^ g^
    noremap <buffer> g^ ^
endfunction
"}}}

" additional syntax for highlighting spaces. {{{
" adopted from thinca's vimrc
function! s:syntax_additional()
    let preset = exists('w:syntax_additional')
    if &l:list
        if !preset
            " http://vimwiki.net/?faq%2F4
            let w:syntax_additional = [
            \ matchadd('ZenkakuSpace', '　',0),
            \ matchadd('ExtraWhiteSpace', '\S\+\zs\s\+\ze$',0),
            \ ]
        endif
    elseif preset
        for added in w:syntax_additional
            call matchdelete(added)
        endfor
        unlet added
        unlet w:syntax_additional
    endif
endfunction
" }}}

" Makes block-wise register line-wise. {{{
function! MakeLineWise()
    call setreg(v:register, getreg(),'l')
endfunction
" }}}

" split and set ft=whatever. {{{
function! s:quick_new(ft, pos)
    if a:pos ==? 'v'
        vnew
    else
        new
    endif
    let &l:filetype = a:ft
    if a:ft ==? 'python'
        exec 'normal! i#!/usr/bin/env python3'
    elseif a:ft ==? 'ruby'
        exec 'normal! i#!/usr/bin/env ruby'
    endif
endfunction
" }}}


" config for vim-anywhere {{{
" where should we store these settings?
function! ConfigAnywhere()
    set bg=light
    colorscheme pencil
    set guifont=Ubuntu\ Mono\ 12
    set guifontwide=IPAGothic
    set ft=text
endfunction
"}}}
"}}}
"_________________________________________
" Settings to be set in the last part {{{
" set filetype to sh when <C-x><C-e> on terminal
" http://stackoverflow.com/questions/7115324/
if expand('%:t') =~?'bash-fc-\d\+'
    setfiletype sh
endif
" }}}
"_________________________________________
" Additional, extensible settings for plugins {{{

" Quickrun {{{
" watchdogs

" }}}

" emmet {{{
" }}}

" NeoComplete {{{
" copied from neocomplete's readme
" Use neocomplete.

" Define keyword.

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()

" Recommended key-mappings.
" <TAB>: completion.

" Enable heavy omni completion.

set completeopt-=preview
"_________________________________________
"}}}

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
