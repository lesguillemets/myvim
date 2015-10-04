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
        \   echomsg 'startuptime: ' . reltimestr(reltime(s:startuptime))
        \ | unlet s:startuptime
    augroup END
endif
" }}}

" NeoBundle {{{1
" NeoBundle itself {{{2
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" Essentials {{{2

NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'thinca/vim-quickrun'
" avoid conflict with Quickhl
    command! Q QuickRun

" NeoBundle 'Align'

NeoBundle 'osyo-manga/vim-anzu'
    nmap n <Plug>(anzu-n-with-echo)zv
    nmap N <Plug>(anzu-N-with-echo)zv
    nmap * <Plug>(anzu-star-with-echo)N
    nmap # <Plug>(anzu-sharp-with-echo)

NeoBundle 'Yggdroot/indentLine'
NeoBundle 'kien/rainbow_parentheses.vim'
    " settings are in the appearance section.

NeoBundle 'vim-characterize'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 't9md/vim-quickhl'
    nmap <Space>m <Plug>(quickhl-manual-this)
    xmap <Space>m <Plug>(quickhl-manual-this)
    nmap <Space>M <Plug>(quickhl-manual-reset)
    xmap <Space>M <Plug>(quickhl-manual-reset)
    nmap <Space>J <Plug>(quickhl-cword-toggle)
NeoBundleLazy 'cohama/agit.vim', {'autoload': {'commands':['Agit', 'AgitFile']}}
NeoBundle 'nanotech/jellybeans.vim'
" }}}

" Language specific plugins {{{
" python {{{
NeoBundleLazy 'hynek/vim-python-pep8-indent', {'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload': {'filetypes': ['python']}}
    let g:jedi#auto_initialization = 1
    let g:jedi#popup_on_dot = 0
    let g:jedi#show_call_signatures = 0
    augroup jedigroup
        autocmd!
        autocmd FileType python let b:did_ftplugin = 1
    augroup END
    let g:jedi#auto_vim_configuration=0
    let g:jedi#rename_command = ""
    " <K> conflicts with vim-ref.
    let g:jedi#documentation_command = "<Leader>K"
    let g:jedi#force_py_version = 3
" NeoBundle 'mkomitee/vim-gf-python' -- not for python3
NeoBundleLazy 'tmhedberg/SimpylFold', {'autoload': {'filetypes' : ['python']}}
"NeoBundle 'nvie/vim-flake8' -- less likely to use?
"    autocmd FileType python nnoremap <Space>q :call Flake8()<CR>
" }}}

" haskell {{{
NeoBundleLazy 'ujihisa/neco-ghc', {'autoload' : {'filetypes': ['haskell']}}
    let g:necoghc_enable_detailed_browse = 1
" NeoBundleLazy 'haskell.vim'
NeoBundleLazy 'dag/vim2hs', {'autoload' : {'filetypes': ['haskell']}}
    " disable concealing of "enumerations": commatized lists like
    " deriving clauses and LANGUAGE pragmas,
    " otherwise collapsed into a single ellipsis
    let g:haskell_conceal_enumerations=0
    let g:haskell_conceal_wide=0
" NeoBundleLazy 'travitch/hasksyn'
NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : {'filetypes': ['haskell']}}
NeoBundleLazy 'ujihisa/ref-hoogle', {'autoload' : {'filetypes': ['haskell']}}
" }}}

" html {{{
NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html', 'css']}}
NeoBundleLazy 'mattn/emmet-vim', {'autoload': {'filetypes': ['html', 'css', 'markdown']}}
" }}}

" css {{{
" NeoBundleLazy 'ChrisYip/Better-CSS-Syntax-for-Vim'
NeoBundleLazy 'JulesWang/css.vim', {'autoload': {'filetypes': ['css']}}
"NeoBundleLazy 'hail2u/vim-css3-syntax'
" }}}

" javascript {{{
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript', 'html']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript', 'html']}}
NeoBundleLazy '1995eaton/vim-better-javascript-completion', {'autoload': {'filetypes': ['javascript', 'html']}}
NeoBundleLazy 'Shutnik/jshint2.vim', {'autoload': {'filetypes': ['javascript']}}
" configurations in the language settings
" }}}

