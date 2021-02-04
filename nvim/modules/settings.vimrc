"---------------------------------------------------
"------------------- FORMATTING --------------------
"---------------------------------------------------

" Text formatting
set softtabstop=0  " setting disabled
set shiftwidth=2   " how many spaces >> or << is
set tabstop=2      " how many spaces a tab is

" UI settings
set termguicolors  " allow true colour :D
set relativenumber " sidebar relative numbering
set number         " sidebar numbering
set guioptions-=r  " remove right-hand scroll bar 
set guioptions-=L  " remove right-hand scroll bar 
set hlsearch       " higlight search results

"---------------------------------------------------
"---------------------- MISC -----------------------
"---------------------------------------------------

" Load functions from another file
source ~/.config/nvim/modules/functions.vimrc

" Key press timeout
set timeoutlen=3000 ttimeoutlen=0

" Change fold display
set foldtext=NeatFoldText()

"---------------------------------------------------
"--------------------- SPLITS ----------------------
"---------------------------------------------------

" Set behaviour
set splitbelow
set splitright

" Resize Shortcuts
noremap <c-w><space> <c-w>_ \| <c-w>\|
noremap <c-W>h <c-w>s  
noremap <c-w>\ <c-w>\|

" Resizing splits, using 'alt + <arrow key>'
noremap <A-Up> <C-w>+
noremap <A-Down> <C-w>-
noremap <A-Left> <C-w><
noremap <A-Right> <C-w>>
