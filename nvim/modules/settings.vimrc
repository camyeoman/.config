"---------------------------------------------------
"--------------------- GENERAL ---------------------
"---------------------------------------------------

" UI settings
set termguicolors  " allow true colour :D
set relativenumber " sidebar relative numbering
set number         " sidebar numbering
set guioptions-=r  " remove right-hand scroll bar 
set guioptions-=L  " remove right-hand scroll bar 
set hlsearch       " higlight search results

" Default Text formatting
set softtabstop=0  " setting disabled
set shiftwidth=4   " how many spaces >> or << is
set tabstop=4      " how many spaces a tab is

" Set behaviour
set splitbelow
set splitright

" Key press timeout
set timeoutlen=3000 ttimeoutlen=0

" Parse line for custom fold text
function! NeatFoldText()
	let line = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
	
	" improve this in the future
	let preview = matchstr(line, '\v' . '[A-z]+[^{]*(\{)@!')

	if preview == ''
		let preview = matchstr(line, '\v' . '[A-z]+ (\w+ ){0,3}')
	end

	return matchstr(line, '\v^\s*') . '> ••• ' . preview . repeat(' ', winwidth(0))
endfunction

" Change fold display
set foldtext=NeatFoldText()
