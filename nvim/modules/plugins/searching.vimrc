" Setup fuzzy finder

set rtp+=/usr/local/opt/fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': {
		\ 'width': 0.9,
		\ 'height': 0.5,
		\ 'yoffset': 0.1,
		\ 'highlight': 'Comment',
		\ 'rounded': v:false
	\ }}

nnoremap <silent> <C-p> <esc>:GFiles? <C-R>=fnameescape(getcwd())<cr><cr>
nnoremap <silent> g<C-p> <esc>:FZF <C-R>=fnameescape(getcwd())<cr><cr>
nnoremap <silent> <leader>f :call RIPGREP('', 0, 1)<cr>
nnoremap <silent> g<leader>f :call RIPGREP('', 0, 0)<cr>
nnoremap <silent> <A-p> :FZF ~/Code<cr>
nnoremap <silent> <C-f> :Lines<cr>

" Custom rigrap and fuzzy finder search window

function! s:interactive_search(query, fullscreen, ignore)
	  let preview = 'bat --color=always --italic-text=always --style=changes,numbers'
				  \ . ' -r $([[ {2} -gt 7 ]] && echo "`expr {2} - 7`:`expr {2} + 8`" || echo "0:16")'
				  \ . ' --highlight-line {2} {1}'

	  let search = 'rg --line-number --column --no-heading --color=always --smart-case'
				  \ . ' --colors="match:fg:blue" --colors="path:fg:black"'
				  \ . ' %s ' . (a:ignore ? '' : '--no-ignore') . ' || true'

      let initial_command = printf(search, shellescape(a:query))
      let reload_command = printf(search, '{q}')

      let opts = {
		  \ 'sink': function('s:handle_output'),
		  \ 'source': initial_command,
		  \ 'window': {
			  \ 'width': 0.9,
			  \ 'height': 0.8,
			  \ 'yoffset': 0.4,
			  \ 'highlight': 'Comment',
			  \ 'rounded': v:false
		  \},
		  \ 'options': [
			  \ '--ansi', '--phony', '--multi',
			  \ '--query', a:query,
			  \ '--prompt', 'ripgrep> ',
			  \ '--preview', preview,
			  \ '--color', 'hl+:2,hl:2',
			  \ '--delimiter', ':',
			  \ '--with-nth', '1,4',
			  \ '--bind', 'ctrl-f:unbind(change,ctrl-f)+change-prompt(fzf> )+enable-search+clear-query',
			  \ '--bind', 'ctrl-k:kill-line,alt-j:down,alt-k:up,alt-p:toggle-preview',
			  \ '--bind', 'change:reload:' . reload_command,
			  \ '--preview-window', 'down,16'
		  \]
	  \}

	  call fzf#run(fzf#wrap(opts))
endfunction

function! s:handle_output(string)
	let [path, line, column] = split(a:string, ':')[0:2]
	execute printf('edit %s', path)
	call cursor(line, column)
endfunction
