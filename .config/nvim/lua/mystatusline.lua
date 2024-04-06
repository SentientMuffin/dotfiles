require('statuslinecolors')

-- Section breakdown of the statusline
-- | A | B |        C       |         D         |       E     |

-- ===================== Section A: Modes =====================

-- custom statusline
local modes = {
  ["n"] = "N",
  ["no"] = "No",
  ["v"] = "V",
  ["V"] = "Vl",
  [""] = "Vb",
  ["s"] = "S",
  ["S"] = "Sl",
  [""] = "Sb",
  ["i"] = "I",
  ["ic"] = "Ic",
  ["R"] = "R",
  ["Rv"] = "Rv",
  ["c"] = "C",
  ["cv"] = "Cx",
  ["ce"] = "Ex",
  ["r"] = "P",
  ["rm"] = "M",
  ["r?"] = "C?",
  ["!"] = "Sh",
  ["nt"] = "N",
  ["t"] = "Tm",
}

-- Get the current string formatted mode
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode])
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
      mode_color = "%#StatuslineAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end

local function mode_separator_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineNTriangle#"
  if current_mode == "n" then
      mode_color = "%#StatuslineNTriangle#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineITriangle#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatuslineVTriangle#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineRTriangle#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCTriangle#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTTriangle#"
  end
  return mode_color
end

local function statusline_section_a()
  return table.concat {
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    mode_separator_colors(),
    "",
  }
end

-- ===================== Section B: Git Info =====================

-- Global variables to save statusline update performance
displayToggle = false
branchName = ""
filesChanged = ""

local function toggleDisplay()
  displayToggle = not displayToggle
end

local function splitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function updateGitBranchName()
  branchName  = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  local splitBranch = splitString(branchName, "/")
  if #splitBranch > 1 then
    branchName = splitBranch[2]
  end

  -- max 12 characters
  branchName = string.sub(branchName, 1, 12)
end

local function updateGitFilesChanged()
  local changes = vim.fn.system("git diff --shortstat | tr -d '\n'")
  local changesPart = splitString(changes, ",")

  local filesCount = 0
  local lineAdditions = 0
  local lineDeletions = 0

  if #changesPart > 0 then
		filesCount = splitString(changesPart[1], " ")[1]

    if #changesPart == 3 then
			lineAdditions = splitString(changesPart[2], " ")[1]
			lineDeletions = splitString(changesPart[3], " ")[1]
    end

    if #changesPart == 2 then
      if changesPart[2]:sub(-2, -2) == "+" then
        lineAdditions = splitString(changesPart[2], " ")[1]
      end
      if changesPart[2]:sub(-2, -2) == "-" then
        lineDeletions = changesPart[2]:sub(2, 2)
        lineDeletions = splitString(changesPart[2], " ")[1]
      end
    end

  end

  filesChanged = table.concat {
    "%#GitFileChanges#",
    "f:" .. filesCount .. " ",
    "%#GitLineAdditions#",
    "++" .. lineAdditions .. " ",
    "%#GitLineDeletions#",
    "--" .. lineDeletions .. " ",
  }

  -- filesChanged = string.format("| f:%s, ++%s --%s ", filesCount, lineAdditions, lineDeletions)
end

local function statusline_section_b()
  if branchName == "" then
    return ""
  end

  local content = branchName
  if displayToggle then
    content = filesChanged
  end

  return table.concat {
    "%#StatuslineSectionB#",
    "  ", 
    content,
    "%#StatuslineSectionBSeparator#",
    "",
  }
end

-- exported function
function ToggleSectionB()
  updateGitFilesChanged()
  toggleDisplay()
  vim.cmd("setlocal statusline=%!v:lua.Statusline.active()")
end

-- autocmds
-- update branch info
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() updateGitBranchName() end,
})
-- update files changed info
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function() updateGitFilesChanged() end,
})

-- ===================== Section C: File Info =====================

local function filename()
	-- dont vim.fn.expand here, will set same name to all bufers
	-- %F for full file path
  local fname = "%t"
  if fname == "" then
      return ""
  end
	-- fname = "%F"
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

-- better than nothing
_G.lsp_progress = function()
	if #vim.lsp.buf_get_clients() == 0 then
		return ""
	end

	local lsp = vim.lsp.util.get_progress_messages()[1]
	if lsp then
		local name = lsp.name or ""
		local msg = lsp.message or ""
		local percentage = lsp.percentage or 0
		local title = lsp.title or ""
		if percentage == 0 then
			return string.format(" | %%<%s: %s %s ", name, title, msg)
		end
		return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
	end
	return ""
end

-- vim.opt.statusline = [[%{%v:lua.lsp_progress()%}]]

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function fileInfo()
  return " %l/%L "
end

local function leftseparator(left, right)
  local leftgroup = nvim_get_hl(0, left)
end

-- show statusline
Statusline = {}

Statusline.active = function()
  return table.concat {
    statusline_section_a(),
    "%#Git#",
    statusline_section_b(),
    "%#Normal# ",
    -- filepath(),
    filename(),
    "%#Normal#",
    lsp(),
		[[%{%v:lua.lsp_progress()%}]],
    "%=%#StatusLineExtra#",
    --filetype(),
    fileInfo(),
  }
end

function Statusline.inactive()
  return "  " .. filename()
end

function Statusline.short()
  return
end

-- show statusline
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("Statusline", {clear = true})
autocmd({"WinEnter","BufEnter"}, {
  group = "Statusline",
  command = "setlocal statusline=%!v:lua.Statusline.active()"
})
autocmd({"WinLeave","BufLeave"}, {
  group = "Statusline",
  command = "setlocal statusline=%!v:lua.Statusline.inactive()",
})
autocmd({"WinEnter","BufEnter","FileType"}, {
  group = "Statusline",
  pattern = "NvimTree",
  command = "setlocal statusline=%!v:lua.Statusline.short()",
})
