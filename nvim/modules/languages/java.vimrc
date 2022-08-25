" ############### Java Settings ###############

autocmd FileType java setlocal
            \ tabstop=2
            \ shiftwidth=2
            \ noexpandtab

" Folding regex for java files
au BufNewFile,BufRead .*java  nnoremap <buffer> <leader>m zE:g/\v^\s\{\_.{-}^\s\}/normal 0f{zfa{<cr>:noh<cr>