" typescript {{{
NeoBundleLazy 'leafgarland/typescript-vim', {'autoload': {'filetypes':['typescript']}}
NeoBundleLazy 'Quramy/tsuquyomi', {'autoload': {'filetypes':['typescript']}}
    let g:tsuquyomi_disable_quickfix=1
" }}}

" c/cpp {{{
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {'autoload': {'filetypes': ['cpp']}}
NeoBundleLazy 'osyo-manga/vim-marching', {'autoload' : {'filetypes': ['cpp']}}
    let g:marching_enable_neocomplete = 1
    let g:marching#clang_command#options = { "cpp" : "-std=gnu++1y" }
" }}}

" coq ?{{{
NeoBundle 'jvoorhis/coq.vim'
NeoBundleLazy 'vim-scripts/CoqIDE', {'autoload' : { 'filetypes' : 'coq'}}
NeoBundleLazy 'eagletmt/coqtop-vim', {'autoload':{
    \ 'filetypes': 'coq', 'commands': 'CoqStart'}}
" }}}

" Benri {{{2
NeoBundleLazy 'loremipsum', {'autoload': {'commands':
    \ ['Loremipsum', 'Loreplace']}}
NeoBundleLazy 'scrooloose/nerdtree', {'autoload': {'commands':['NERDTree']}}
    let NERDTreeShowHidden=1
NeoBundle 'tyru/caw.vim'
    nmap <Leader>c <Plug>(caw:I:toggle)
    vmap <Leader>c <Plug>(caw:I:toggle)
NeoBundle 'thinca/vim-ref'
    let g:ref_pydoc_cmd = "pydoc3"
    if !exists("g:ref_detect_filetype")
        let g:ref_detect_filetype = {}
    endif
    let g:ref_detect_filetype.sh = "man"
NeoBundle 'motemen/git-vim'
    let g:git_no_map_default=1

NeoBundle 'rhysd/committia.vim'
    let g:committia_hooks = {}
    let g:committia_min_window_width = 100
    function! g:committia_hooks.edit_open(e)
        setlocal spell
    endfunction
    function! g:committia_hooks.diff_open(e)
        setlocal nofoldenable
    endfunction

NeoBundle 'tyru/capture.vim'
" http://d.hatena.ne.jp/osyo-manga/20131230/1388413632

"NeoBundle 'rking/ag.vim'
NeoBundle 'lesguillemets/ag.vim', 'prevent_results_leaking_into_terminal'

NeoBundle 'kshenoy/vim-signature'
    " let's use marks more often, really.

NeoBundle 'thinca/vim-qfreplace'
" http://blog.supermomonga.com/articles/vim/qfreplace-benri.html

NeoBundleLazy 'osyo-manga/vim-watchdogs', {'autoload': {'commands': ['WatchdogsRun']}}
NeoBundle 'osyo-manga/shabadou.vim'
augroup WatchDogs
    autocmd FileType c,cpp,vim,python,ruby,perl,sh,go,typescript nnoremap <buffer> <Space>q :<C-u>WatchdogsRun<CR>
augroup END
NeoBundleLazy 'jceb/vim-hier', {'autoload': {'commands': ['WatchdogsRun', 'GhcModCheckAndLintAsync']}}

NeoBundle 'easymotion/vim-easymotion'
    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0
    nmap s <Plug>(easymotion-s2)
    vmap s <Plug>(easymotion-s2)
    omap <Leader>s <Plug>(easymotion-s2)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Space>j <Plug>(easymotion-j)
    map <Space>k <Plug>(easymotion-k)
    map <Space>h <Plug>(easymotion-linebackward)
    map <Space>l <Plug>(easymotion-lineforward)
    map <Leader>w <Plug>(easymotion-bd-wl)
    map <Leader>e <Plug>(easymotion-bd-el)
    augroup VemSettings
        autocmd!
        autocmd ColorScheme * hi EasyMotionTargetMine cterm=bold ctermfg=blue gui=bold guifg=#0044ff
    augroup END
    hi link EasyMotionTarget EasyMotionTargetMine

NeoBundle 'haya14busa/incsearch.vim'
    map / <Plug>(incsearch-forward)
    map ? <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
"}}}

" Appearance {{{
NeoBundle 'guns/xterm-color-table.vim'
NeoBundleLazy 'lilydjwg/colorizer', {'autoload': {
    \ 'filetypes':['css', 'html', 'javascript'], 'commands' : ['ColorHighlight', 'ColorToggle']}}
