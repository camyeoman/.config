local labels_to_use = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m',
  'n','o','p','q','r','s','t','u','v','w','x','y','z',
}

require('leap').setup(
  {
    max_phase_one_targets = nil,
    highlight_unlabeled_phase_one_targets = false,
    max_highlighted_traversal_targets = 10,
    case_sensitive = false,
    equivalence_classes = { ' \t\r\n', },
    substitute_chars = {},
    safe_labels = labels_to_use,
    labels = labels_to_use,
    special_keys = {
      next_target = '<enter>',
      prev_target = '<tab>',
      next_group = '<space>',
      prev_group = '<tab>',
      multi_accept = '<enter>',
      multi_revert = '<backspace>',
    }
  }
)

require('leap').add_default_mappings()
require('leap-spooky').setup()

local flit_config = {
  labeled_modes = "nvo",
  multiline = true,
  opts = { case_sensitive = true },
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
}

require('flit').setup(flit_config)

vim.keymap.set({ 'n', 'v', 'o', 't' }, ';', function() end)
vim.keymap.set({ 'n', 'v', 'o', 't' }, ',', function() end)

-- implement function to toggle whether flit is active

function paranormal(targets)
  -- Get the :normal sequence to be executed.
  local input = vim.fn.input("normal! ")
  if #input < 1 then return end

  local ns = vim.api.nvim_create_namespace("")

  -- Set an extmark as an anchor for each target, so that we can also execute
  -- commands that modify the positions of other targets (insert/change/delete).
  for _, target in ipairs(targets) do
    local line, col = unpack(target.pos)
    id = vim.api.nvim_buf_set_extmark(0, ns, line - 1, col - 1, {})
    target.extmark_id = id
  end

  -- Jump to each extmark (anchored to the "moving" targets), and execute the
  -- command sequence.
  for _, target in ipairs(targets) do
    local id = target.extmark_id
    local pos = vim.api.nvim_buf_get_extmark_by_id(0, ns, id, {})
    vim.fn.cursor(pos[1] + 1, pos[2] + 1)
    vim.cmd("normal! " .. input)
  end

  -- Clean up the extmarks.
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

function activate_paranormal()
  require('leap').leap {
      target_windows = { vim.fn.win_getid() },
      action = paranormal,
      multiselect = true,
  }
end

vim.keymap.set('n', '<leader>on', activate_paranormal)

local function get_line_starts(winid, skip_range)
  local wininfo =  vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line('.')
  -- Skip lines close to the cursor.
  local skip_range = skip_range or 2

  -- Get targets.
  local targets = {}
  local lnum = wininfo.topline
  while lnum <= wininfo.botline do
    local fold_end = vim.fn.foldclosedend(lnum)
    -- Skip folded ranges.
    if fold_end ~= -1 then
      lnum = fold_end + 1
    else
      if (lnum < cur_line - skip_range) or (lnum > cur_line + skip_range) then
        table.insert(targets, { pos = { lnum, 1 } })
      end
      lnum = lnum + 1
    end
  end

  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
  local function screen_rows_from_cur(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
    return math.abs(cur_screen_row - t_screen_row)
  end
  table.sort(targets, function (t1, t2)
    return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
  end)

  if #targets >= 1 then
    return targets
  end
end

-- You can pass an argument to specify a range to be skipped
-- before/after the cursor (default is +/-2).
function leap_linewise(skip_range)
  local winid = vim.api.nvim_get_current_win()
  require('leap').leap {
    target_windows = { winid },
    targets = get_line_starts(winid, skip_range),
  }
end

-- For maximum comfort, make sure to set the mappings in a way that
-- forces linewise selection:
vim.keymap.set('x', '\\', function ()
  -- Do not exit from V if already in it (pressing v/V/<C-v>
  -- again exits the corresponding Visual mode).
  return (vim.fn.mode(1) == "V" and "" or "V") .. "<cmd>lua leap_linewise()<cr>"
end, { expr = true })
