" set nocompatible
" disabled, as it is not just unnnecessary
" but it sets history 20.
" http://lingr.com/room/vim/archives/2013/10/12#message-17037476

""""""""""""""""""""""""""""""""""""""""""
" NeoBundle {{{1
" neobundle itself {{{2
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('$HOME/.vim/bundle'))


NeoBundleFetch 'Shougo/neobundle.vim'
" }}}
"
" Essentials {{{2
NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
"NeoBundle 'git://github.com/Shougo/neocomplete.vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
command! Q QuickRun
" avoid conflict with Quickhl
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/osyo-manga/vim-anzu.git'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)N
nmap # <Plug>(anzu-sharp-with-echo)
NeoBundle 'git://github.com/Yggdroot/indentLine.git'
let g:indentLine_showFirstIndentLevel=1
"let g:indentLine_first_char = '┆'
"let g:indentLine_first_char = '❯'
let g:indentLine_first_char = '║'
"let g:indentLine_first_char = '⧫'
let g:indentLine_char = '❭'
"let g:indentLine_char = '║'
"let g:indentLine_char = '⦙'
"let g:indentLine_char = '⟩'
"NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
let g:indent_guides_guide_size=1
" autocmd Filetype * IndentGuidesDisable  " disabled for normal files
"
NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git' 
" Sadly the license is unknown
" Added my modifications.
"NeoBundle 'git://github.com/lesguillemets/rainbow_parentheses.vim.git'
"NeoBundle 'git://github.com/lesguillemets/paint.vim.git'
NeoBundle 'git://github.com/tpope/vim-characterize.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'git://github.com/t9md/vim-quickhl.git'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" }}}
"
" Language specific plugins {{{2

" haskell {{{
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'git://github.com/vim-scripts/haskell.vim'
NeoBundle 'git://github.com/dag/vim2hs.git'
" disable concealing of "enumerations": commatized lists like
" " deriving clauses and LANGUAGE pragmas,
" " otherwise collapsed into a single ellipsis
let g:haskell_conceal_enumerations=0
"NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
" Not sure
" NeoBundle 'git://github.com/lukerandall/haskellmode-vim'
" }}}

" python {{{
NeoBundle 'git://github.com/hynek/vim-python-pep8-indent.git'
NeoBundle 'git://github.com/vim-scripts/jpythonfold.vim.git'
NeoBundle 'git://github.com/davidhalter/jedi-vim'
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python let b:did_ftplugin = 1
let g:jedi#auto_vim_configuration=0
let g:jedi#rename_command = ""
NeoBundle 'mkomitee/vim-gf-python'
" }}}

" ruby {{{
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
" }}}

" smalltalk {{{
NeoBundle 'st.vim'
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
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/pangloss/vim-javascript.git'
" }}}

" tex / latex {{{
" NeoBundle 'git://github.com/vim-scripts/tex.vim--Brauner.git'
"NeoBundle 'Vim-LaTeX' " not decided yet
" }}}

" markdown {{{
NeoBundle 'git://github.com/jtratner/vim-flavored-markdown.git'
" }}}

" wikipedia {{{
NeoBundle 'wikipedia.vim'
" }}}

" conky {{{
NeoBundle 'git://github.com/smancill/conky-syntax.vim'
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

" prepare for neocomplete {{{3
"did not work " from http://kazy.hatenablog.com/entry/2013/07/18/131118
"did not work autocmd FileType python setlocal omnifunc=jedi#completions
"did not work let g:jedi#auto_vim_configuration = 0
"did not work if !exists('g:neocomplete#force_omni_input_patterns')
"did not work         let g:neocomplete#force_omni_input_patterns = {}
"did not work endif
"did not work let g:neocomplete#force_omni_input_patterns.python =
"did not work 	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"}}}
" }}}

" Benri {{{2
NeoBundle 'git://github.com/vim-scripts/CountJump.git'
NeoBundle 'git://github.com/vim-scripts/loremipsum.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
let NERDTreeShowHidden=1
NeoBundle 'git://github.com/deris/columnjump.git'
nmap <C-k> <Plug>(columnjump-backward)
nmap <C-j> <Plug>(columnjump-forward)
NeoBundle 'git://github.com/itchyny/thumbnail.vim.git'
"}}}

