-- Color palette
local cp = require('colorPalettes')

-- for separator
-- r+6 g+8 b+10

--  ================== Section A
vim.api.nvim_set_hl(0, "StatusLineAccent", {
  fg = cp.gui_dark_gray,
  bg = cp.gui_green,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.cterm_green,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineNTriangle", {
  fg = cp.separator_green,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_green,
  ctermbg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineInsertAccent", {
  fg = cp.gui_dark_gray,
  bg = cp.gui_blue,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.cterm_blue,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineFileModified", {
  fg = cp.gui_blue,
  bg = cp.gui_dark_gray,
  ctermfg = cp.cterm_blue,
  ctermbg = cp.cterm_dark_gray,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineITriangle", {
  fg = cp.separator_blue,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_blue,
  ctermbg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineVisualAccent", {
  fg = cp.gui_dark_gray,
  bg = cp.gui_pink,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.cterm_pink,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineVTriangle", {
  fg = cp.separator_pink,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_pink,
  ctermbg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", {
  fg = cp.gui_dark_gray,
  bg = cp.gui_red,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.cterm_red,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineRTriangle", {
  fg = cp.separator_red,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_red,
  ctermbg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", {
  fg = cp.black,
  bg = cp.gui_dark_gray,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.black,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineCTriangle", {
  fg = cp.separator_dark_gray,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_black,
  ctermbg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", {
  fg = cp.gui_dark_gray,
  bg = cp.gui_orange,
  ctermfg = cp.cterm_dark_gray,
  ctermbg = cp.cterm_orange,
  bold = true,
})
vim.api.nvim_set_hl(0, "StatusLineTTriangle", {
  fg = cp.separator_orange,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_orange,
  ctermbg = cp.cterm_med_gray_lo,
})

--  ================== Section B
vim.api.nvim_set_hl(0, "StatuslineSectionB", {
  fg = cp.gui_light,
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_light,
  ctermbg = cp.cterm_med_gray_lo,
})
vim.api.nvim_set_hl(0, "StatuslineSectionBSeparator", {
  fg = cp.separator_med_gray_lo,
  ctermfg = cp.cterm_med_gray_lo,
})

vim.api.nvim_set_hl(0, "GitFileChanges", {
  fg = "#ffffff",
  bg = cp.gui_med_gray_lo,
  ctermfg = 256,
  ctermbg = cp.cterm_med_gray_lo,
})
vim.api.nvim_set_hl(0, "GitLineAdditions", {
  fg = "#00ee00",
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_light,
  ctermbg = cp.cterm_med_gray_lo,
})
vim.api.nvim_set_hl(0, "GitLineDeletions", {
  fg = "#ee0000",
  bg = cp.gui_med_gray_lo,
  ctermfg = cp.cterm_light,
  ctermbg = cp.cterm_med_gray_lo,
})
