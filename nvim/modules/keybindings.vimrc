"---------------------------------------------------
"--------------- VANILLA KEYBINDINGS ---------------
"---------------------------------------------------

" Set leader key to spacebar
let mapleader=" "

" Save file
nnoremap <a-s> :w<cr>
inoremap <a-s> <esc>:w<cr>

" Focused search
noremap <silent> <leader>b :call Focus_Search(0)<cr>

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

" Use alt to move line in visual and normal mode,
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Navigating Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resizing splits, using 'alt + <arrow key>'
noremap <A-Up>    <C-w>+
noremap <A-Down>  <C-w>-
noremap <A-Left>  <C-w><
noremap <A-Right> <C-w>>

"---------------------------------------------------
"--------------- PLUGIN KEYBINDINGS ----------------
"---------------------------------------------------

" Fuzzy finder (use control p)
nnoremap <c-p> <esc>:FZF <C-R>=getcwd()<cr><cr>

" Fuzzy finder on Code Directory (use alt p)
nnoremap <a-p> :FZF ~/Code<cr>

" Easymotion keybinding
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>s :noh<cr><Plug>(easymotion-sn)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
