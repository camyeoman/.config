" Set leader key to spacebar
let mapleader=" "

" Save file
nnoremap <leader>w :w<cr>

" Remove search highlight
noremap <leader>b :noh<cr>

" Copy and paste using system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>p  "+p

" Go to start and end of line in insert mode, respectively
inoremap <c-a> <a-I>
inoremap <c-e> <a-A>

" Change Y as yank till end of line
nnoremap Y y$

" Insert Brackets
inoremap <c-b> <space>{}<left><cr><esc>O

" Use alt to move line in normal mode,
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" then in insert mode,
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" and finally in visual mode,
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Tools for folding
nnoremap <leader>m zE:g/\v^\s\{\_.{-}^\s\}/normal 0f{zfa{<cr>:noh<cr>
nnoremap <leader>M :g/\v^\{\_.{-}^\}/normal zfa{<cr>:noh<cr>

" To use later
" :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
