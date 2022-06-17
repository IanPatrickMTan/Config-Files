set number
set cursorline
hi CursorLine cterm=none" ctermbg=blue ctermfg=white
hi CursorLineNR cterm=bold ctermbg=blue ctermfg=white
set guicursor+=i:block-cursor
set wrap
set linebreak
set breakindent
let @w=0
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
" set clipboard=unnamedplus
function Cliptoggle()
	if(&clipboard=="unnamedplus")
		set clipboard=""
		echo 'Clipboard: Vim'
	elseif(&clipboard=="")
		set clipboard=unnamedplus
		echo 'Clipboard: System'
	endif
endfunction
function Spelltoggle()
	if(&spell=="nospell")
		set spell spelllang=en_ca
		echo 'Spellcheck: Enabled'
	else
		set nospell
		echo 'Spellcheck: Disabled'
	endif
endfunction
function Wraptoggle()
	if(@w==1)
		let @w=0
		noremap <silent> k gk
		noremap <silent> j gj
		noremap <silent> 0 g0
		noremap <silent> $ g$
		echo 'Movement: Display'
	else
		let @w=1
		unmap k
		unmap j
		unmap 0
		unmap $
		echo 'Movement: Physical'
	endif
endfunction
map <F5> :call Wraptoggle()<enter>
map <F4> :call Cliptoggle()<enter>
map <F3> :call Spelltoggle()<enter>

" pov death :|
if exists('g:neovide')
	syntax on
	color gruvbox
	set background=light
	" source C:\Users\Ian Patrick Tan\AppData\Local\nvim\gruvbox.vim
	let g:neovide_transparency = 0.85
	call Cliptoggle()
endif
