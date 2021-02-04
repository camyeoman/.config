" vim:foldmethod=marker

" general settings accross all colour schemes
function! Colour_Setup()

	" change display of comments
	hi Comment cterm=italic gui=italic

	" set fold colour
	" hi Folded guibg=background

	" search colours
	hi Search guibg=background guifg=white

	" split border
	hi vertsplit guibg=background

endfunction

" anderson {{{

function! Colour_Anderson()

	let g:lightline = { 'colorscheme': 'seoul256' }

	" colo anderson
	colo anderson
	call Colour_Setup()

	" Highlighting
	hi EasyMotionTarget guifg=#7bb292
	hi EasyMotionIncSearch guifg=#7bb292
	hi EasyMotionShade guifg=#645d59
	hi Keyword guifg=#7bb292
	hi Macro guifg=#de935f
	hi Function guifg=#a8c1c5

endfunction

" }}}

" gruvbox {{{

function! Colour_Gruvbox()

	let g:lightline = { 'colorscheme': 'gruvbox' }
	let g:gruvbox_contrast_dark = 'soft'

	colo gruvbox
	call Colour_Setup()

	" Highlighting
	hi link EasyMotionTarget GruvboxAqua
	hi link EasyMotionShade  GruvboxBg3

endfunction

" }}}

" nord {{{

function! Colour_Nord()

	let g:lightline = { 'colorscheme': 'nord' }

	colo nord

	" Highlighting
	hi link EasyMotionTarget SpecialComment
	hi link EasyMotionShade SpecialKey
	call Colour_Setup()

endfunction

" }}}

" Call the chosen colour scheme
call Colour_Nord()
