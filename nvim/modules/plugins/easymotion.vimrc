" Setup configuration for easy motion

let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz;'

nmap s <Plug>(easymotion-overwin-f2)
nmap <silent> <leader>s :noh<cr><Plug>(easymotion-sn)
