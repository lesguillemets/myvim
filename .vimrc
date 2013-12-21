" set nocompatible
" disabled, as it is not just unnnecessary
" but it sets history 20.
" http://lingr.com/room/vim/archives/2013/10/12#message-17037476

""""""""""""""""""""""""""""""""""""""""""
" NeoBundle {{{1
filetype off

if has('vim_starting')
    set runtimepath+=/home/myhome/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))


NeoBundleFetch 'Shougo/neobundle.vim'
" NeoBundle plugins
" NeoBundle 'git://github.com/Shougo/neocomplete.vim.git'
" NeoBundle 'git://github.com/lesguillemets/paint.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/osyo-manga/vim-anzu.git'
"NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'git://github.com/Yggdroot/indentLine.git'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'wikipedia.vim'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/vim-scripts/haskell.vim'
NeoBundle 'git://github.com/dag/vim2hs.git'
NeoBundle 'git://github.com/hynek/vim-python-pep8-indent.git'
" NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git' 
" Sadly the license is unknown
" Added my modifications.
NeoBundle 'git://github.com/lesguillemets/rainbow_parentheses.vim.git'
NeoBundle 'git://github.com/vim-scripts/Colortest'
" this plugin seems very good, although I don't need it for now.
" Thanks jellybeans!
" NeoBundle 'git://github.com/vim-scripts/CSApprox.git'
NeoBundle 'git://github.com/vim-scripts/jpythonfold.vim.git'
NeoBundle 'git://github.com/vim-scripts/CountJump.git'
" NeoBundle 'git://github.com/vim-scripts/tex.vim--Brauner.git'
NeoBundle 'git://github.com/vim-scripts/loremipsum.git'
NeoBundle 'git://github.com/guns/xterm-color-table.vim.git'
NeoBundle 'git://github.com/tpope/vim-characterize.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/jtratner/vim-flavored-markdown.git'
" enable when needed.
" NeoBundle 'git://github.com/cocopon/colorswatch.vim.git'
NeoBundle 'git://github.com/deris/columnjump.git'
nmap <C-k> <Plug>(columnjump-backward)
nmap <C-j> <Plug>(columnjump-forward)
NeoBundle 'git://github.com/deris/vim-duzzle.git'
NeoBundle 'git://github.com/terryma/vim-multiple-cursors'
"NeoBundle 'git://github.com/lesguillemets/Ox-syntax.vim.git' ", 'dev'
"NeoBundle 'git://github.com/vim-scripts/swap-parameters.git'
" NeoBundle 'git://github.com/jlanzarotta/colorSchemeExplorer'
" Doesn't seem to work
" NeoBundle 'git://github.com/kshenoy/vim-signature'
" Not decided yet
" NeoBundle 'Vim-LaTeX'
" Cool, but perhaps too shiny
" NeoBundle 'itchyny/lightline.vim'
" I didn't like too much informathion
NeoBundle 'git://github.com/davidhalter/jedi-vim'
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python let b:did_ftplugin = 1
let g:jedi#auto_vim_configuration=0
" Not sure
" NeoBundle 'git://github.com/lukerandall/haskellmode-vim'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/pangloss/vim-javascript.git'
"NeoBundle 'git://github.com/thinca/vim-splash'
"let g:splash#path="/home/myhome/Documents/vim/vim_intro.txt"
" from https://gist.github.com/OrgaChem/7630711

NeoBundle 'git://github.com/t9md/vim-quickhl.git'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
NeoBundle 'git://github.com/tyru/caw.vim.git'
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
" }}}

"NerdTree
let NERDTreeShowHidden=1

let g:indentLine_showFirstIndentLevel=1
let g:indentLine_first_char = "¿"

""""""""""""""""""""""""""""""""""""""""""
" general settings

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

" 256 colours
set t_Co=256

" folding?
set foldmethod=manual
" set foldmethod=indent
" set foldcolumn=5
" set foldenable

map Y y$

" maps without plugin 
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

nnoremap ¿ :echo "You're using Georgian keyboard!"<CR>
nnoremap ¿ :echo "You're using Georgian keyboard!"<CR>

