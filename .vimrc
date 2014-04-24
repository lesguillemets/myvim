""""""""""""""""""""""""""""""""""""""""""
"_________________________________________
" NeoBundle {{{1
" NeoBundle itself {{{2
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" Essentials {{{2

NeoBundle 'Shougo/neocomplcache.vim.git'

NeoBundle 'thinca/vim-quickrun.git'
" avoid conflict with Quickhl
    command! Q QuickRun

NeoBundle 'vim-scripts/Align.git'

NeoBundle 'osyo-manga/vim-anzu.git'
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star-with-echo)N
    nmap # <Plug>(anzu-sharp-with-echo)

NeoBundle 'git://github.com/Yggdroot/indentLine.git'
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
                \ 'text', 'quickrun', 'help', 'quickfix'
                \]
" When in the mood for a smoother appearance
" NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
" let g:indent_guides_guide_size=1
" augroup iguidessettings
" autocmd!
" autocmd Filetype * IndentGuidesDisable  " disabled for normal files
" autocmd Filetype python IndentGuidesEnable
" autocmd Filetype haskell IndentGuidesEnable
" autocmd Filetype ruby IndentGuidesEnable
" augroup END

NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git'
" settings are in the appearance section.

NeoBundle 'vim-characterize.git'
NeoBundle 'vim-surround.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 't9md/vim-quickhl.git'
    nmap <Space>m <Plug>(quickhl-manual-this)
    xmap <Space>m <Plug>(quickhl-manual-this)
    nmap <Space>M <Plug>(quickhl-manual-reset)
    xmap <Space>M <Plug>(quickhl-manual-reset)
" }}}

" Language specific plugins {{{

" python {{{
NeoBundle 'git://github.com/hynek/vim-python-pep8-indent.git'
NeoBundle 'git://github.com/davidhalter/jedi-vim'
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
    let g:jedi#documentation_command = ""
NeoBundle 'mkomitee/vim-gf-python'
NeoBundle 'tmhedberg/SimpylFold'
" Which to use?
" NeoBundle 'git://github.com/vim-scripts/jpythonfold.vim.git'

" }}}

" haskell {{{
NeoBundle 'ujihisa/neco-ghc.git'
NeoBundle 'vim-scripts/haskell.vim'
NeoBundle 'dag/vim2hs.git'
    " disable concealing of "enumerations": commatized lists like
    " deriving clauses and LANGUAGE pragmas,
    " otherwise collapsed into a single ellipsis
    let g:haskell_conceal_enumerations=0
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/ref-hoogle'
" }}}

" {{{ perl
NeoBundle 'c9s/perlomni.vim'
" }}}

" ruby {{{
NeoBundle 'vim-ruby/vim-ruby.git'
" }}}

" html {{{
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'
" }}}

" css {{{
NeoBundle 'JulesWang/css.vim'
NeoBundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
" }}}

" javascript {{{
NeoBundle 'jelera/vim-javascript-syntax.git'
NeoBundle 'pangloss/vim-javascript.git'
" }}}

" tex / latex {{{
" Both seemed too much. Let's reconsider when necessary.
" NeoBundle 'vim-scripts/tex.vim--Brauner.git'
" NeoBundle 'Vim-LaTeX' "
" }}}

" markdown {{{
NeoBundle 'jtratner/vim-flavored-markdown.git'
"NeoBundle 'kannokanno/previm'
"let g:previm_open_cmd="epiphany"
" }}}

" wikipedia {{{
NeoBundle 'wikipedia.vim'
" }}}

" smalltalk {{{
NeoBundle 'st.vim'
" }}}

" conky {{{
NeoBundle 'smancill/conky-syntax.vim'
"}}}

" processing {{{
NeoBundle 'sophacles/vim-processing'
" }}}

" actionscript {{{
NeoBundle 'jeroenbourgois/vim-actionscript'
" }}}

" others
NeoBundle 'git://github.com/vim-scripts/Colortest'
"NeoBundle 'git://github.com/lesguillemets/Ox-syntax.vim.git' ", 'dev'

" }}}

" Benri {{{2
NeoBundle 'vim-scripts/loremipsum'
NeoBundle 'scrooloose/nerdtree'
    let NERDTreeShowHidden=1
NeoBundle 'deris/columnjump'
    " Hey, remember me!
    nmap <C-k> <Plug>(columnjump-backward)
    nmap <C-j> <Plug>(columnjump-forward)
NeoBundle 'tyru/caw.vim'
    nmap <Leader>c <Plug>(caw:I:toggle)
    vmap <Leader>c <Plug>(caw:I:toggle)
