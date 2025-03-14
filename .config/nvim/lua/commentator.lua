local M = {}
local startComment = ""
local endComment = ""

-- autocmd to set 
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("StartEndComment", {clear = true})

-- to match all hidden files that do not have file extension: .*[!.][!.]*
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.sh", "*pl", "*.tcl", ".env", ".conf"},
	callback = function()
    vim.bo.commentstring = "# %s"
		startComment = "# "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.go"},
	callback = function()
    -- vim.cmd("setlocal commentstring=//\\ %s")
    -- vim.bo.commentstring = "//\\ %s"
    -- autocmd FileType cpp setlocal commentstring=// %s
    -- vim.nvim_api.set_option("commentstring", "// %s")
		startComment = "// "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {".vimrc", "*.vim"},
	callback = function()
    vim.bo.commentstring = "\" %s"
		startComment = "\\\" "
		endComment = ""
	end
})
autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
	group = "StartEndComment",
	pattern = {"*.lua"},
	callback = function()
    vim.bo.commentstring = "-- %s"
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
  local originalStartLine = vim.fn.line("v")
  local originalEndLine = vim.fn.line(".")
  local flags = "cn"
  local reversed = originalStartLine > originalEndLine

  local startLine, endLine = originalStartLine, originalEndLine
  if reversed then
    startLine, endLine = originalEndLine, originalStartLine
  end

  vim.fn.cursor({startLine, 0})

  -- match non commented lines
  -- "^\\s*\\(\\s\\@!\\)\\@=\\(" .. startComment .. "\\)\\@!.*$"

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

  -- vim.cmd.normal("<esc>")

  if reversed then
    vim.fn.cursor({ startLine, 0 })
  -- vim.api.nvim_buf_set_mark(0, "<", originalStartLine, 0, {})
  -- vim.api.nvim_buf_set_mark(0, ">", originalEndLine, 0, {})
  else
  -- vim.api.nvim_buf_set_mark(0, "<", originalEndLine, 0, {})
  -- vim.api.nvim_buf_set_mark(0, ">", originalStartLine, 0, {})
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
