" ############## C & C++ Settings ##############

autocmd FileType c, cpp setlocal
            \ tabstop=4
            \ shiftwidth=4
            \ expandtab

" Folding regex for C & C++ files
autocmd FileType c,cpp
            \ nnoremap <buffer> <leader>m zE:g/\v[a-z]{3,}.*\(.*\n?.*\) \{/norm wf{zfa{<cr>:noh<cr>