NeoBundle 'thinca/vim-ref'
NeoBundle 'osyo-manga/vim-hideout'
"}}}

" Appearance {{{
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'lilydjwg/colorizer'
" NeoBundle 'git://github.com/cocopon/colorswatch.vim.git'
    " enable when needed.
" NeoBundle 'git://github.com/vim-scripts/CSApprox.git'
    " this plugin seems very good, although I don't need it for now.
    " Thanks jellybeans!
" NeoBundle 'git://github.com/jlanzarotta/colorSchemeExplorer'
    " Errors.. why?
" NeoBundle 'itchyny/lightline.vim'
    " Cool, but perhaps too shiny with too many informations for me.
" NeoBundle 'git://github.com/thinca/vim-splash'
    " from https://gist.github.com/OrgaChem/7630711
" NeoBundle 'ntpeters/vim-better-whitespace'
" }}}

" Trial {{{2
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/CountJump'
    " supposed to be good with latex
NeoBundle 'kshenoy/vim-signature'
    " let's use marks more often, really.

" NeoBundle 'vim-scripts/swap-parameters'
    " too specific a command, perhaps?

NeoBundle 'lyokha/vim-publish-helper'

NeoBundle 'kana/vim-textobj-user'
    NeoBundle 'kana/vim-textobj-indent'
    NeoBundle 'h1mesuke/textobj-wiw'
    NeoBundle 'reedes/vim-textobj-quote'
        augroup textobj_quote
            autocmd!
            autocmd Filetype markdown call textobj#quote#init()
            autocmd Filetype text call textobj#quote#init()
        augroup END
        nnoremap <Space>q :<C-u>ToggleEducate<CR>
        " q because it was once called vim-quotable

NeoBundle 'reedes/vim-wordy'
NeoBundle 'reedes/vim-pencil'

NeoBundle 'sjl/gundo.vim'
    nnoremap <silent> <Space>u :GundoToggle<CR>

NeoBundle 'mattn/benchvimrc-vim'
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'rking/ag.vim'

NeoBundle 'junegunn/goyo.vim'

" NeoBundle 'yuratomo/w3m.vim'
    "seems nice, but uses up CPU?

" willing to configure .. someday.
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'osyo-manga/vim-watchdogs'

" }}}

" leisure{{{2
NeoBundle 'deris/vim-duzzle'
NeoBundle 'thinca/vim-threes'
" NeoBundle 'osyo-manga/vim-sound' => load in typewriter section.
" I think we should be using neobundlelazy by now.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'mopp/rogue.vim'
" }}}

"new colorschemes {{{2
NeoBundle 'ataraxer/sapphire256.vim'
NeoBundle 'sk1418/last256'
NeoBundle 'john2x/flatui.vim'
NeoBundle 'thomd/vim-wasabi-colorscheme'
NeoBundle 'csexton/spacemanspiff.vim'
NeoBundle 'atelierbram/vim-colors_atelier-schemes'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'kiudee/greymeans'
NeoBundle 'hail2u/h2u_colorscheme'
NeoBundle 'pocke/funyapoyo.vim'
NeoBundle 'MaxSt/FlatColor'
NeoBundle 'vaibhav276/lego-vim-colorscheme'
NeoBundle 'dbb/vim-gummybears-colorscheme'
NeoBundle 'Wise/darkburn.vim'
NeoBundle 'chmllr/elrodeo-colorscheme'
NeoBundle 'arnau/teaspoon.vim'
NeoBundle 'svjunic/RadicalGoodSpeed.vim'
NeoBundle 'mlp.vim'
NeoBundle 'bluecloud'
NeoBundle 'candy.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'peaksea'
NeoBundle 'tylerball/vim-hypertint'
NeoBundle 'miyakogi/slateblue.vim'
NeoBundle 'bronzehedwick/impactjs-colorscheme'
NeoBundle 'JNRowe/vim-jnrowe'
NeoBundle 'beardedprojamz/vim-colors-blayden'
NeoBundle 'ercolanelli-leo/candyVirus'
"NeoBundle 'movax4c00h/cthulhu'
NeoBundle 'vim-scripts/khaki.vim'
NeoBundle 'vim-scripts/tabula.vim'
"NeoBundle 'vim-scripts/darkrobot.vim'
NeoBundle 'vim-scripts/leo256'
NeoBundle 'ftzeng/futora'
NeoBundle 'octol/vombatidae-vim'
NeoBundle 'romainl/Apprentice' " Quite nice.
NeoBundle 'xenomachina/vim-holodark'
NeoBundle 'vim-scripts/Risto-Color-Scheme'
NeoBundle 'rdark-terminal'
"}}}

