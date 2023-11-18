# if neovim hasn't been opened yet, then open it

if ! /usr/local/bin/nvim --server ~/.cache/nvim/neovide.pipe --remote-send ""; then
  /usr/local/bin/neovide --neovim-bin "/usr/local/bin/nvim --listen ~/.cache/nvim/neovide.pipe"
fi

# if files to open are supplied, open them in new tabs

if [ $# -gt 0 ]; then
  /usr/local/bin/nvim \
    --server ~/.cache/nvim/neovide.pipe \
    --remote-tab "$@"
fi
