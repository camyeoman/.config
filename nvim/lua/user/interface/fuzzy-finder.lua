local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end
local actions = require "telescope.actions"

telescope.load_extension('fzf')

local insert_mode_mappings = {
  ["<C-n>"] = actions.cycle_history_next,
  ["<C-p>"] = actions.cycle_history_prev,
  ["<C-j>"] = actions.move_selection_next,
  ["<C-k>"] = actions.move_selection_previous,
  ["<C-c>"] = actions.close,
  ["<Down>"] = actions.move_selection_next,
  ["<Up>"] = actions.move_selection_previous,

  ["<CR>"] = actions.select_default,
  ["<C-x>"] = actions.select_horizontal,
  ["<C-v>"] = actions.select_vertical,
  ["<C-t>"] = actions.select_tab,

  ["<C-u>"] = actions.preview_scrolling_up,
  ["<C-d>"] = actions.preview_scrolling_down,
  ["<PageUp>"] = actions.results_scrolling_up,
  ["<PageDown>"] = actions.results_scrolling_down,

  ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
  ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
  ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
  ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  ["<C-l>"] = actions.complete_tag,
  ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
}

local normal_mode_mappings = {
  ["<esc>"] = actions.close,
  ["<CR>"] = actions.select_default,
  ["<C-x>"] = actions.select_horizontal,
  ["<C-v>"] = actions.select_vertical,
  ["<C-t>"] = actions.select_tab,

  ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
  ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
  ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
  ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

  ["j"] = actions.move_selection_next,
  ["k"] = actions.move_selection_previous,
  ["H"] = actions.move_to_top,
  ["M"] = actions.move_to_middle,
  ["L"] = actions.move_to_bottom,

  ["<Down>"] = actions.move_selection_next,
  ["<Up>"] = actions.move_selection_previous,
  ["gg"] = actions.move_to_top,
  ["G"] = actions.move_to_bottom,

  ["<C-u>"] = actions.preview_scrolling_up,
  ["<C-d>"] = actions.preview_scrolling_down,

  ["<PageUp>"] = actions.results_scrolling_up,
  ["<PageDown>"] = actions.results_scrolling_down,

  ["?"] = actions.which_key,
}

-- specify configuration
telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
    prompt_prefix = " ",
    selection_caret = " ",
    mappings = {
      i = insert_mode_mappings,
      n = normal_mode_mappings
    }
  },
  pickers = {
    git_files = {},
    find_files = {},
    search_history = { theme = "ivy" },
    command_history = { theme = "dropdown" },
  }
}

-- set normal mode keymappings

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>f<leader>", "<cmd>Telescope<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope git_files<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope registers<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope search_history<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", opts)

keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<leader>ld", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
keymap("n", "<leader>loc", "<cmd>Telescope lsp_outgoing_calls<CR>", opts)
keymap("n", "<leader>lic", "<cmd>Telescope lsp_incoming_calls<CR>", opts)
