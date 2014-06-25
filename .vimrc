"""""""""""""""""""""""""""""""""""""""""
" vim:fileencoding=utf-8 ts=4 sts=4 sw=4
scriptencoding  utf-8
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

NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'thinca/vim-quickrun'
" avoid conflict with Quickhl
    command! Q QuickRun

NeoBundle 'Align'

NeoBundle 'osyo-manga/vim-anzu'
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star-with-echo)N
    nmap # <Plug>(anzu-sharp-with-echo)

NeoBundle 'Yggdroot/indentLine'
" settings in the last section.

" When in the mood for a smoother appearance
" NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
" let g:indent_guides_guide_size=1
" augroup iguidessettings
" autocmd!
" autocmd FileType * IndentGuidesDisable  " disabled for normal files
" autocmd FileType python IndentGuidesEnable
" autocmd FileType haskell IndentGuidesEnable
" autocmd FileType ruby IndentGuidesEnable
" augroup END

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
" }}}

" Language specific plugins {{{

" python {{{
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'davidhalter/jedi-vim'
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
    let g:jedi#force_py_version = 3
" NeoBundle 'mkomitee/vim-gf-python' -- not for python3
NeoBundle 'tmhedberg/SimpylFold'
" Which to use?
" NeoBundle 'git://github.com/vim-scripts/jpythonfold.vim.git'
" }}}

" haskell {{{
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'haskell.vim'
NeoBundle 'dag/vim2hs'
    " disable concealing of "enumerations": commatized lists like
    " deriving clauses and LANGUAGE pragmas,
    " otherwise collapsed into a single ellipsis
    let g:haskell_conceal_enumerations=0
" NeoBundle 'travitch/hasksyn'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/ref-hoogle'
" }}}

" {{{ perl
NeoBundle 'c9s/perlomni.vim'
" }}}

" ruby {{{
NeoBundle 'vim-ruby/vim-ruby'
" }}}

" html {{{
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'
" }}}

" css {{{
" NeoBundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
NeoBundle 'JulesWang/css.vim'
"NeoBundle 'hail2u/vim-css3-syntax'
" }}}

" javascript {{{
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle '1995eaton/vim-better-javascript-completion'
" }}}

" tex / latex {{{
" Both seemed too much. Let's reconsider when necessary.
" NeoBundle 'vim-scripts/tex.vim--Brauner.git'
" NeoBundle 'Vim-LaTeX' "
" }}}

" markdown {{{
NeoBundle 'gabrielelana/vim-markdown'
    let g:markdown_include_jekyll_support = 1
    let g:markdown_enable_mappings = 0
"NeoBundle 'jtratner/vim-flavored-markdown'
"NeoBundle 'kannokanno/previm'
"let g:previm_open_cmd="epiphany"
" }}}

" wikipedia {{{
NeoBundle 'wikipedia.vim' " this is not good..
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
NeoBundle 'Colortest'
"NeoBundle 'git://github.com/lesguillemets/Ox-syntax.vim' ", 'dev'

" }}}

" Benri {{{2
NeoBundle 'loremipsum'
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
NeoBundle 'motemen/git-vim'

NeoBundle 'rhysd/committia.vim'
    let g:committia_hooks = {}
    let g:committia_min_window_width = 100
    function! g:committia_hooks.edit_open(e)
        setlocal spell
    endfunction

NeoBundle 'kana/vim-textobj-user'
    NeoBundle 'kana/vim-textobj-indent'
    NeoBundle 'h1mesuke/textobj-wiw'
    NeoBundle 'reedes/vim-textobj-quote'
        augroup textobj_quote
            autocmd!
            autocmd FileType markdown call textobj#quote#init()
            autocmd FileType text call textobj#quote#init()
        augroup END
        nnoremap <Space>q :<C-u>ToggleEducate<CR>
        " q because it was once called vim-quotable

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
NeoBundle 'CountJump'
    " supposed to be good with latex
NeoBundle 'kshenoy/vim-signature'
    " let's use marks more often, really.

" NeoBundle 'vim-scripts/swap-parameters'
    " too specific a command, perhaps?

NeoBundle 'lyokha/vim-publish-helper'

NeoBundle 'reedes/vim-wordy'
NeoBundle 'reedes/vim-pencil'

NeoBundle 'sjl/gundo.vim'
    nnoremap <silent> <Space>u :GundoToggle<CR>

NeoBundle 'mattn/benchvimrc-vim'
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'rking/ag.vim'

NeoBundle 'junegunn/goyo.vim'

NeoBundle 'tyru/open-browser.vim'
    let g:netrw_nogx=1
    nmap <leader>b <Plug>(openbrowser-smart-search)
    vmap <leader>b <Plug>(openbrowser-smart-search)

" NeoBundle 'yuratomo/w3m.vim'
    "seems nice, but uses up CPU?

" willing to configure .. someday.
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'osyo-manga/vim-watchdogs'

"NeoBundle 'FriedSock/smeargle'
"    let g:smeargle_colouring_scheme = ''
"    let g:smeargle_newline_term_colour = 'None'

NeoBundle 'lesguillemets/threejsify.vim.dev'

NeoBundle 'thinca/vim-qfreplace'
" http://blog.supermomonga.com/articles/vim/qfreplace-benri.html
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
NeoBundle 'junegunn/seoul256.vim'
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
NeoBundle 'khaki.vim'
NeoBundle 'tabula.vim'
NeoBundle 'leo256'
NeoBundle 'ftzeng/futora'
NeoBundle 'octol/vombatidae-vim'
NeoBundle 'romainl/Apprentice' " Quite nice.
NeoBundle 'xenomachina/vim-holodark'
NeoBundle 'Risto-Color-Scheme'
NeoBundle 'rdark-terminal'
NeoBundle 'Pychimp/vim-sol'
NeoBundle 'Pychimp/vim-luna'
NeoBundle 'xironix/zarniwoop.vim'
NeoBundle 'JohnnyMudcrab/vim-mudcrab'
NeoBundle 'wolf-dog/sceaduhelm.vim'
NeoBundle 'jordwalke/flatlandia'
NeoBundle 'romainl/Disciple'
NeoBundle 'philananin/seastone.vim'
NeoBundle 'gryftir/gryffin'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'mgutz/vim-colors'
NeoBundle 'toupeira/vim-desertink'
NeoBundle 'endel/vim-github-colorscheme'
"}}}
" }}}
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

let g:typewritersound = 0
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
nnoremap <C-l> $

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
nnoremap <silent> gsh :set t_te= t_ti= <CR>:sh<CR>:set t_te& t_ti&<CR>

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

colorscheme jellybeans2
let g:jellybeans_background_color_256 = 'NONE'
" although this does not seem to be working...
let g:jellybeans_overrides = {
    \'rubyRegexp' : {'ctermfg':'200'},
    \'rubyRegexpSpecial' : {'ctermfg':'206'},
    \'rubyRegexpDelimiter' : {'ctermfg': '126'},
    \}

" I expect colorschemes to override these highlight settings.
hi VertSplit ctermfg=144 ctermbg=NONE guifg=lightblue guibg=NONE
hi Visual term=reverse ctermbg=30
set fillchars=vert:║,fold:-
hi StatusLine term=NONE ctermbg=black ctermfg=green
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}]\ %=L[%2.4l/%2.4L]\ C[%2.3c]%5P
" [4] .vimrc [+] [vim] [~/]                      L[ 474/ 981] C[ 65] 45%
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}][%{GitBranch()}]\ %=L[%2.4l/%2.4L]\ C[%2.3c]%5P
" [4] .vimrc [+] [vim] [~/] [master]                      L[ 474/ 981] C[ 65] 45%

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
    \ "css", "text", "html", "javascript", "quickrun",
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
autocmd FileType python call s:settabs(4)
autocmd FileType python setlocal foldlevel=1
function! JJPythonFold()
    source $HOME/.vim/syntax/jjpythonfold.vim/syntax/jjpythonfold.vim
endfunction
command! PyFold call JJPythonFold()
" }}}

"haskell {{{2
autocmd FileType haskell call s:settabs(4)
autocmd FileType haskell setlocal shiftround
autocmd FileType haskell setlocal nojoinspaces
autocmd FileType haskell setlocal foldlevel=0
autocmd FileType haskell nnoremap <buffer> <Space>t :<C-u>GhcModType<CR>
autocmd FileType haskell nnoremap <buffer><slient> <Space>T :<C-u>GhcModType<CR>:nohlsearch<CR>
autocmd FileType haskell nnoremap <buffer> <Space>q :<C-u>GhcModCheckAndLintAsync<CR>
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
autocmd FileType html,xhtml setlocal synmaxcol=300
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
" and open project pages for plugins with <leader>b.
autocmd FileType vim nnoremap <leader>b :<C-u>call OpenBundle()<CR>
" }}}

" markdown {{{2
autocmd FileType markdown call s:settabs(2)
autocmd FileType markdown call s:displaymovement()
autocmd FileType markdown nnoremap <buffer> ,tim a<C-r>=strftime("%Y-%m-%d %H:%M:%S UTC+9")<CR><Esc>
let g:markdown_fenced_languages = [
\ 'python', 'ruby', 'vim', 'haskell', 'javascript'
\]
"}}}

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

" openbundle! {{{
" TODO : need more comprehensive support.
function! OpenBundle()
    let bundle_name = substitute(
                \ substitute(split(expand("<cWORD>"),',')[0], "[\'\"]", "", 'g'),
                \ "git://", "https://", '')
    call openbrowser#open(neobundle#parser#path(bundle_name)['uri'])
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
"_________________________________________
" Additional, extensible settings for plugins {{{

" Quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config.ox = {'command' : 'autoox.sh'}
let g:quickrun_config.st = {'command' : 'gst'}
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
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
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
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
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
    let g:jedi#completions_enabled = 0
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
endfunction

augroup IndentLineGroup
    autocmd!
    autocmd Filetype * call s:setIndentLine()
augroup END
" }}}
"_________________________________________