" }}}

" Trial {{{2
NeoBundleLazy 'mattn/benchvimrc-vim', {'autoload': {'commands': ['BenchVimrc']}}
" NeoBundle 'kana/vim-smartinput'

NeoBundle 'mhinz/vim-signify'

NeoBundleLazy 'rhysd/git-messenger.vim', {'autoload':{'commands':
    \ ['GitMessengerToggle', 'GitMessengerBalloonToggle']}}
" NeoBundle 'rhysd/inazuma.vim'
" http://rhysd.hatenablog.com/entry/2013/12/31/191302

NeoBundle 'h1mesuke/vim-alignta'

NeoBundle 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_follow_symlinks=2
    let g:ctrlp_switch_buffer='Et'


NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" }}}

call neobundle#end()
"}}}
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
    autocmd VimEnter,WinEnter,Bufread * call s:syntax_additional()
augroup END

let g:jellybeans_background_color_256 = 'NONE'
" although this does not seem to be working...
let g:jellybeans_overrides = {
    \'CursorLine' : {'ctermbg' : '235'},
    \'rubyRegexp' : {'ctermfg':'200'},
    \'rubyRegexpSpecial' : {'ctermfg':'206'},
    \'rubyRegexpDelimiter' : {'ctermfg': '126'},
    \}
" colorscheme jellybeans
colorscheme hybrid
hi MatchParen ctermfg=7 ctermbg=240
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
    hi Visual term=reverse ctermbg=30
    hi CursorLine cterm=NONE ctermbg=235
    hi StatusLine cterm=bold ctermbg=235 ctermfg=2 gui=bold guibg=black guifg=#00aa00
    hi StatusLineNC cterm=bold ctermbg=black ctermfg=22
    hi ColorColumn ctermbg=237
endfunction
function! TransparentBackground()
    hi Normal ctermbg=NONE
    hi NonText ctermbg=NONE
    hi VertSplit ctermbg=NONE
    hi LineNr ctermbg=NONE
endfunction

call MyHighlights()
call TransparentBackground()

" foldtext (from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext) {{{
set foldtext=NeatFoldText()
" }}}

" Rainbow Parentheses {{{
" au VimEnter * RainbowParenthesesActivate
" au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadSquare
" this doesn't work when using tabs.
" http://stackoverflow.com/questions/17399533/vim-plugin-rainbow-parentheses-using-tab

let g:rainbow_off_fts = [
    \ "css", "text", "html", "javascript", "quickrun", "haskell", "lua",
    \ "qf", "agit", "agit_diff", "agit_stat", "diff", "gitcommit"
    \ ]

function! Config_Rainbow()
    if (index(g:rainbow_off_fts, &l:filetype) == -1)
        call rainbow_parentheses#load(0)
        call rainbow_parentheses#load(1)
        call rainbow_parentheses#load(2)
    endif
endfunction

function! Load_Rainbow()
    if (index(g:rainbow_off_fts, &l:filetype) == -1)
        call rainbow_parentheses#activate()
    endif
endfunction

augroup TastetheRainbow
    autocmd!
    autocmd Syntax * call Config_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile * call Load_Rainbow()
augroup END
" }}}
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
autocmd FileType haskell setlocal foldlevel=0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setlocal cpoptions+=M
autocmd FileType haskell nnoremap <buffer> <Space>t :<C-u>GhcModType<CR>
autocmd FileType haskell vnoremap <buffer> <Space>t :<C-u>GhcModType<CR>
autocmd FileType haskell nnoremap <buffer><silent> <Space>T :<C-u>GhcModTypeClear<CR>
autocmd FileType haskell nnoremap <buffer> <Space>q :<C-u>GhcModCheckAndLintAsync<CR>
" inspired by gregstallings's vimrc, from reading_vimrc #145.
" <C-l> <Space> is hard to type because <C-<Space>> is taken by the os.
autocmd FileType haskell inoremap <buffer> <C-l>  <Space>-> 
autocmd FileType haskell setlocal colorcolumn=79
autocmd FileType haskell command! -buffer DocTest !doctest %
" }}}

" C, C++  {{{2
autocmd FileType c,cpp call SetTabs(2)
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

