"------------------  BASE KEYBINDINGS  -------------------

let mapleader=" "

"#################### QOL remappings #####################

" normal mode remappings
nnoremap <silent> <leader>h :noh<cr>
nnoremap <silent> <a-s> :w<cr>
nnoremap Y y$

" insert mode remappings
inoremap <C-b> <space>{}<left><cr><esc>O
inoremap <silent> <a-s> <esc>:w<cr>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>

" system copy and paste
vnoremap <leader>y "+y
nnoremap <leader>p "+p

"################ navigating and resizing ################

" navigating splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resizing splits, using 'alt + <arrow key>'
noremap <A-Up>    <C-w>+
noremap <A-Down>  <C-w>-
noremap <A-Left>  <C-w><
noremap <A-Right> <C-w>>

" moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"------------------ PLUGIN KEYBINDINGS -------------------

" fuzzy finder"

nnoremap <silent> <C-p> <esc>:FZF <C-R>=getcwd()<cr><cr>
nnoremap <silent> <A-p> :FZF ~/Code<cr>
nnoremap <silent> <leader>f :call RIPGREP('', 0)<cr>
nnoremap <silent> <C-f> :Lines<cr>

" easymotion
nmap s <Plug>(easymotion-overwin-f2)
nmap <silent> <leader>s :noh<cr><Plug>(easymotion-sn)

" easyalign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
