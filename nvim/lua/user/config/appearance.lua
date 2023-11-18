vim.cmd "colorscheme nord"

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true, })

vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#ebcb8b', bold = true, nocombine = true, })
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = '#bf616a', bold = true, nocombine = true, })

-- ignore selected colour schemes from options

local colour_schemes_to_ignore
  = "set wildignore+=" ..    "blue.vim"    ..
                   "," ..  "darkblue.vim"  ..
                   "," ..   "delek.vim"    ..
                   "," ..   "desert.vim"   ..
                   "," ..  "elflord.vim"   ..
                   "," ..  "evening.vim"   ..
                   "," ..  "industry.vim"  ..
                   "," ..  "koehler.vim"   ..
                   "," ..  "morning.vim"   ..
                   "," ..   "murphy.vim"   ..
                   "," ..   "pablo.vim"    ..
                   "," .. "peachpuff.vim"  ..
                   "," ..   "quiet.vim"    ..
                   "," ..    "ron.vim"     ..
                   "," ..   "shine.vim"    ..
                   "," ..   "torte.vim"    ..
                   "," ..  "minicyan.vim"  ..
                   "," .. "minischeme.vim" ..
                   "," ..  "zellner.vim"

vim.cmd(colour_schemes_to_ignore) -- exclude colours schemes from autocomplete
