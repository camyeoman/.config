local gen_spec = require('mini.ai').gen_spec

require('mini.ai').setup {
  -- general configuration
  silent = true,
  n_lines = 50,
  silent = false,
  search_method = 'cover_or_next',

  custom_textobjects = {
    -- Tweak function call to not detect dot in function name
    f = gen_spec.function_call({ name_pattern = '[%w_]' }),

    -- Function definition (needs treesitter queries with these captures)
    F = gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
  },

  mappings = {
    -- Main textobject prefixes
    around = 'a',
    inside = 'i',

    -- Next/last variants
    around_next = 'an',
    inside_next = 'in',
    around_last = 'al',
    inside_last = 'il',

    -- Move cursor to corresponding edge of `a` textobject
    goto_left = 'gh',
    goto_right = 'gl',
  }
}
