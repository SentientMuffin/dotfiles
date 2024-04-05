-- Section breakdown of the tabline
-- |                         A                          |  T  |
-- A -- list of open buffers
-- T -- current workspace (vim tabs) should only show up if more than one

-- global variable for recent list of buffers
myBuffers = {}
bufferPosition = {}
currentBuffer = vim.api.nvim_get_current_buf
bufferName = vim.api.nvim_buf_get_name

-- functions
local function filename()
	print(vim.inspect(myBuffers))
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return "N/A"
  end
  return fname
end

local function addBuffer()
	if vim.bo[currentBuffer()].buftype ~= "" then
		return
	end

	local fname = vim.fn.expand("%:f")
	if fname ~= '' then
		-- myBuffers[currentBuffer()] = fname
		table.insert(myBuffers, currentBuffer(), fname)
	end
	-- if myBuffers[currentBuffer()] == nil then
	-- 	local fname = vim.fn.expand("%:t")
	-- 	if fname ~= '' then
	-- 		table.insert(myBuffers, currentBuffer(), fname)
	-- 	end
	-- end
end

local function removeBuffer()
	if not vim.bo[currentBuffer()].buflisted then
		-- return
	end

	if myBuffers[currentBuffer()] ~= nil then
		-- table.remove(myBuffers, currentBuffer())
	end
end

local function removeCurrentBuffer()
	local removeIndex = bufferPosition[currentBuffer()]
	bufferPosition = table.remove(bufferPosition, currentBuffer())
	myBuffers = table.remove(myBuffers, removeIndex)
end

-- always show tabline
vim.opt.stal = 2

Tabline = {}
Tabline.active = function()
	return table.concat {
		" [",
		filename(),
		"] ",
		-- table.concat(myBuffers, '|'),
	}
end

-- show tabline
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("Tabline", {clear = true})
-- autocmd("BufEnter", {
-- 	group = "Tabline",
-- 	callback = function()
-- 		addBufferToTop()
-- 	end,
-- 	desc = "Update buffer table"
-- })
autocmd("BufEnter", {
	group = "Tabline",
	callback = function()
		-- removeBuffer()
		addBuffer()
	end
})
-- autocmd("BufLeave", {
-- 	group = "Tabline",
-- 	callback = function()
-- 		addBuffer()
-- 	end,
-- })
autocmd({"BufAdd", "BufWipeout", "BufEnter"}, {
	group = "Tabline",
	command = "setlocal tabline=%!v:lua.Tabline.active()",
	desc = "Update tabline on buf add of removal"
})

