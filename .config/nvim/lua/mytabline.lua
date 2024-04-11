-- Section breakdown of the tabline
-- | A |                     B                          |  T  |
-- A -- current buffer name
-- B -- list of open buffers, dot represents current buffer
-- T -- current workspace (vim tabs) should only show up if more than one

-- global variable for recent list of buffers
MyBuffers = {}
Columns = 0
local currentBuffer = vim.api.nvim_get_current_buf

-- functions
local function section_a()
  return "[%t]"
end

local function get_short_fname(input, sep)
  local t = {}
  for str in string.gmatch(input, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t[#t]
end

local function get_buffers()
  local buffers = {}
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      if buf == currentBuffer() then
        table.insert(buffers, " • ")
      else
        local bufName = vim.api.nvim_buf_get_name(buf)
        table.insert(buffers, get_short_fname(bufName, "/"))
        -- buffers[i] = get_short_fname(bufName, "/")
      end
    end
  end

  return buffers
end

local function section_b()
  local buffers = get_buffers()

  return table.concat(buffers, "|")
end

local function update_columns()
  Columns = vim.api.nvim_get_option("columns")
end

-- always show tabline
vim.opt.stal = 2

Tabline = {}
Tabline.active = function()
	return table.concat {
    section_a(),
    " | ",
    section_b(),
    " | ",
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
-- autocmd("BufEnter", {
	-- group = "Tabline",
	-- callback = function()
    -- if vim.api.nvim_buf_is_loaded(0) then
      -- refreshBuffers()
    -- end
	-- end
-- })
-- autocmd("BufDelete", {
  -- group = "Tabline",
  -- callback = function()
    -- print("Deleting buffer " .. vim.fn.expand("#"))
    -- MyBuffers[CurrentBuffer()] = nil
  -- end
-- })
-- autocmd("BufLeave", {
-- 	group = "Tabline",
-- 	callback = function()
-- 		addBuffer()
-- 	end,
-- })
autocmd({"VimEnter", "VimResized"}, {
  group = "Tabline",
  callback = function()
    update_columns()
  end,
  desc = "Update tabline max width on VimEnter and VimResized"
})

autocmd("BufEnter", {
	group = "Tabline",
	command = "setlocal tabline=%!v:lua.Tabline.active()",
	desc = "Update tabline on buf add of removal"
})

