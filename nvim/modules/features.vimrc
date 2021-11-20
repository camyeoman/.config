let s:header_regex = '\v^\S+( *|(::| *))*⟶ '

function! s:toc_cycle(start, end, flag)
	let pos = searchpos('\v^.{-}[*]', 'n' . a:flag)
	if (a:start <= pos[0] && pos[0] <= a:end)
		let pos = searchpos('\v^.{-}[*]', 'n' . a:flag)
		call cursor(pos[0], pos[1])
		normal! f*
	elseif line('.') > a:start + 2
		if a:flag == 'b'
			call cursor(a:end, 1)
		else
			call cursor(a:start + 2, 1)
		endif

		call s:toc_cycle(a:start, a:end, a:flag)
	endif
endfunction

function! s:navigate_jump(start, end)
	let in_toc = (a:start <= line('.') && line('.') <= a:end)
	if in_toc && getline('.') =~ '\v^.{-}[*]'
		let title = trim(matchstr(getline('.'), '\v[^+*]+$'))
		call search(s:header_regex . ' *' . title, 'w')
	elseif ! in_toc && getline('.') =~ s:header_regex
		let heading = trim(matchstr(getline('.'), '⟶ .*')[3:])
		call cursor(a:start + 2, 1)
		call search(printf('\v[*] *%s *$', heading), 'w')
	endif
endfunction

function! s:navigate_next(start, end)
	if (a:start <= line('.') && line('.') <= a:end)
		call s:toc_cycle(a:start, a:end, '')
	else
		call search(s:header_regex, 'w')
	endif
endfunction

function! s:navigate_back(start, end)
	if (a:start <= line('.') && line('.') <= a:end)
		call s:toc_cycle(a:start, a:end, 'b')
	else
		call search('\v^(\S+( *|::))*⟶ ', 'wb')
	endif
endfunction

function! TableOfContentsNavigate(func)
	let start = search('\vTABLE OF CONTENTS$', 'n')
	let end = start
	while getline(end) !~ '^$'
		let end += 1
	endwhile

	normal! m'

	if a:func == 'jump'
		call s:navigate_jump(start, end)
	elseif a:func == 'next'
		call s:navigate_next(start, end)
	elseif a:func == 'back'
		call s:navigate_back(start, end)
	endif

	normal! zz

endfunction

function! ToggleTableOfContentNavigate()
	if maparg('f', 'n', 0, 'buffer') != ":call TableOfContentsNavigate('jump')<CR>"
		nmap <buffer> <silent> f :call TableOfContentsNavigate('jump')<cr>
		nmap <buffer> <silent> n :call TableOfContentsNavigate('next')<cr>
		nmap <buffer> <silent> N :call TableOfContentsNavigate('back')<cr>
	else
		unmap <buffer> f
		unmap <buffer> n
		unmap <buffer> N
	endif
endfunction

au FileType reference nnoremap <buffer> <silent> <c-t> :call ToggleTableOfContentNavigate()<cr>
au FileType reference call ToggleTableOfContentNavigate()
au FileType reference highlight! link Error Normal
