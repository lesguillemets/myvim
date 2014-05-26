"""""""""""""""""""""""""""""""""""""""""
" vim:fileencoding=utf-8 ts=4 sts=4 sw=4
scriptencoding  utf-8
" set nocompatible: when use with vim -u
"_________________________________________
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
set cursorcolumn
set splitbelow splitright

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

set t_Co=256

" allow incrementing alphabets.
set nrformats&
set nrformats+=alpha

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
" }}}
"_________________________________________
"_________________________________________
" maps without plugin {{{

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
map Y y$
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

" better moving ?
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" I know what you wanted to type here..
noremap <F1> <Esc>
inoremap <F1> <Esc>
" ` might be a little too far
noremap <F3> `

" activate shell keeping vim visible.
" http://mattn.kaoriya.net/software/vim/20070510122133.htm
nmap <silent> gsh :set t_te= t_ti= <CR>:sh<CR>:set t_te& t_ti&<CR>

" from: vim-reading #94,
" github:gcmt/dotfiles/vim/.vimrc (@2afa347)
" selects the current line without indentation
nnoremap vv ^vg_

nnoremap ,scr :<C-u>windo set scrollbind<CR>

" edit vimrc from everywhere you go.
nnoremap <Leader>vim :<C-u>ed $MYVIMRC<CR>

" handy with quickrun
command! Pynew call s:quick_new('python', 's')
command! VPynew call s:quick_new('python', 'v')
command! Rubynew call s:quick_new('ruby', 's')
command! VRubynew call s:quick_new('ruby', 'v')
" }}}
"_________________________________________
"_________________________________________
" appearance {{{
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None

augroup myappearance
    autocmd!
    autocmd ColorScheme * hi ExtraWhiteSpace ctermbg=darkgrey guibg=lightgreen
    autocmd ColorScheme * hi ZenkakuSpace ctermbg=white guibg=white
    autocmd VimEnter,WinEnter * call s:syntax_additional()
augroup END

colorscheme jellybeans
let g:jellybeans_background_color_256 = 'NONE'
" although this does not seem to be working...
let g:jellybeans_overrides = {
    \ 'rubyRegexp' : {'ctermfg':'200'},
    \ 'rubyRegexpSpecial' : {'ctermfg':'206'},
    \ 'rubyRegexpDelimiter' : {'ctermfg': '126'},
    \ }

" I expect colorschemes to override these highlight settings.
hi VertSplit ctermfg=144 ctermbg=NONE guifg=lightblue guibg=NONE
hi Visual term=reverse ctermbg=30
hi StatusLine term=NONE ctermbg=black ctermfg=green
set fillchars=vert:║,fold:-
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}]\ %=L[%4l/%4L]\ C[%3c]%5P
" [4] .vimrc [+] [vim] [~/]                      L[ 474/ 981] C[ 65] 45%

" foldtext (from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext) {{{
set foldtext=NeatFoldText()
" }}}

" }}}
"_________________________________________
"_________________________________________
"language specific modifications {{{1

augroup myftsettings
autocmd!

" python {{{2
autocmd FileType python call s:settabs(4)
autocmd FileType python setlocal foldlevel=1
" }}}

"haskell {{{2
autocmd FileType haskell call s:settabs(4)
autocmd FileType haskell setlocal shiftround
autocmd FileType haskell setlocal nojoinspaces
autocmd FileType haskell setlocal foldlevel=0
" }}}

" ruby {{{2
autocmd FileType ruby call s:settabs(2)
" }}}

" C, C++  {{{2
autocmd FileType c,cpp call s:settabs(2)
" }}}

" java {{{2
autocmd FileType java call s:settabs(2)
"}}}

" lua {{{
autocmd FileType lua call s:settabs(2)
" }}}

" HTML, XHTML {{{2
autocmd FileType html,xhtml call s:settabs(2)
autocmd FileType html,xhtml call s:displaymovement()
autocmd FileType html,xhtml setlocal mps+=<:>
autocmd FileType html,xhtml inoremap <buffer> </ </<C-x><C-o>
autocmd FileType html,xhtml inoremap <buffer> <C-b> <br />
" }}}

" XML {{{2
autocmd FileType xml inoremap <buffer> </ </<C-x><C-o>
autocmd FileType xml call s:displaymovement()
"}}}

" javascript {{{2
autocmd FileType javascript call s:settabs(2)
"}}}

" vim {{{2
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim call s:settabs(4)
" view help for the word under cursor.
autocmd FileType vim nnoremap <buffer> K :<C-u>help <C-r>=expand("<cword>")<CR><CR>
" }}}

" markdown {{{2
autocmd FileType markdown call s:settabs(2)
autocmd FileType markdown call s:displaymovement()
"}}}

" mediawiki {{{2
autocmd FileType mediawiki call s:displaymovement()
autocmd FileType mediawiki inoremap <buffer> </ </<C-x><C-o>
autocmd FileType mediawiki setlocal synmaxcol=-1
autocmd FileType mediawiki setlocal foldexpr=
            \getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
autocmd FileType mediawiki setlocal foldmethod=expr
" }}}

" TeX {{{2
"autocmd FileType tex,plaintex,latex map <buffer> <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
"autocmd FileType tex,plaintex,latex map <buffer> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
autocmd FileType tex,plaintex,latex call s:displaymovement()
autocmd FileType tex,plaintex,latex call s:settabs(4)
autocmd FileType tex,plaintex,latex setlocal conceallevel=0
" }}}

" common lisp {{{2
autocmd FileType lisp call s:settabs(2)
"}}}

" quickrun output {{{2
autocmd FileType quickrun call s:displaymovement()
"}}}

augroup END
" }}}
"_________________________________________
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

nnoremap <silent> <Leader>m :call <SID>ToggleRelativeNumber()<CR>
onoremap <expr> m <SID>ToggleRelativeNumber() . <SID>norelativenumber()
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
function! s:settabs(n)
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
            " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
            let w:syntax_additional = [
            \ matchadd('ZenkakuSpace', '　',0),
            \ matchadd('ExtraWhiteSpace', '\(\S\+\)\@<=\s\+$',0),
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
endfunction
" }}}

"}}}
"_________________________________________
