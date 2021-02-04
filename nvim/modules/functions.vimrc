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
