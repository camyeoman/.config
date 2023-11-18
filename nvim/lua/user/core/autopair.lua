-- setup autopairing of delimeters

require("nvim-autopairs").setup {
  fast_wrap = {}, -- disable fast wrap for now
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" }
}

-- setup autocompletion for said autopairing

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