" prepare for neocomplete {{{
" following are the trail of failure
" from http://kazy.hatenablog.com/entry/2013/07/18/131118
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python =
"\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" }}}
" }}}
"_________________________________________

"_________________________________________
" general settings {{{

syntax on
filetype plugin on
filetype indent on
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set ruler
set title
set number
set showcmd
set hlsearch
set incsearch
set showmode  " tells us which mode we're in.
set showtabline=1
set backspace=
set synmaxcol=200

set cursorline
set cursorcolumn

set wildmode=longest,list,full
set wildmenu

set splitbelow
set splitright

" always show
set laststatus=2

" make unvisible chars visible.
set list
set listchars=tab:>-
" supermomonga
" set listchars=tab:\ ,trail:˼,extends:»,precedes:«,nbsp:%
set conceallevel=1
set matchpairs=(:),{:},[:]

" 256 colours
set t_Co=256

" allow incrementing alphabets.
set nrformats&
set nrformats+=alpha

" folding?
set foldmethod=manual
set foldcolumn=0

" modeline
set modeline

" let macros go faster (dsummersl/dotvim/_vimrc)
set lazyredraw

" <C-v> and voila!
set virtualedit+=block

"disable mouse
set mouse=

let g:typewritersound = 0

" }}}
"_________________________________________

"_________________________________________
" maps without plugin {{{

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
map Y y$
nnoremap * *N
" comments with # don't remove indentations
inoremap # X#
" set working directory to the current file
nnoremap ,cd :lcd %:p:h <CR>

" Paste and fix indentation.
" cf: github:gregstallings/vimfiles/vimrc
nnoremap <Leader>p p`[v`]=
nnoremap <Leader>P P`[v`]=

" Paste what yanked in C-v as a independent block.
nnoremap <silent> ,p :<C-u>call MakeLineWise()<CR>p
nnoremap <silent> ,P :<C-u>call MakeLineWise()<CR>P

" No more 'oops, vim froze? No way!'s
nnoremap ჯ :echoerr "You're using Georgian keyboard!"<CR>
nnoremap კ :echoerr "You're using Georgian keyboard!"<CR>

" let vim ignore mousewheel
" cf. http://vim.1045645.n5.nabble.com/disable-the-mouse-wheel-td1166386.html
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
" I don't know, but do real vimmers need this?
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" better moving?
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-right> <C-w>l

" activate shell keeping vim visible.
" http://mattn.kaoriya.net/software/vim/20070510122133.htm
nmap <silent> gsh :set t_te= t_ti= <CR>:sh<CR>:set t_te& t_ti&<CR>

" from: vim-reading #94,
" github:gcmt/dotfiles/vim/.vimrc (@2afa347)
" selects the current line without indentation
nnoremap vv ^vg_

"edit vimrc from everywhere you go.
nnoremap <Leader>vim :<C-u>ed $MYVIMRC<CR>

" handy with quickrun

function! s:python_quick_new(pos)
    if a:pos ==? 'v'
        vnew
    else
        new
    endif
    set ft=python
endfunction
command! Pynew call s:python_quick_new('s')
command! VPynew call s:python_quick_new('v')

function! s:ruby_quick_new(pos)
    if a:pos ==? 'v'
        vnew
    else
        new
    endif
    set ft=ruby
endfunction
command! Rubynew call s:ruby_quick_new('s')
command! VRubynew call s:ruby_quick_new('v')

" }}}
"_________________________________________

"_________________________________________
" appearance {{{
" see http://lingr.com/room/vim/archives/2014/03/29#message-18683313 ?
" setting the following here works for 256 term
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None

augroup myappearance
    autocmd!
    autocmd ColorScheme * hi ExtraWhiteSpace ctermbg=darkgrey guibg=lightgreen
    autocmd ColorScheme * hi ZenkakuSpace ctermbg=white guibg=white
    autocmd VimEnter,WinEnter * call s:syntax_additional()
augroup END

colorscheme jellybeans2
let g:jellybeans_background_color_256='NONE'
" although this does not seem to be working...
let g:jellybeans_overrides = {
    \'rubyRegexp' : {'ctermfg':'200'},
    \'rubyRegexpSpecial' : {'ctermfg':'206'},
    \'rubyRegexpDelimiter' : {'ctermfg': '126'},
    \}

" I expect colorschemes to override these highlight settings.
hi VertSplit ctermfg=144 ctermbg=NONE guifg=lightblue guibg=NONE
hi Visual term=reverse ctermbg=30
hi StatusLine term=NONE ctermbg=black ctermfg=green
set fillchars=vert:║,fold:-
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}]\ %=L[%4l/%4L]\ C[%3c]%5P


