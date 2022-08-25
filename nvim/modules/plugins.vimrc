"###################### FUZZY FINDER ######################

function! RIPGREP(query, fullscreen)
	  let preview = 'bat --color=always --italic-text=always --style=changes,numbers'
				  \ . ' -r $([[ {2} -gt 7 ]] && echo "`expr {2} - 7`:`expr {2} + 8`" || echo "0:16")'
				  \ . ' --highlight-line {2} {1}'

	  let search = 'rg --line-number --column --no-heading --color=always --smart-case'
				  \ . ' --colors="match:fg:blue" --colors="path:fg:black"'
				  \ . ' %s --no-ignore || true'

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

"#################### COC AUTOCOMPLETE ###################

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()

" inoremap <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"######################### REPEAT ########################

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"####################### EASYMOTION ######################

let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz;'

"####################### LaTeX ###########################

let g:livepreview_previewer = 'evince'

autocmd FileType tex nnoremap <silent><buffer> <leader>c :w<cr>:silent !pdflatex -output-directory texfiles main.tex<cr>
