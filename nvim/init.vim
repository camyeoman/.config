" General settings customising basic settings like text formatting
source ~/.config/nvim/modules/settings.vimrc

" Load plugins and their assocaited settings
source ~/.config/nvim/modules/plugins.vimrc

" Keybindings. First, those which interact with vanilla neovim
source ~/.config/nvim/modules/core_keybindings.vimrc
" and second, those which deal with plugins
source ~/.config/nvim/modules/plugin_keybindings.vimrc

" Handle colour scheme
source ~/.config/nvim/modules/colours.vimrc

" Handle file specific formatting
autocmd FileType python setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType c      setlocal tabstop=4 shiftwidth=4 expandtab