" Appearance {{{2
" this plugin seems very good, although I don't need it for now.
" Thanks jellybeans!
"NeoBundle 'git://github.com/vim-scripts/CSApprox.git'
NeoBundle 'git://github.com/guns/xterm-color-table.vim.git'
" enable when needed.
" NeoBundle 'git://github.com/cocopon/colorswatch.vim.git'
NeoBundle 'git://github.com/terryma/vim-multiple-cursors'
" NeoBundle 'git://github.com/jlanzarotta/colorSchemeExplorer'
" Doesn't seem to work
" Cool, but perhaps too shiny
"NeoBundle 'itchyny/lightline.vim'
" I didn't like too much informathion
"NeoBundle 'git://github.com/thinca/vim-splash'
"let g:splash#path="/Documents/vim/vim_intro.txt"
" from https://gist.github.com/OrgaChem/7630711

"NeoBundle 'ntpeters/vim-better-whitespace'
" }}}

" Trial {{{2
" NeoBundle 'git://github.com/vim-scripts/swap-parameters.git'
" NeoBundle 'git://github.com/kshenoy/vim-signature'
NeoBundle 'git://github.com/tyru/caw.vim.git'
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

NeoBundle 'lyokha/vim-publish-helper'
NeoBundle 'reedes/vim-quotable'
noremap <Space>q :QuotableEducateToggle<CR>
" for that
NeoBundle 'kana/vim-textobj-user'

NeoBundle 'sjl/gundo.vim'
nnoremap <silent> <Space>u :GundoToggle<CR>

NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'lilydjwg/colorizer'
"NeoBundle 'kana/vim-smartinput'

NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'

NeoBundle 'michaeljsmith/vim-indent-object'

NeoBundle 'osyo-manga/vim-hideout'

"NeoBundle 'yuratomo/w3m.vim'
"seems nice, but uses up CPU?
" }}}

" leisure{{{2
NeoBundle 'git://github.com/deris/vim-duzzle.git'
NeoBundle 'thinca/vim-threes'
"NeoBundle 'osyo-manga/vim-sound' => load in typewriter section.
" I think we should use neobundlelazy.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
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
NeoBundle 'romainl/Apprentice'
NeoBundle 'xenomachina/vim-holodark'
"}}}
" }}}


""""""""""""""""""""""""""""""""""""""""""
" general settings {{{

let g:typewritersound = 0
syntax on
filetype plugin on
filetype indent on
set smartindent
set smarttab
set ignorecase
set smartcase
set ruler
set title
set number
set showcmd
set hlsearch
set incsearch
set showmode
set showtabline=1
set backspace=
" Maximum column in which to search for syntax items.
set synmaxcol=200

set wildmode=longest,list,full
set wildmenu

" when :split and :vsplit
set splitbelow
set splitright

" always show
set laststatus=2

" make unvisible chars visible.
set list
set listchars=tab:>-
set conceallevel=1
" supermomonga
"set listchars=tab:\ ,trail:˼,extends:»,precedes:«,nbsp:%

" 256 colours
set t_Co=256

" allow incrementing alphabets.
set nrformats&
set nrformats+=alpha

" folding?
set foldmethod=manual
" set foldmethod=indent
" set foldcolumn=5
" set foldenable

" modeline
set modeline

map Y y$
" let macros go faster (dsummersl/dotvim/_vimrc)
set lazyredraw

" <C-v> and voila!
set virtualedit+=block

" adds < >  as matchpairs in % moving.
" on second thought, no.
"set matchpairs+=<:>

"disable mouse
set mouse=c

" tab modifications
set tabstop=4		"the width of a TAB is set to 4.
					"still it is a \t.
set shiftwidth=4	"indents will have a width of 4.

" }}}

" maps without plugin {{{
"
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap * *N
" comments with # don't remove indentations
inoremap # X#
" set working directory to the current file
nnoremap ,cd :lcd %:p:h <CR>
" Paste from unnamed registar and fix indentation.
" cf: github://gregstallings/vimfiles/vimrc
nmap <Leader>p p`[v`]=
nmap <Leader>P P`[v`]=

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

