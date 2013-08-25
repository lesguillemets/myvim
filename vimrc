" general settings
set nocompatible
syntax on
filetype plugin on
set smartindent
set ignorecase
set smartcase
set ruler
set title
set number
set showcmd
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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
" set foldmethod=indent
" set foldcolumn=5
" set foldenable

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
autocmd Filetype * IndentGuidesDisable  " disabled for normal files


" moving assistance in insert mode (thanks: http://gg-hogehoge.hatenablog.com/entry/2013/07/26/212223)
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

"inoremap { {}<LEFT>
"
" appearance
set cursorline
"hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
" setting the following here works for 256 term
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None
colorscheme jellybeans2
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE " for 256 colors


hi StatusLine term=NONE ctermbg=black ctermfg=darkgreen
set statusline=%f\ %m\ %y\ %<[%{getcwd()}]\ %=[%4l/%4L]\ [%3c]%5P 
"set statusline=%<%f%m\ %{getcwd()}\ %=\ %l\/%L\,%=\ %c%V\ \(%P\)
set guifont=Ubuntumono\ 12

"_______________________________________________
"language specific modifications
"    python
autocmd Filetype python setlocal expandtab
autocmd Filetype python IndentGuidesEnable
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
autocmd Filetype haskell IndentGuidesEnable

"    ruby
autocmd Filetype ruby setlocal shiftwidth=2
autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal tabstop=2
autocmd Filetype ruby setlocal expandtab
autocmd Filetype ruby IndentGuidesEnable

"    HTML
autocmd Filetype html imap <C-b> <br />
autocmd Filetype html set mps+=<:>

"gvim
set guioptions-=T
set guioptions-=m
set guioptions-=r

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






":::::::::::::::::::::::::::::::::::::
" " NeoComplCache
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

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
<
set completeopt-=preview
"Q: I want to disable preview window.
"
"A:
">
"	set completeopt-=preview
"
"
