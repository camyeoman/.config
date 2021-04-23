" search colours
hi Search guibg=background guifg=white

" split border
hi vertsplit guibg=background

" Set colour scheme
let g:lightline = { 'colorscheme': 'nord' }
colo nord

" Comment and highlight settings
hi Comment cterm=italic gui=italic
hi link EasyMotionIncSearch String
hi link EasyMotionTarget String

function! Colour_Anderson()
	let g:lightline = { 'colorscheme': 'seoul256' }
	colo anderson

	" Highlighting
	hi EasyMotionTarget guifg=#7bb292
	hi EasyMotionIncSearch guifg=#7bb292
	hi EasyMotionShade guifg=#645d59
	hi Keyword guifg=#7bb292
	hi Macro guifg=#de935f
	hi Function guifg=#a8c1c5
endfunction

function! Colour_Gruvbox()
	let g:lightline = { 'colorscheme': 'gruvbox' }
	let g:gruvbox_contrast_dark = 'soft'
	colo gruvbox

	" Highlighting
	hi link EasyMotionTarget GruvboxAqua
	hi link EasyMotionShade  GruvboxBg3
endfunction
