"------------------  BASE KEYBINDINGS  -------------------

" set the <leader> key to the spacebar
let mapleader=" "

"#################### QOL remappings #####################

" normal mode remappings
nnoremap <silent> <a-CR> :noh<cr>
nnoremap <silent> <a-s> :w<cr>
nnoremap Y y$

" insert mode remappings
inoremap <C-b> <space>{}<left><cr><esc>O
inoremap <silent> <a-s> <esc>:w<cr>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>C

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

" moving current line or selection up or down one line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
