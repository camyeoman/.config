call plug#begin('~/.config/nvim/plugged')

		" Editing Essentials
		Plug 'michaeljsmith/vim-indent-object'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-repeat'
		Plug 'junegunn/vim-easy-align'
		Plug 'wellle/targets.vim'

		" Quality of life
		Plug 'junegunn/fzf.vim'
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

" Load all of the config files from the modules subdirectory
for filepath in split(glob('./modules/**/*.vimrc'), '\n')
	exe 'source' filepath
endfor
