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

  if vim.bo[bufnr].buftype == '' then
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
    if not vim.api.nvim_buf_is_loaded(buf) then
      goto continue
    end

    if vim.bo[buf].buftype ~= '' then
      goto continue
    end

    i = i + 1
    local index_buf = {
      bufnr = -1,
      bufname = nil,
    }

    index_buf.bufnr = buf

    if buf == currentBuffer() then
      index_buf.bufname = "  •  "
    else
      index_buf.bufname = get_buffer_name(buf)
    end

    index_buffers[i] = index_buf

    ::continue::
  end

  -- CB.Set(index_buffers, currentBuffer())
  return index_buffers

  -- print(vim.inspect(index_buffers))
end

local function get_buffers()
  local buffers = {
    current_display = false,
    current_buf = "",
    left_bufs = {},
    right_bufs = {},
  }
  local add_to_left = true

  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = get_buffer_name(buf)

      if vim.bo[buf].buftype ~= '' then
        goto continue
      end

      if buf == currentBuffer() then
        -- table.insert(buffers, "  •  ")
        buffers.current_display = true
        buffers.current_buf = "  •  "
        add_to_left = false
        goto continue
      end

      if add_to_left then
        table.insert(buffers.left_bufs, string.sub(name, 1, 15))
      else
        table.insert(buffers.right_bufs, string.sub(name, 1, 15))
      end
    end

    ::continue::
  end

  return buffers
end

local function get_section_b_width()
  -- local width_percentage = 80
  -- -- reserve one space to deal with odd even centering
  -- return math.floor((current_app_width() - 1) * width_percentage / 100)
  -- section a width is ~24
  -- section c will mimic that size
  return current_app_width() - (24 * 2)
end

local function width_for_n_buffers(n)
  return current_buf_width + (open_buf_width * n) + ((n + 1) * separator_width)
end

local function section_b_left(padding, bufs)
  if #bufs == 0 then
    return ""
  end

  local bufs_string = table.concat(bufs, " | ")
  return table.concat {
    string.rep(" ", padding),
    " | ",
    bufs_string,
  }
end

local function section_b_center(display_buf)
  if display_buf then
    return " |   •   | "
  else
    return " | "
  end
end

local function new_section_b()
  local new_buffers = new_get_buffers()
  -- print(vim.inspect(#new_buffers))
  -- print(vim.inspect(new_buffers))
  CB.Set(new_buffers, currentBuffer())

  local center = CB.index_bufs[CB.center]
  -- print(vim.inspect(CB.center))

  local totalSpace = get_section_b_width()
  local allowed_buf_count = math.floor((totalSpace - current_buf_width - separator_width) / (open_buf_width + separator_width))
  local buffersNeeded = CB.length - 1
  local leftCount = math.floor(buffersNeeded / 2)
  local rightCount = leftCount
  if buffersNeeded % 2 == 1 then
    rightCount = rightCount + 1
  end
  -- print(vim.inspect(rightCount))
  -- print(vim.inspect(leftCount))
  -- print(vim.inspect(CyclingBuffers.center))
  -- print(vim.inspect(#CyclingBuffers.index_bufs))
  -- print(vim.inspect(buffersNeeded))

  local leftBuffers = CB.PreviousN(leftCount, 'bufname')
  local rightBuffers = CB.NextN(rightCount, 'bufname')
  -- leftBuffers = {}
  -- rightBuffers = {}
  -- print(vim.inspect(leftBuffers))
  print(vim.inspect(rightBuffers))

  local leftSpace = math.floor((totalSpace - 11) / 2)
  local rightSpace = leftSpace
  if totalSpace % 2 == 0 then
    rightSpace = rightSpace + 1
  end
  -- print(vim.inspect(totalSpace))

  local leftPadding = leftSpace - width_for_n_buffers(leftCount)
  -- local leftPadding = leftSpace
  local rightPadding = rightSpace - width_for_n_buffers(rightCount)
  -- local rightPadding = rightSpace

  return table.concat {
    string.rep(" ", leftPadding),
    " | ",
    table.concat(leftBuffers, " | "),
    " | ",
    center.bufname,
    " | ",
    table.concat(rightBuffers, " | "),
    " | ",
    string.rep(" ", rightPadding),
  }
end

local function section_b()
  local buffers = get_buffers()
  local current_display = buffers.current_display
  local current_buf = buffers.current_buf
  local left_bufs = buffers.left_bufs
  local right_bufs = buffers.right_bufs

  local total_bufs = #left_bufs + #right_bufs
  if current_display then
    total_bufs = total_bufs + 1
  end

  if total_bufs <= 1 then
    return ""
  end

  -- there is 1 more space
  local total_space = get_section_b_width()
  -- change 3 to var representing separator width
  local allowed_buf_count = math.floor((total_space - current_buf_width - separator_width) / (open_buf_width + separator_width))

  -- local separator_count = #buffers + 1
  local padding = 0
  if total_bufs <= allowed_buf_count then
    local remaining_space = total_space - width_for_n_buffers(total_bufs)
    padding = math.floor(remaining_space / 2)
    if remaining_space % 2 == 1 then
      -- not sure about this, this adds two extra spaces instead of 1
      padding = padding + 1
    end

    return table.concat {
      string.rep(" ", padding),
      -- " | ",
      -- table.concat(left_bufs, " | "),
      section_b_left(padding, left_bufs),
      -- " | ",
      -- current_buf,
      -- " | ",
      section_b_center(current_display),
      table.concat(right_bufs, " | "),
      " | ",
      string.rep(" ", padding),
    }
  end

  return table.concat {
    " | ",
    table.concat(buffers, " | "),
    " | ",
  }
end

-- always show tabline
vim.opt.stal = 2

Tabline = {}
Tabline.active = function()
	return table.concat {
    section_a(),
    -- section_b(),
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

