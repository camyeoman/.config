-- setup the additional operators to operate on text objects or selections

require('mini.operators').setup {
  evaluate = { prefix = 'g=', func = nil },
  exchange = { prefix = 'gx', reindent_linewise = true },
  multiply = { prefix = 'gm', func = nil },
  replace  = { prefix = 'gr', reindent_linewise = true },
  sort     = { prefix = '', func = nil }
}

-- setup enhanced split/join operations

require('mini.splitjoin').setup {
  mappings = { split = '<leader>os', join = '<leader>oj',},
  detect = {
    brackets = nil,
    separator = ',',
    exclude_regions = nil,
  }
}