" Rainbow Parentheses
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


" resize the devisions if the Vim window size changes
" ( from: https://github.com/joedicastro/dotfiles/blob/master/vim/vimrc)
" au VimResized * exe "normal! \<c-w>="


" preserves folding 
" autocmd BufLeave,BufWinLeave ?* call cursor (1,1) " reset cursor position
" autocmd BufWritePost,BufLeave,BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview


" foldtext
" from : http://dhruvasagar.com/2013/03/28/vim-better-foldtext
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
set backspace=

" vim-indent-guides (https://github.com/nathanaelkane/vim-indent-guides/)
let g:indent_guides_guide_size=1
" autocmd Filetype * IndentGuidesDisable  " disabled for normal files


" moving assistance in insert mode (thanks: http://gg-hogehoge.hatenablog.com/entry/2013/07/26/212223)
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>


" appearance
set cursorline
set cursorcolumn
"hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
" setting the following here works for 256 term
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None
colorscheme jellybeans2
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE " for 256 colors

"anzu.vim
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)N
nmap # <Plug>(anzu-sharp-with-echo)

hi StatusLine term=NONE ctermbg=black ctermfg=darkgreen
set statusline=%f\ %m\ %y\ %<[%{getcwd()}]\ %=[%4l/%4L]\ [%3c]%5P 
"set statusline=%<%f%m\ %{getcwd()}\ %=\ %l\/%L\,%=\ %c%V\ \(%P\)
set guifont=Ubuntumono\ 12
"set guifont=monofur\ 12

"_______________________________________________
"language specific modifications
"    python
autocmd Filetype python setlocal expandtab
" autocmd Filetype python IndentGuidesEnable
function JJPythonFold()
	source ~/.vim/syntax/jjpythonfold.vim/syntax/jjpythonfold.vim
endfunction
command PyFold call JJPythonFold()
"
"
"   haskell
autocmd Filetype haskell setlocal expandtab
autocmd Filetype haskell setlocal softtabstop=4
autocmd Filetype haskell setlocal shiftwidth=4
autocmd Filetype haskell setlocal smarttab
autocmd Filetype haskell setlocal shiftround
autocmd Filetype haskell setlocal nojoinspaces
autocmd Filetype haskell setlocal nofoldenable  "disable folding
" autocmd Filetype haskell IndentGuidesEnable

"    ruby
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal tabstop=2
autocmd Filetype ruby setlocal expandtab
" autocmd Filetype ruby IndentGuidesEnable
"autocmd Filetype ruby source /home/myhome/.vim/ftplugin/ruby-matchit.vim
"autocmd Filetype ruby source /home/myhome/.vim/ftplugin/ruby.vim

"    HTML
autocmd Filetype html imap <C-b> <br />
autocmd Filetype html set mps+=<:>

"    markdown
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal shiftwidth=2
autocmd Filetype markdown setlocal softtabstop=2
autocmd Filetype markdown setlocal tabstop=2

" vim
autocmd Filetype vim setlocal foldmethod=marker

"    mediawiki
autocmd FileType mediawiki nnoremap <buffer> j gj
autocmd FileType mediawiki nnoremap <buffer> k gk

"    TeX
"autocmd FileType tex,plaintex,latex source ~/.vim/ftplugin/tex.vim
"autocmd FileType tex,plaintex,latex map <buffer> <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
"autocmd FileType tex,plaintex,latex map <buffer> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
autocmd FileType tex,plaintex,latex nnoremap j gj
autocmd FileType tex,plaintex,latex nnoremap k gk
autocmd FileType tex,plaintex,latex setlocal conceallevel=0

"    common lisp
autocmd FileType lisp setlocal expandtab

" quickrun output
autocmd Filetype quickrun noremap <buffer> j gj
autocmd Filetype quickrun noremap <buffer> k gk


"gvim
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=b

" user functions
"
"
"from http://cohama.hateblo.jp/entry/2013/08/11/020849,
" :SyntaxInfo to display the syntax info.
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

" Quickrun
let g:quickrun_config = {}
let g:quickrun_config.ox = {'command' : 'oxl'}


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

