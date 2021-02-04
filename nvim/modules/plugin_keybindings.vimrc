" Fuzzy finder (use control p)
nnoremap <c-p> <esc>:FZF <C-R>=getcwd()<cr><cr>

" Fuzzy finder on Code Directory (use alt p)
nnoremap <a-p> :FZF ~/Code<cr>

" Easymotion keybinding
nmap s <Plug>(easymotion-overwin-f2)
map  <leader>s :noh<cr><Plug>(easymotion-sn)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
