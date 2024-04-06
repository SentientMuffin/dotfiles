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

local function CommentLine()
	vim.cmd(":silent! s@\\(\\S\\)@" .. startComment .. "\\1@")
	vim.cmd(":silent! s@$@" .. endComment .. "@")
end
local function UncommentLine()
	vim.cmd(":silent! s@" .. startComment .. "@@")
	vim.cmd(":silent! s@$" .. endComment .. "@@")
end

local function CommentLines()
	vim.cmd(":silent! '<,'>s@\\(\\S\\)@" .. startComment .. "\\1@")
	vim.cmd(":silent! '<,'>s@$@" .. endComment .. "@")
end

local function UncommentLines()
	vim.cmd(":silent! '<,'>s@" .. startComment .. "@@")
	vim.cmd(":silent! '<,'>s@$" .. endComment .. "@@")
end

M.CommentLine = CommentLine
M.UncommentLine = UncommentLine
M.CommentLines = CommentLines
M.UncommentLines = UncommentLines
return M
