local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set the leader key
vim.g.maplocalleader = " "
vim.g.mapleader = " "
keymap("", "<Space>", "<Nop>", opts)

-- shortcuts to navigate to tabs
keymap("n", "<leader>1", "1gt", opts) -- goto tab 1
keymap("n", "<leader>2", "2gt", opts) -- goto tab 2
keymap("n", "<leader>3", "3gt", opts) -- goto tab 3
keymap("n", "<leader>4", "4gt", opts) -- goto tab 4
keymap("n", "<leader>5", "5gt", opts) -- goto tab 5
keymap("n", "<leader>6", "6gt", opts) -- goto tab 6
keymap("n", "<leader>7", "7gt", opts) -- goto tab 7
keymap("n", "<leader>8", "8gt", opts) -- goto tab 8
keymap("n", "<leader>9", "9gt", opts) -- goto tab 9

-- general keybindings
keymap("", "<A-s>", ":keeppatterns %s/\\v\\s+$//ge<CR>:w<CR>", opts)
keymap("", "<D-s>", ":keeppatterns %s/\\v\\s+$//ge<CR>:w<CR>", opts)
keymap("", "<A-CR>", ":noh<CR>", opts)

-- navigation mappings

  -- moving between splits
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)

  -- resizing splits
  keymap("n", "<C-Up>", ":resize -2<CR>", opts)
  keymap("n", "<C-Down>", ":resize +2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- alternate mode mappings

  -- normal mode mappings
  -- keymap("n", "gr", "r", opts)
  -- keymap("n", "gx", "x", opts)

  -- insert mode mappings
  keymap("i", "<C-a>", "<Home>", opts)
  keymap("i", "<C-e>", "<End>", opts)

  -- visual mode mappings
  keymap("v", ">", ">gv", opts)
  keymap("v", "<", "<gv", opts)
  keymap("v", "<Tab>", ">gv", opts)
  keymap("v", "<S-Tab>", "<gv", opts)