" foldtext (from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext) {{{
set foldtext=NeatFoldText()
" }}}

" Rainbow Parentheses {{{
" au VimEnter * RainbowParenthesesActivate
" au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadSquare
" this doesn't work when using tabs.
" http://stackoverflow.com/questions/17399533/vim-plugin-rainbow-parentheses-using-tab
function! Config_Rainbow()
    call rainbow_parentheses#load(0)
    call rainbow_parentheses#load(1)
    call rainbow_parentheses#load(2)
endfunction

function! Load_Rainbow()
    call rainbow_parentheses#activate()
endfunction

augroup TastetheRainbow
    autocmd!
    autocmd Syntax * call Config_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile * call Load_Rainbow()
augroup END
let g:rbpt_colorpairs = [
    \ ['240',  'LightGray'],
    \ ['247',  'gray'],
    \ ['255',  'LightGray'],
    \ ['240',  'white'],
    \ ['247',  'LightGray'],
    \ ['255',  'gray'],
    \ ['240',  'LightGray'],
    \ ['247',  'white'],
    \ ['255',  'LightGray'],
    \ ['240',  'gray'],
    \ ['247',  'LightGray'],
    \ ['255',  'white'],
    \ ['247',  'LightGray'],
    \ ['240',  'gray'],
    \ ['247',  'LightGray'],
    \ ['None', 'white'],
\ ]
" }}}
" }}}
"_________________________________________

"_________________________________________
" Typewriter {{{

if !exists("g:typewritersound")
    let g:typewritersound = 0
endif
if g:typewritersound
    NeoBundle 'osyo-manga/vim-sound'
    let s:se_path = "~/Music/typewriter/"
    let s:se_ext = ".wav"
    function! s:change_sound_name(base_name)
        return expand(s:se_path . a:base_name . s:se_ext)
    endfunction
    
    function! PlaySE(name)
        call sound#play_wav(s:change_sound_name(a:name))
    endfunction
    augroup typesound
        autocmd !
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
autocmd Filetype python setlocal expandtab
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype python setlocal foldlevel=1
function! JJPythonFold()
    source $HOME/.vim/syntax/jjpythonfold.vim/syntax/jjpythonfold.vim
endfunction
command! PyFold call JJPythonFold()
" }}}

"haskell {{{2
autocmd Filetype haskell setlocal expandtab
autocmd Filetype haskell setlocal softtabstop=4
autocmd Filetype haskell setlocal shiftwidth=4
autocmd Filetype haskell setlocal smarttab
autocmd Filetype haskell setlocal shiftround
autocmd Filetype haskell setlocal nojoinspaces
autocmd Filetype haskell setlocal foldlevel=0
autocmd Filetype haskell nnoremap <buffer> <Space>t :<C-u>GhcModType<CR>
autocmd Filetype haskell nnoremap <buffer><slient> <Space>T :<C-u>GhcModType<CR>:nohlsearch<CR>
autocmd Filetype haskell nnoremap <buffer> <Space>q :<C-u>GhcModCheckAndLintAsync<CR>
" }}}

" ruby {{{2
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal tabstop=2
autocmd Filetype ruby setlocal expandtab
" }}}

" C {{{2
autocmd Filetype c setlocal expandtab
autocmd Filetype c setlocal shiftwidth=2
autocmd Filetype c setlocal softtabstop=2
autocmd Filetype c setlocal tabstop=2
" }}}

" C++ {{{2
autocmd Filetype cpp setlocal expandtab
autocmd Filetype cpp setlocal shiftwidth=2
autocmd Filetype cpp setlocal softtabstop=2
autocmd Filetype cpp setlocal tabstop=2
" }}}

" java {{{2
autocmd Filetype java setlocal expandtab
autocmd Filetype java setlocal softtabstop=4
autocmd Filetype java setlocal shiftwidth=4
"}}}

" lua {{{
autocmd Filetype lua setlocal shiftwidth=2
autocmd Filetype lua setlocal softtabstop=2
autocmd Filetype lua setlocal tabstop=2
autocmd Filetype lua setlocal expandtab
" }}}

" HTML {{{2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype html setlocal softtabstop=2
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal expandtab
autocmd Filetype html inoremap <buffer> <C-b> <br />
autocmd Filetype html setlocal mps+=<:>
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype html call s:displaymovement()
" }}}