" moving assistance in insert mode (thanks: http://gg-hogehoge.hatenablog.com/entry/2013/07/26/212223)
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>

" }}}

" resize the devisions if the Vim window size changes
" ( from: https://github.com/joedicastro/dotfiles/blob/master/vim/vimrc)
" au VimResized * exe "normal! \<c-w>="

" preserves folding
" autocmd BufLeave,BufWinLeave ?* call cursor (1,1) " reset cursor position
" autocmd BufWritePost,BufLeave,BufWinLeave ?* mkview
"autocmd BufWinEnter ?* silent loadview

" appearance {{{
" see http://lingr.com/room/vim/archives/2014/03/29#message-18683313 ?
set cursorline
set cursorcolumn
"hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
"colorscheme strawimodo_termvim
" setting the following here works for 256 term
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None
augroup myappearance
	autocmd!
	autocmd ColorScheme * hi ExtraWhiteSpace ctermbg=darkgrey guibg=lightgreen
	autocmd ColorScheme * hi ZenkakuSpace ctermbg=white guibg=white
augroup END

colorscheme jellybeans2
hi Visual term=reverse ctermbg=30
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE " for 256 colors

" http://vimwiki.net/?faq%2F4
match ZenkakuSpace /　/

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
match ExtraWhiteSpace /\(\S\+\)\@<=\s\+$/
" without syn, only the latter works. with it ,nothing works.

hi StatusLine term=NONE ctermbg=black ctermfg=green
set statusline=[%n]\ %f\ %m\ %y\ %<[%{fnamemodify(getcwd(),':~')}]\ %=L[%4l/%4L]\ C[%3c]%5P
" added [%n] and L,C
"set statusline=%<%f%m\ %{getcwd()}\ %=\ %l\/%L\,%=\ %c%V\ \(%P\)

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
	\ ['240',   'LightGray'],
	\ ['247',   'gray'],
	\ ['255',   'LightGray'],
	\ ['240',   'white'],
	\ ['247',   'LightGray'],
	\ ['255',   'gray'],
	\ ['240',   'LightGray'],
	\ ['247',   'white'],
	\ ['255',   'LightGray'],
	\ ['240',   'gray'],
	\ ['247',   'LightGray'],
	\ ['255',   'white'],
	\ ['247',   'LightGray'],
	\ ['240',   'gray'],
	\ ['247',   'LightGray'],
	\ ['None',  'white'],
\ ]
" }}}
" }}}

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
	autocmd CompleteDone * call PlaySE("spacebarpress")
	autocmd BufEnter * call PlaySE("Clamp")
	autocmd InsertCharPre * call PlaySE("key1pressrelease")
	autocmd BufWrite * call PlaySE("Ding")
	autocmd InsertEnter * call PlaySE("Ding")
	autocmd InsertLeave * call PlaySE("Ding")
	autocmd TabEnter * call PlaySE("newline1")
	nnoremap <silent> j j:<C-u>call PlaySE("arrowkeypressrelease")<CR>
	nnoremap <silent> k k:<C-u>call PlaySE("arrowkeypressrelease")<CR>
	nnoremap <silent> l l:<C-u>call PlaySE("arrowkeypressrelease")<CR>
	nnoremap <silent> h h:<C-u>call PlaySE("arrowkeypressrelease")<CR>
endif
" }}}

"______________________________________________
"language specific modifications {{{1

augroup myftsettings
	autocmd!

" python {{{2
autocmd Filetype python setlocal expandtab
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal shiftwidth=4
" autocmd Filetype python IndentGuidesEnable
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
autocmd Filetype haskell setlocal nofoldenable  "disable folding
"autocmd Filetype haskell setlocal conceallevel=0  " no lambda as lambda.
autocmd Filetype haskell nnoremap <buffer> <Space>t :<C-u>GhcModType<CR>
autocmd Filetype haskell nnoremap <buffer><slient> <Space>T :<C-u>GhcModType<CR>:nohlsearch<CR>
autocmd Filetype haskell nnoremap <buffer> <Space>q :<C-u>GhcModCheckAndLintAsync<CR>
" autocmd Filetype haskell IndentGuidesEnable
" }}}

