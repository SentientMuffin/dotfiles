-- Color palette
local gui_dark_gray = '#303030'
local separator_dark_gray = '#333333'
local cterm_dark_gray = 236
local gui_med_gray_hi = '#444444'
local cterm_med_gray_hi = 238
local gui_med_gray_lo = '#3a3a3a'
local separator_med_gray_lo = '#3d3d3d'
local cterm_med_gray_lo = 237
local gui_light_gray = '#b2b2b2'
local cterm_light_gray = 249
local gui_light = '#aaaaaa'
local cterm_light = 252
local gui_green = '#afd787'
local separator_green = '#b7e18e'
local cterm_green = 150
local gui_blue = '#87afd7'
local separator_blue = '#8eb7e1'
local cterm_blue = 110
local gui_purple = '#afafd7'
local separator_purple = '#b5b7e1'
local cterm_purple = 146
local gui_orange = '#d7af5f'
local separator_orange = '#deb769'
local cterm_orange = 179
local gui_red = '#d78787'
local separator_red = '#e18e8e'
local cterm_red = 174
local gui_pink = '#d7afd7'
local separator_pink = '#e1b7e1'
local cterm_pink = 182

-- for separator
-- r+6 g+8 b+10

--  ================== Section A
vim.api.nvim_set_hl(0, "StatusLineAccent", {
  fg = gui_dark_gray,
  bg = gui_green,
  ctermfg = cterm_dark_gray,
  ctermbg = cterm_green,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineNTriangle", {
  fg = separator_green,
  bg = gui_med_gray_lo,
  ctermfg = cterm_green,
  ctermbg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineInsertAccent", {
  fg = gui_dark_gray,
  bg = gui_blue,
  ctermfg = cterm_dark_gray,
  ctermbg = cterm_blue,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineITriangle", {
  fg = separator_blue,
  bg = gui_med_gray_lo,
  ctermfg = cterm_blue,
  ctermbg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineVisualAccent", {
  fg = gui_dark_gray,
  bg = gui_pink,
  ctermfg = cterm_dark_gray,
  ctermbg = cterm_pink,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineVTriangle", {
  fg = separator_pink,
  bg = gui_med_gray_lo,
  ctermfg = cterm_pink,
  ctermbg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", {
  fg = gui_dark_gray,
  bg = gui_red,
  ctermfg = cterm_dark_gray,
  ctermbg = cterm_red,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineRTriangle", {
  fg = separator_red,
  bg = gui_med_gray_lo,
  ctermfg = cterm_red,
  ctermbg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", {
  fg = black,
  bg = gui_dark_gray,
  ctermfg = cterm_dark_gray,
  ctermbg = black,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineCTriangle", {
  fg = separator_dark_gray,
  bg = gui_med_gray_lo,
  ctermfg = cterm_black,
  ctermbg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", {
  fg = gui_dark_gray,
  bg = gui_orange,
  ctermfg = cterm_dark_gray,
  ctermbg = cterm_orange,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineTTriangle", {
  fg = separator_orange,
  bg = gui_med_gray_lo,
  ctermfg = cterm_orange,
  ctermbg = cterm_med_gray_lo,
})

--  ================== Section B
vim.api.nvim_set_hl(0, "StatuslineSectionB", {
  fg = gui_light,
  bg = gui_med_gray_lo,
  ctermfg = cterm_light,
  ctermbg = cterm_med_gray_lo,
}) 
vim.api.nvim_set_hl(0, "StatuslineSectionBSeparator", {
  fg = separator_med_gray_lo,
  ctermfg = cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "GitFileChanges", {
  fg = "#ffffff",
  bg = gui_med_gray_lo,
  ctermfg = 256,
  ctermbg = cterm_med_gray_lo,
}) 
vim.api.nvim_set_hl(0, "GitLineAdditions", {
  fg = "#00ee00",
  bg = gui_med_gray_lo,
  ctermfg = cterm_light,
  ctermbg = cterm_med_gray_lo,
}) 
vim.api.nvim_set_hl(0, "GitLineDeletions", {
  fg = "#ee0000",
  bg = gui_med_gray_lo,
  ctermfg = cterm_light,
  ctermbg = cterm_med_gray_lo,
}) 
