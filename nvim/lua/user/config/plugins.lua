local configuration = function(use)
  -- core dependancies
  use "wbthomason/packer.nvim"           -- the plugin manager itself
  use "nvim-lua/plenary.nvim"            -- dependancy for other plugins
  use "nvim-lua/popup.nvim"              -- provides popup functionality
  use "MunifTanjim/nui.nvim"             -- dependancy for other plugins
  use "lewis6991/impatient.nvim"         -- speed up startup time
  use "moll/vim-bbye"                    -- smart buffer management

  -- appearance modifications
  use "lewis6991/gitsigns.nvim"          -- git integration
  use "goolord/alpha-nvim"               -- welcome screen
  use "nvim-lualine/lualine.nvim"        -- status line

  -- colour schemes
  use "lunarvim/colorschemes"            -- assorted colour schemes
  use "morhetz/gruvbox"                  -- the gruvbox colour scheme
  use "arcticicestudio/nord-vim"         -- the nord colour scheme

  -- new additions
  use "ggandor/leap.nvim"                -- 2 char search for jumping around
  use "ggandor/flit.nvim"                -- better f/F/t/T functionality
  use "ggandor/leap-spooky.nvim"         -- spooky action at a distance
  use "numToStr/Comment.nvim"            -- at long last a commenting plugin
  use "echasnovski/mini.nvim"            -- bundle of utilities
  use "stevearc/oil.nvim"
  use "nanozuki/tabby.nvim"
  use "gbprod/substitute.nvim"
  use "m4xshen/hardtime.nvim"
  use "rcarriga/nvim-notify"
  use "folke/noice.nvim"

  -- editing functionality
  use "junegunn/vim-easy-align"          -- aligning text
  use "tpope/vim-surround"               -- surround text objects
  use "windwp/nvim-autopairs"            -- auto closing of brackets
  use "akinsho/toggleterm.nvim"          -- toggle floating terminal
  use "tpope/vim-repeat"                 -- better command replace on '.'

  -- additional features
  use "kyazdani42/nvim-tree.lua"         -- file browser
  use "nvim-tree/nvim-web-devicons"      -- dev icons for neovim tree
  use "ahmedkhalf/project.nvim"          -- save projects

  use {
    "L3MON4D3/LuaSnip",                  -- snippet engine
    "rafamadriz/friendly-snippets",      -- large collection of ready made snippets
    "hrsh7th/nvim-cmp",                  -- provides auto completion
    "hrsh7th/cmp-buffer",                -- autocomplete using buffer contents
    "hrsh7th/cmp-path",                  -- autocomplete using path
    "hrsh7th/cmp-cmdline",               -- autocomplete for commands
    "hrsh7th/cmp-nvim-lsp",              -- language server provider for nvim
    "neovim/nvim-lspconfig",             -- core language server support
    "williamboman/nvim-lsp-installer",   -- install manager for language service providers
  } -- autocompletion

  use {
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  } -- fuzzy finder functionality

  use "nvim-treesitter/nvim-treesitter"
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  } -- extended syntax highlights + AST utilities

  if PACKER_BOOTSTRAP then require("packer").sync() end
end

-- apply config
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

require('impatient').enable_profile()

return packer.startup(configuration)