" ruby {{{2
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal tabstop=2
autocmd Filetype ruby setlocal expandtab
" autocmd Filetype ruby IndentGuidesEnable
"autocmd Filetype ruby source /.vim/ftplugin/ruby-matchit.vim
"autocmd Filetype ruby source /.vim/ftplugin/ruby.vim
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

" HTML {{{2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype html setlocal softtabstop=2
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal expandtab
autocmd Filetype html inoremap <buffer> <C-b> <br />
autocmd Filetype html setlocal mps+=<:>
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype html nnoremap j gj
autocmd Filetype html nnoremap k gk
autocmd Filetype html nnoremap gj j
autocmd Filetype html nnoremap gk k
" }}}

" XHTML {{{2
autocmd Filetype xhtml setlocal shiftwidth=2
autocmd Filetype xhtml setlocal softtabstop=2
autocmd Filetype xhtml setlocal tabstop=2
autocmd Filetype xhtml setlocal expandtab
autocmd Filetype xhtml inoremap <buffer> <C-b> <br />
autocmd Filetype xhtml setlocal mps+=<:>
autocmd Filetype xhtml inoremap <buffer> </ </<C-x><C-o>
" }}}

" XML {{{2
autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
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
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk
autocmd Filetype markdown nnoremap gj j
autocmd Filetype markdown nnoremap gk k
"}}}

" vim {{{2
autocmd Filetype vim setlocal foldmethod=marker
" }}}

" mediawiki {{{2
autocmd FileType mediawiki nnoremap <buffer> j gj
autocmd FileType mediawiki nnoremap <buffer> k gk
autocmd Filetype mediawiki inoremap <buffer> </ </<C-x><C-o>
autocmd FileType mediawiki setlocal synmaxcol=-1
"autocmd Filetype mediawiki QuotableEducateOn
" }}}

" TeX {{{2
"autocmd FileType tex,plaintex,latex source $HOME/.vim/ftplugin/tex.vim
"autocmd FileType tex,plaintex,latex map <buffer> <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
"autocmd FileType tex,plaintex,latex map <buffer> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
autocmd FileType tex,plaintex,latex nnoremap j gj
autocmd FileType tex,plaintex,latex nnoremap k gk
autocmd FileType tex,plaintex,latex setlocal conceallevel=0
" }}}

" common lisp {{{2
autocmd FileType lisp setlocal expandtab
"}}}

" quickrun output {{{2
autocmd Filetype quickrun noremap <buffer> j gj
autocmd Filetype quickrun noremap <buffer> k gk
"}}}

" w3m {{{2
autocmd Filetype w3m noremap <buffer> j gj
autocmd Filetype w3m noremap <buffer> k gk
autocmd Filetype w3m IndentLinesToggle
"}}}

augroup END
" }}}

" user functions {{{1
"
"
" :SyntaxInfo to display the syntax info. {{{2
"from http://cohama.hateblo.jp/entry/2013/08/11/020849,
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

" }}}

" Additional settings for Quickrun {{{1
let g:quickrun_config = {}
let g:quickrun_config.ox = {'command' : 'oxl'}
let g:quickrun_config.st = {'command' : 'gst'}
" for processing : from github.com/5t111111/dotfiles/.vimrc
let g:quickrun_config.processing = {
			\	'command': 'processing-java',
			\	'cmdopt': '--run --force',
			\	'exec': '%c --sketch=%s:%h --output=~/Documents/Processing/%o',
			\	'outputter' : 'error:buffer:quickfix',
			\}
" }}}

"_______________________________________________
":::::::::::::::::::::::::::::::::::::
" " NeoComplcache {{{1
" ::::::::::::::::::::::::::::::::::::


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

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

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"<
set completeopt-=preview
"Q: I want to disable preview window.
"
"A:
">
"	set completeopt-=preview
"}}}