" XHTML {{{2
autocmd Filetype xhtml setlocal shiftwidth=2
autocmd Filetype xhtml setlocal softtabstop=2
autocmd Filetype xhtml setlocal tabstop=2
autocmd Filetype xhtml setlocal expandtab
autocmd Filetype xhtml inoremap <buffer> <C-b> <br />
autocmd Filetype xhtml setlocal mps+=<:>
autocmd Filetype xhtml inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype xhtml call s:displaymovement()
" }}}

" XML {{{2
autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype xml call s:displaymovement()
"}}}

" javascript {{{2
autocmd Filetype javascript setlocal expandtab
autocmd Filetype javascript setlocal tabstop=4
autocmd Filetype javascript setlocal softtabstop=4
autocmd Filetype javascript setlocal shiftwidth=4
"}}}

" markdown {{{2
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal shiftwidth=2
autocmd Filetype markdown setlocal softtabstop=2
autocmd Filetype markdown setlocal tabstop=2
autocmd Filetype markdown call s:displaymovement()
"}}}

" vim {{{2
autocmd Filetype vim setlocal foldmethod=marker
autocmd Filetype vim setlocal expandtab
autocmd Filetype vim setlocal softtabstop=4
autocmd Filetype vim setlocal shiftwidth=4
" view help for the word under cursor.
autocmd Filetype vim nnoremap <buffer> K :<C-u>help <C-r>=expand("<cword>")<CR><CR>
" }}}

" mediawiki {{{2
autocmd Filetype mediawiki call s:displaymovement()
autocmd Filetype mediawiki inoremap <buffer> </ </<C-x><C-o>
autocmd FileType mediawiki setlocal synmaxcol=-1
autocmd FileType mediawiki setlocal foldexpr=
    \ getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
autocmd FileType mediawiki setlocal foldmethod=expr
"autocmd Filetype mediawiki QuotableEducateOn
" }}}

" TeX {{{2
"autocmd FileType tex,plaintex,latex source $HOME/.vim/ftplugin/tex.vim
"autocmd FileType tex,plaintex,latex map <buffer> <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
"autocmd FileType tex,plaintex,latex map <buffer> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
autocmd Filetype tex,plaintex,latex call s:displaymovement()
autocmd FileType tex,plaintex,latex setlocal conceallevel=0
" }}}

" common lisp {{{2
autocmd FileType lisp setlocal expandtab
"}}}

" quickrun output {{{2
autocmd Filetype quickrun call s:displaymovement()
"}}}

" w3m {{{2
autocmd Filetype w3m call s:displaymovement()
autocmd Filetype w3m IndentLinesToggle
"}}}

" NERDTree {{{
autocmd Filetype nerdtree setlocal shiftwidth=2
autocmd Filetype nerdtree setlocal softtabstop=2
autocmd Filetype nerdtree setlocal tabstop=2
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
"   vnoremap <silent> m :<C-U>call <SID>ToggleRelativeNumber()<CR>gv
onoremap <expr> m <SID>ToggleRelativeNumber() . <SID>norelativenumber()

"}}}

" detect filetype. When editing cgi, etc. {{{
function! s:mydetectft()
    if did_filetype()
        return
    endif
    let shebang=getline(1)
    if shebang =~# '^#!.*python[23]\=$'
        setfiletype python
    elseif shebang =~# '^#!.*ruby[0-9.]\*$'
        setfiletype ruby
    elseif shebang =~# '^#!.*perl[0-9.]\*$'
        setfiletype perl
    endif
    unlet shebang
endfunction
augroup detectft
autocmd!
autocmd BufRead call mydetectft
augroup end
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

" {{{ mapping j as gj, etc.
function! s:displaymovement()
    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    nnoremap <buffer> gj j
    nnoremap <buffer> gk k
    nnoremap <buffer> $ g$
    nnoremap <buffer> g$ $
    nnoremap <buffer> ^ g^
    nnoremap <buffer> g^ ^
endfunction

"}}}

" additional syntax for highlighting spaces. {{{
" from thinca's vimrc
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

"_________________________________________
"}}}
"_________________________________________

"_________________________________________
" Additional, extensible settings for plugins {{{

" Quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config.ox = {'command' : 'oxl'}
let g:quickrun_config.st = {'command' : 'gst'}
" for processing : from github.com/5t111111/dotfiles/.vimrc
let g:quickrun_config.processing = {
    \    'command': 'processing-java',
    \    'cmdopt': '--run --force',
    \    'exec': '%c --sketch=%s:%h --output=~/Documents/Processing/%o',
    \    'outputter' : 'error:buffer:quickfix',
    \}
" }}}

" NeoComplcache {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
set completeopt-=preview
"}}}
"_________________________________________
"}}}
"_________________________________________
