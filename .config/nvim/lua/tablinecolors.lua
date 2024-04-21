-- Color palette
local cp = require('colorPalettes')

--  ================== Section A
vim.api.nvim_set_hl(0, "CurrentBufferNormal", {
  fg = cp.gui_green,
  bg = cp.bg_accent,
  bold = true,
})

vim.api.nvim_set_hl(0, "CurrentBufferModified", {
  fg = cp.gui_blue,
  bg = cp.bg_accent,
  bold = true,
  italic = true,
}) 

vim.api.nvim_set_hl(0, "BufferModified", {
  fg = cp.gui_blue,
  bg = cp.bg_accent,
  italic = true,
})
