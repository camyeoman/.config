" Handle file specific formatting

" Settings for python files
autocmd FileType python setlocal
            \ tabstop=4
            \ shiftwidth=4
            \ noexpandtab

" Mass fold regex
autocmd FileType python
            \ nnoremap <buffer> <leader>m zE:g/\v[a-z]{3,}.*\(.*\n?.*\) \{/norm wf{zfa{<cr>:noh<cr>

" Comment shortcut
" autocmd FileType python <buffer> <leader>c I# <esc>

" Settings for C files (cpp referencing the header files)
autocmd FileType c,cpp setlocal
            \ tabstop=4
            \ shiftwidth=4
            \ expandtab

autocmd FileType c,cpp
            \ nnoremap <buffer> <leader>m zE:g/\v[a-z]{3,}.*\(.*\n?.*\) \{/norm wf{zfa{<cr>:noh<cr>

" Java style folding
" au BufNewFile,BufRead .*java  nnoremap <buffer> <leader>m zE:g/\v^\s\{\_.{-}^\s\}/normal 0f{zfa{<cr>:noh<cr>

