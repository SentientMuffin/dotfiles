CyclingBuffers = {
  index_bufs = {},
  length = 0,
  center = 0,
}

-- bufs structure
-- [i] = {
--   bufnr = buffer number (not zero for current)
--   bufname = buffer name (formatted ready to display name)
-- }
-- center is the index
function CyclingBuffers.Set(bufs, centerBuf)
  CyclingBuffers.index_bufs = bufs
  CyclingBuffers.length = #bufs

  for i, b in ipairs(bufs) do
    if centerBuf == b.bufnr then
      CyclingBuffers.center = i
      break
    end
  end
end

local function wrap_in_highlight(bufnr, text)
  local modified = vim.bo[bufnr].modified or false
  if modified then
    return "✶ " .. text
  end

  return text
end

local function indexOutOfBounds(index, length)
  return index < 1 or length < index
end

-- get the next buffer from index, if index > length
-- loop around and get the first index
-- returns an item in index_bufs
-- or empty table if invalid
local function getNext(index)
  if indexOutOfBounds(index, CyclingBuffers.length) then
    print("out of bounds for getNext")
    return {}
  end

  local result = {}
  if index == CyclingBuffers.length then
    result = CyclingBuffers.index_bufs[1]
  else
    result = CyclingBuffers.index_bufs[index + 1]
  end

  return result
end

local function getPrev(index)
  if indexOutOfBounds(index, CyclingBuffers.length) then
    return {}
  end

  local result = {}
  if index == 1 then
    result = CyclingBuffers.index_bufs[CyclingBuffers.length]
  else
    result = CyclingBuffers.index_bufs[index - 1]
  end

  return result
end

function CyclingBuffers.NextN(n, scope)
  if CyclingBuffers.center < 1 then
    return {}
  end

  if n > CyclingBuffers.length then
    return {}
  end

  local i = 1
  local nextN = {}
  local index = CyclingBuffers.center
  while i <= n do
    local next = getNext(index)
    if scope ~= nil then
      next = wrap_in_highlight(next.bufnr, next[scope])
    end
    table.insert(nextN, next)

    if index == CyclingBuffers.length then
      index = 1
    else
      index = index + 1
    end

    i = i + 1
  end

  return nextN
end

function CyclingBuffers.PreviousN(n, scope)
  if CyclingBuffers.center < 1 then
    return {}
  end

  if n > CyclingBuffers.length - 1 then
    return {}
  end

  local i = 1
  local prevN = {}
  local index = CyclingBuffers.center
  while i <= n do
    local prev = getPrev(index)
    if scope ~= nil then
      prev = wrap_in_highlight(prev.bufnr, prev[scope])
    end
    table.insert(prevN, prev)

    if index == 1 then
      index = CyclingBuffers.length
    else
      index = index - 1
    end

    i = i + 1
  end

  return prevN
end


return CyclingBuffers
