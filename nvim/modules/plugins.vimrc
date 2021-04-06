"---------------------------------------------------
"------------------ LOAD PLUGINS -------------------
"---------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

		" Editing Essentials
		Plug 'michaeljsmith/vim-indent-object'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-repeat'
		Plug 'junegunn/vim-easy-align'
		Plug 'wellle/targets.vim'

		" Quality of life
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'itchyny/lightline.vim'

		" Navigation plugins
		Plug 'easymotion/vim-easymotion'
		Plug 'haya14busa/incsearch.vim'

		" Colour Schemes
		Plug 'lifepillar/vim-solarized8'
		Plug 'arcticicestudio/nord-vim'
		Plug 'gilgigilgil/anderson.vim'
		Plug 'morhetz/gruvbox'

call plug#end()

"---------------------------------------------------
"----------------- PLUGIN SETTINGS -----------------
"---------------------------------------------------

"+++++++++++++++++ Fuzzy finder ++++++++++++++++++++

set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'window': {
			\ 'width': 0.9,
			\ 'height': 0.4,
			\ "yoffset": 0.1,
			\ 'highlight': 'Comment',
			\ 'rounded': v:false
			\ }}

"++++++++++++++++++ Autocomplete +++++++++++++++++++

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" disable autocomplete for multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" +++++++++++++++++++++ Repeat +++++++++++++++++++++

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" +++++++++++++++++++ Easymotion +++++++++++++++++++

let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
