-- Section breakdown of the tabline
-- | A |                     B                          |  T  |
-- A -- current buffer name
-- B -- list of open buffers, dot represents current buffer
-- T -- current workspace (vim tabs) should only show up if more than one

-- global variable for recent list of buffers

CB = require('tablinehelpers')

local main_file_name_width = 16
local open_buffers_width = 0
local currentBuffer = vim.api.nvim_get_current_buf
local filetype_name = {
  ['fugitive'] = 'Git',
  ['fzf'] = 'fzf',
  ['NvimTree'] = 'NvimTree',
  ['qf'] = 'Qfix',
}

-- functions
local function current_app_width()
  return vim.o.columns
end

local function get_short_fname(input, sep)
  local t = {}

  for str in string.gmatch(input, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end

  return t[#t]
end

local function get_filetype_name(filetype)
  local defined_name = filetype_name[filetype]

  if defined_name == nil then
    return filetype
  end

  return defined_name
end

local function get_buffer_name(bufnr)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)

  if vim.bo[bufnr].buftype == '' and #buf_name > 0 then
    return get_short_fname(buf_name, "/")
  end

  return get_filetype_name(vim.bo[bufnr].filetype)
end

local function section_a()
  -- 123x321
  local name = string.sub(get_buffer_name(0), 1, main_file_name_width)
  local odd_name = #name % 2 == 1
  local left_bracket = " [ "
  local right_bracket = " ]"
  local rep = (main_file_name_width - #name) / 2
  local padding = string.rep(" ", rep)
  if odd_name then
    left_bracket = "[ "
    padding = padding .. " "
  end

  return table.concat {
    left_bracket,
    padding,
    name,
    padding,
    right_bracket,
  }
end

local current_buf_width = 5
local open_buf_width = 15
local separator_width = 3

local function new_get_buffers()
  local index_buffers = {}

  local i = 0
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    -- extract to buffer exclusion helper function
    if not vim.api.nvim_buf_is_loaded(buf) then
      goto continue
    end

    if vim.bo[buf].buftype ~= '' then
      goto continue
    end

    if vim.bo[buf].filetype == 'gitcommit' then
      goto continue
    end

    i = i + 1
    local index_buf = {
      bufnr = -1,
      bufname = nil,
    }

    index_buf.bufnr = buf

    if buf == currentBuffer() then
      index_buf.bufname = "•"
    else
      index_buf.bufname = get_buffer_name(buf)
    end

    index_buffers[i] = index_buf

    ::continue::
  end

  return index_buffers
end

local function get_section_b_width()
  return current_app_width() - (21 * 2)
end

local function new_section_b()
  local new_buffers = new_get_buffers()
  CB.Set(new_buffers, currentBuffer())

  local center = CB.index_bufs[CB.center]

  local totalSpace = get_section_b_width()
  local buffersNeeded = CB.length - 1
  local leftCount = math.floor(buffersNeeded / 2)
  local rightCount = leftCount
  if buffersNeeded % 2 == 1 then
    rightCount = rightCount + 1
  end

  local leftBuffers = CB.PreviousN(leftCount, 'bufname')
  local rightBuffers = CB.NextN(rightCount, 'bufname')

  local leftSpace = math.floor((totalSpace - 11) / 2)
  local rightSpace = leftSpace
  if totalSpace % 2 == 0 then
    rightSpace = rightSpace + 1
  end

  local leftBuffersString = table.concat(leftBuffers, " | ")
  local rightBuffersString = table.concat(rightBuffers, " | ")
  local leftPadding = leftSpace - #leftBuffersString
  local rightPadding = rightSpace - #rightBuffersString

  return table.concat {
    string.rep(" ", leftPadding),
    " | ",
    leftBuffersString,
    " | ",
    center.bufname,
    " | ",
    rightBuffersString,
    " | ",
    string.rep(" ", rightPadding),
  }
end

-- always show tabline
vim.opt.stal = 2

Tabline = {}
Tabline.active = function()
	return table.concat {
    section_a(),
    new_section_b(),
	}
end

-- show tabline
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("Tabline", {clear = true})
autocmd("BufEnter", {
	group = "Tabline",
	command = "setlocal tabline=%!v:lua.Tabline.active()",
	desc = "Update tabline on buf add of removal"
})