" csv {{{
autocmd FileType csv setlocal nowrap
" }}}

" quickrun output {{{2
autocmd FileType quickrun call s:displaymovement()
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
"}}}

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
let g:quickrun_config = {}
let g:quickrun_config.ox = {'command' : 'autoox.sh'}
let g:quickrun_config.st = {'command' : 'gst'}
if executable('ikarus')
    let g:quickrun_config.scheme = {'command' : 'ikarus'}
elseif executable('guile')
    let g:quickrun_config.scheme = {'command' : 'guile'}
endif
let g:quickrun_config['haskell/cabal'] =
    \ {'command' : 'cabal', 'cmdopt' : 'exec runghc'}
let g:quickrun_config.haskell = {'type': 'haskell/cabal'}
" watchdogs

call quickrun#module#register(shabadou#make_quickrun_hook_anim(
    \ "dots", ['.','..','...','....','.....'], 10,),1)
let g:quickrun_config["watchdogs_checker/_"] = {"runner/vimproc/updatetime" : 40, "hook/dots/enable":1,
            \ "hook/echo/enable":1, "hook/echo/output_success": "> No Errors Found."}
let g:quickrun_config["watchdogs_checker/pyflakes3"] = {"command": "pyflakes3", "exec" : '%c %o %s:p', "errorformat": '%f:%l:%m'}
let g:quickrun_config["python/watchdogs_checker"] = { "type" : "watchdogs_checker/pyflakes3" }
let g:quickrun_config["watchdogs_checker/shellcheck"] = {"command" : "shellcheck", "cmdopt" : "-f gcc"}
let g:quickrun_config["sh/watchdogs_checker"] = {"type" : "watchdogs_checker/shellcheck"}
call watchdogs#setup(g:quickrun_config)
" }}}

" emmet {{{
let g:user_emmet_settings = {
\  'markdown' : {
\      'indentation' : '  ',
\      'snippets' : {
\          'syn' : "{% highlight | %}\n|\n{% endhighlight %}",
\       },
\   },
\ }
" }}}

" NeoComplete {{{
" copied from neocomplete's readme
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'sh' : $HOME.'/.bash_history'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-x><C-f> neocomplete#start_manual_complete('file')

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

augroup NeoComp
    autocmd!
    " jedi-vim
    autocmd FileType python setlocal omnifunc=jedi#completions
    "autocmd FileType python setlocal omnifunc=python3complete#Complete
    let g:jedi#completions_enabled = 1
    let g:jedi#show_call_signatures = 0
    "let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=js#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    
    " disable for certain filetypes.
    autocmd FileType text :NeoCompleteLock
    autocmd FileType quickrun :NeoCompleteLock
    autocmd FileType help :NeoCompleteLock
augroup END

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
set completeopt-=preview
"_________________________________________
"}}}
"
" indentLine {{{
let g:indentLine_showFirstIndentLevel=1
let g:indentLine_first_char = '┆'
    " other candidates : '❯', '║', '⧫',
let g:indentLine_char = '⟩'
    " other candidates : '❭', '║', '⦙'
" these settings affect ALL conceal highlighting.
let g:indentLine_color_term=62
let g:indentLine_color_gui='#aabbaa'
let g:indentLine_fileType=[]
let g:indentLine_fileTypeExclude = [
        \ 'text', 'quickrun', 'help', 'quickfix', 'man',
        \ 'w3m',
        \]
" This is a dirty workaround.
" It seems something is hiding indentLine
" when setting ft after opening buffer.
" :enew
" :set ft=py
" (no indent shown)
" :IndentLinesToggle
" (no indent shown)
" :IndentLinesToggle
" (indent shown)
function! s:setIndentLine()
    for excludeft in g:indentLine_fileTypeExclude
        if &ft ==# excludeft
            " execute "IndentLinesDisable"
            return
        endif
    endfor
    execute "IndentLinesEnable"
    execute "IndentLinesReset"
endfunction

augroup IndentLineGroup
    autocmd!
    autocmd Filetype * call s:setIndentLine()
augroup END
" }}}

" {{{ ctrlP
let ctrlp_custom_ignore = {}
let ctrlp_custom_ignore.file = '\v\.(hi|o|out|jsmod)$'
" }}}
"_________________________________________
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
