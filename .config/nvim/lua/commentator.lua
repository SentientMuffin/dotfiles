local M = {}
local startComment = ""
local endComment = ""

-- autocmd to set 
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("StartEndComment", {clear = true})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.sh", "*pl", "*.tcl"},
	callback = function()
		startComment = "# "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.go"},
	callback = function()
		startComment = "// "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {".vimrc", "*.vim"},
	callback = function()
		startComment = "\\\" "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.lua"},
	callback = function()
		startComment = "-- "
		endComment = ""
	end
})

local function ToggleLine(force)
  vim.fn.cursor({0, 0})

  local line = vim.fn.line(".")
  local commented = vim.fn.search("^\\s*" .. startComment, "cn", line) ~= 0
  if force then
    commented = false
  end

  if commented then
    vim.cmd(":silent! s@" .. startComment .. "@@")
    vim.cmd(":silent! s@$" .. endComment .. "@@")
  else
    vim.cmd(":silent! s@\\(\\S\\)@" .. startComment .. "\\1@")
    vim.cmd(":silent! s@$@" .. endComment .. "@")
  end
end

local function ToggleRange(force)
  local startLine = vim.fn.line("v")
  local endLine = vim.fn.line(".")
  local flags = "cn"
  local reversed = startLine > endLine

  if reversed then
    startLine, endLine = endLine, startLine
  end

  vim.fn.cursor({startLine, 0})

  local commented = vim.fn.search("^\\s*" .. startComment, flags, endLine) ~= 0
  if force then
    commented = false
  end

  -- set visual mode marks
  vim.api.nvim_buf_set_mark(0, "<", startLine, 0, {})
  vim.api.nvim_buf_set_mark(0, ">", endLine, 0, {})

  if commented then
    vim.cmd(":silent! '<,'>s@" .. startComment .. "@@")
    vim.cmd(":silent! '<,'>s@$" .. endComment .. "@@")
  else
    vim.cmd(":silent! '<,'>s@\\(\\S\\)@" .. startComment .. "\\1@")
    vim.cmd(":silent! '<,'>s@$@" .. endComment .. "@")
  end

  if reversed then
    vim.fn.cursor({startLine, 0})
  end
end

local function ToggleComments(force)
  if vim.fn.mode() == "n" then
    ToggleLine(force)
  else
    ToggleRange(force)
  end
end

local function ForceComment()
  ToggleComments(true)
end

M.ToggleComments = ToggleComments
M.ForceComment = ForceComment
return M
