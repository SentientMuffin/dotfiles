-- local Commentator = require('commentator')

-- keymaps
vim.keymap.set('n', '<c-space>', '<nop>', {desc = 'No op in normal mode'})
vim.keymap.set('t', '<a-w>', '<c-\\><c-n>', {desc = 'Enter normal mode from terminal mode'})
vim.keymap.set('c', '<c-space>', '<c-c>', {desc = 'Ctrl-c to escape in command mode'})
vim.keymap.set('i', '<c-space>', '<esc>l', {desc = 'Escape and move cursor right'})
vim.keymap.set('v', '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('i', '<c-[>', '<c-o>:stopinsert<cr>', {desc = 'Escape and move cursor right', noremap = true})
vim.keymap.set({'n', 'v'}, '<c-c>', ':', {desc = 'Command mode'})
vim.keymap.set('i', '<c-c>', '<c-o>:stopinsert<cr>', {desc = 'Escape insert mode'})
vim.keymap.set('i', '<c-e>', '<c-o>', {desc = 'Insert mode one time normal command'})
-- vim.keymap.set('n', '<leader>t', ToggleSectionB, {desc = 'Status Toggle'})
vim.keymap.set('i', '<c-s>', '<esc><cmd>silent! write<cr>l', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>silent! write<cr>', {desc = 'Save'})
-- vim.keymap.set('c', '<c-g>', '/g', {desc = 'replace all in command mode s&r'})
vim.keymap.set({'n', 'v'}, '<c-r>', '<c-y>', {desc = 'Page down'})
vim.keymap.set('n', 'U', '<c-r>', {desc = 'Redo'})
vim.keymap.set('n', '<leader>cd', '<cmd>let @+ = expand(\'%:p:h\')<cr>', {desc = 'Copy current directory'})
-- vim.keymap.set({'n', 'v'}, '<leader>w', '<c-w>', {desc = 'Window management prefix'})

-- text editting
vim.keymap.set({'n', 'v'}, 'R', 'r', {desc = 'Replace'})
vim.keymap.set('n', '<leader><space>', function()
  -- get character under cursor
  local pos = vim.api.nvim_win_get_cursor(0)
  local char = vim.fn.getline('.'):sub(pos[2]+1, pos[2]+1)
  if char == ' ' then
    -- execute viw command
    vim.cmd('normal viw')
    vim.cmd('normal c')
    vim.cmd('normal a ')
    -- replace visual selection with a single space character
    -- send space key in replace mode
    -- vim.fn.feedkeys('c<space><esc>', 'n')
  else
    -- no operation
    vim.fn.feedkeys('', 'n')
  end
end, {desc = 'Replace consecutive white spaces under cursor with a single space'})
vim.keymap.set('n', '<leader>d', function() -- get character under cursor
  local pos = vim.api.nvim_win_get_cursor(0)
  local char = vim.fn.getline('.'):sub(pos[2]+1, pos[2]+1)
  if char == ' ' then
    -- execute viw command
    vim.cmd('normal viw')
    vim.cmd('normal d')
    -- replace visual selection with a single space character
    -- send space key in replace mode
    -- vim.fn.feedkeys('c<space><esc>', 'n')
  else
    -- no operation
    vim.fn.feedkeys('', 'n')
  end
end, {desc = 'Replace consecutive white spaces under cursor with a single space'})

-- vim.keymap.set({'x', 'o'}, 'ih', 'i(', {desc = 'text object ()'})
-- vim.keymap.set({'x', 'o'}, 'ih', 'i{', {desc = 'text object {}'})
-- vim.keymap.set({'x', 'o'}, 'im', 'i[', {desc = 'text object []'})
-- vim.keymap.set({'x', 'o'}, 'as', , {desc = 'continuous space as text object'})

-- linting
vim.api.nvim_create_user_command('Lint', function(c)
  vim.cmd('silent! w!')
  vim.notify('Linting...' .. vim.fn.system("pwd"))
end, { bang = true, nargs = '*' })

vim.keymap.set('n', '<c-c>', '<c-a>', {desc = 'Increment number'})

vim.keymap.set('n', '"', ':call append(line(\'.\')-1, \'\')<cr>', {desc = 'Insert empty line above'})
vim.keymap.set('n', '\'', ':call append(line(\'.\')-1, \'\')<cr>k', {desc = 'Push current line down'})
vim.keymap.set('n', '|', ':call append(line(\'.\'), \'\')<cr>', {desc = 'Insert empty line below'})
vim.keymap.set('n', 'K', 'i<cr><esc>k$', {desc = 'split line from cursor'})
-- vim.keymap.set({'n', 'v'}, '`', Commentator.ToggleComments, {desc = 'Toggle comment'})
-- vim.keymap.set({'n', 'v'}, '\\', Commentator.ForceComment, {desc = 'Force comment'})
vim.keymap.set('n', '`', 'gcc', {desc = 'Toggle comment', remap = true})
vim.keymap.set('v', '`', 'gc', {desc = 'Toggle comment', remap = true})
vim.keymap.set('n', '<leader>sr', ':%s/', {desc = "Search and replace entire file"})
vim.keymap.set('v', '<leader>sr', ':s/', {desc = "Search and replace within visual selection"})
-- vim.keymap.set('n', '<leader><space>', 'V:%s/', {desc = "Search and replace within current line"})
-- vim.keymap.set('v', '<leader><space>', ':s/', {desc = "Search and replace within current line"})
vim.keymap.set('n', 'J', 'gJ', {desc = 'Join lines without space'})
-- vim.keymap.set('v', '<c-t>', "/\\%.l", {desc = 'Visual mode select till search result on current line'})
vim.keymap.set({'n', 'v'}, 'c', '"_c', {desc = 'c actions to void register'})
vim.keymap.set({'n', 'v'}, 'X', 'd', {desc = 'X for cut (delete and write to shared register)'})
vim.keymap.set('n', 'd', '"dd', {desc = 'd actions to d register -'})
vim.keymap.set('n', 'dd', '"ddd', {desc = 'dd actions to d register -'})
vim.keymap.set('v', 'd', '"dd', {desc = 'd actions to d register -'})
vim.keymap.set({'n', 'v'}, '<c-p>', '"dp', {desc = 'paste from d register -'})
vim.keymap.set('v', 'p', '"ddP', {desc = 'visual mode paste without overwritting register'})

-- motion keymaps
vim.keymap.set('c', '<c-g>', '<up>', {desc = 'Previous command/search'})
vim.keymap.set('', '<c-h>', '_', {desc = 'Start of line'})
vim.keymap.set('i', '<c-h>', '<c-o>I', {desc = 'Start of line i'})
vim.keymap.set('', '<c-l>', 'g_', {desc = 'End of line'})
vim.keymap.set('i', '<c-l>', '<c-o>A', {desc = 'End of line i'})
vim.keymap.set('i', '<c-d>', '<left>', {desc = 'Input mode cursor left'})
vim.keymap.set('i', '<c-f>', '<right>', {desc = 'Input mode cursor right'})

vim.keymap.set({'n', 'v'}, '!', '?[[({\\])}]<cr>', {desc = 'Go to the previous bracket'})
vim.keymap.set({'n', 'v'}, ',', '/[[({\\])}]<cr>', {desc = 'Go to the next bracket'})
vim.keymap.set({'n', 'v'}, '^', '?[\'"`]<cr>', {desc = 'Go to the previous quote'})
vim.keymap.set({'n', 'v'}, '&', '/[\'"`]<cr>', {desc = 'Go to the next quote'})

vim.keymap.set({'n', 'v'}, '<c-t>', function() VerticalNonSpaceJump() end, {desc = 'jump to vertical non space'})
vim.keymap.set({'n', 'v'}, '<c-y>', function() VerticalNonSpaceJump(true) end, {desc = 'jump to vertical non space'})
function VerticalNonSpaceJump(backwards)
  require("flash").toggle(false)
  local flags = backwards and 'bW' or 'W'

  local firstCharColumn = vim.fn.match(vim.fn.getline('.'), '\\S')

  vim.fn.cursor({0, firstCharColumn + 1})
  local virtualColumn = vim.fn.virtcol('.')
  vim.fn.search('\\%' .. tostring(virtualColumn) .. 'v\\S', flags)
end

-- vim.keymap.set('n', 'F', function() SelectWord(true) end, {desc = 'Select word'})
-- vim.keymap.set('n', 'R', function() SelectWord(false) end, {desc = 'Select word'})
vim.keymap.set('n', '<leader>w', function() SelectWord(false) end, {desc = 'Select previous word'})
vim.keymap.set('n', '<leader>x', function() SelectWord(true) end, {desc = 'Select word'})
function SelectWord(forward)
  require("flash").jump({
  pattern = ".", -- initialize pattern with any char
  search = {
    forward = forward,
    mode = function(pattern)
      -- remove leading dot
      if pattern:sub(1, 1) == "." then
        pattern = pattern:sub(2)
      end
      -- return word pattern and proper skip pattern
      return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
    end,
  },
  -- select the range
  jump = { pos = "range" },
})
end

vim.keymap.set({'n', 'v'}, 'W', function() WordBeginningJump(true) end, {desc = 'Beginning of previous word'})
vim.keymap.set({'n', 'v'}, 'E', function() WordEndJump(true) end, {desc = 'End of previous word'})
vim.keymap.set({'n', 'v'}, 'w', function() WordBeginningJump() end, {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'e', function() WordEndJump() end, {desc = 'End of next word'})

function WordBeginningJump(backwards)
  require("flash").toggle(false)
  local flags = backwards and 'bW' or 'W'
  vim.fn.search('\\<', flags)
end

function WordEndJump(backwards)
  require("flash").toggle(false)
  local flags = backwards and 'beW' or 'eW'
  vim.fn.search('\\<\\w*\\>', flags)
end

vim.keymap.set('n', '~', ':qa<cr>', {desc = 'Exit nvim'})

vim.keymap.set({'n', 'v'}, 'x', '~h', {desc = 'Toggle case under cursor'})
vim.keymap.set('n', 'gm', '`', {desc = 'Jump to mark'})
vim.keymap.set({'n', 'v'}, 'ge', 'G', {desc = 'End of buffer'})

vim.keymap.set({'n', 'v'}, 'f', function() AdvancedSearch('/', true) end, {desc = 'Flash forward'})
vim.keymap.set({'n', 'v'}, 'r', function() AdvancedSearch('?', true) end, {desc = 'Flash backward'})
vim.keymap.set({'n', 'v'}, '/', function() AdvancedSearch('/', false) end, {desc = 'Search forward'})
vim.keymap.set({'n', 'v'}, '?', function() AdvancedSearch('?', false) end, {desc = 'Search backward'})

function AdvancedSearch(searchDirection, withFlash)
  require("flash").toggle(withFlash)
  vim.api.nvim_feedkeys(searchDirection, "n", false)
end

vim.keymap.set({'n', 'v'}, 'zj', 'zjzz', {desc = 'Center next fold below'})
vim.keymap.set({'n', 'v'}, 'zk', 'zkzz', {desc = 'Center previous fold above'})
vim.keymap.set('n', 'b', '<c-o>', {desc = 'Previous location'})
vim.keymap.set('n', 'B', '<c-i>', {desc = 'Next location'})

-- buffer actions
vim.keymap.set('n', '<leader>q', '<cmd>bp | bd #<cr>', {desc = 'delete current buffer'})
vim.keymap.set('n', 'gs', '<c-w>o<c-w>v', {desc = 'split current buffer and close all others'})

vim.keymap.set('v', 's', '<Plug>VSurround', {desc = 'visual surround selection'})
vim.keymap.set('n', 's', 'viw<Plug>VSurround', {desc = 'Surround followed by textobject'})

-- tab actions
-- vim.keymap.set('n', '<leader>tj', '<cmd>tabnew<cr>', {desc = 'Open a copy of the current buffer in new tab'})
-- vim.keymap.set('n', '<leader>tc', '<cmd>tabc<cr>', {desc = 'Close current tab'})
-- vim.keymap.set('n', '<c-a>j', '<cmd>tabnew<cr>', {desc = 'Open a copy of the current buffer in new tab'})
-- vim.keymap.set('n', '<c-a>c', '<cmd>tabc<cr>', {desc = 'Close current tab'})

-- Quit
vim.keymap.set('n', '<leader>z', '<cmd>qa<cr>', {desc = 'Quit vim'})

-- GrugFar
function GrugFarNewWindow()
  -- vim.cmd('tabnew %')
  vim.cmd('GrugFar')
end
vim.keymap.set({'n', 'v'}, 'gf', function() GrugFarNewWindow() end, {desc = 'GrugFar'})
function GrugFarWordNewWindow()
  vim.cmd(":lua require('grug-far').open({ startInInsertMode = false, prefills = { search = vim.fn.expand('<cword>') } })")
end
vim.keymap.set('n', 'gw', function() GrugFarWordNewWindow() end, {desc = 'GrugFar with word under cursor'})
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('grug-far-keybindings', { clear = true }),
  pattern = { 'grug-far' },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'gf', '2gecc', {desc = 'Clear search'})
  end,
})

-- fzf
local function vim_grep(args, bang)
  local query = ''
  if args ~= nil then
    query = vim.fn.shellescape(args)
  end

  local sh = 'git grep --line-number -- ' .. query
  local root = {dir = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")}
  vim.call('fzf#vim#grep', sh, 1, vim.call('fzf#vim#with_preview', root, 'right:50%', 'ctrl-/'), bang)
end
vim.api.nvim_create_user_command('GitGrep', function(c)
  vim_grep(c.args, c.bang)
end, { bang = true, nargs = '*' })
vim.keymap.set('n', 'G', '<cmd>GitGrep<cr>', {desc = 'Git Grep'})
vim.keymap.set('n', '<c-f>', '<cmd>GFiles<cr>', {desc = 'Git files'})

-- Fugitive keymaps
vim.keymap.set('n', '<c-g>', '<cmd>Git<cr>', {desc = 'Git'})
vim.keymap.set('n', '<leader>gg', '<cmd>G push<cr>', {desc = 'Git push'})
vim.keymap.set('n', '<leader>gc', '<cmd>G branch<cr>', {desc = 'Git branch'})
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', {desc = 'Git blame'})

-- git branch management
vim.keymap.set('n', '<leader>gd', function() GBranchDelete() end, {desc = 'Delete branch'})
function GBranchDelete()
	local filetype = vim.bo[0].filetype
	if filetype ~= 'git' then
		return
	end

	local branch = vim.fn.getline('.')
	local cursorLocation = vim.api.nvim_win_get_cursor(0)

	vim.cmd('G branch -D ' .. branch)
	vim.api.nvim_buf_delete(0, {})
	vim.cmd('G branch')
	vim.api.nvim_win_set_cursor(0, cursorLocation)
end

-- LSP keymaps, unattached, attached keymaps are in lsps.lua
vim.keymap.set('n', 'gr', '*', {desc = 'Place holder when no lsp to avoid accidentally hitting replace'})

-- movement center remap
vim.keymap.set('n', '*', '*zz', {desc = 'Center work search'})
vim.keymap.set('n', '#', '#zz', {desc = 'Center work search'})
vim.keymap.set('n', '(', 'Lzz', {desc = 'Center screen on page down'})
vim.keymap.set('n', ')', 'Hzz', {desc = 'Center screen on page up'})
-- vim.keymap.set('n', '[', '<c-e>M', {desc = 'Move view and cursor down', remap = false})
-- vim.keymap.set('n', ']', '<c-y>M', {desc = 'Move view and cursor up', remap = false})
vim.keymap.set('n', '+', 'nzz', {desc = 'Next search'})
vim.keymap.set('n', '-', 'Nzz', {desc = 'Previous search'})
vim.keymap.set('n', '{{',  '{{zz', {desc = 'Previous function start'})
vim.keymap.set('n', '}}',  '}}zz', {desc = 'Next function start'})
vim.keymap.set(
  'c', '<CR>',
  function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end,
  { expr = true }
)

vim.keymap.set({'', 'v'}, 'n', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
vim.keymap.set({'', 'v'}, 'J', 'gJ', {desc = 'Switch n and j'})
vim.keymap.set({'', 'v'}, 'N', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
-- vim.keymap.set('n', '<c-n>', 'Lzz', {desc = 'Switch n and j'})
vim.keymap.set('', '<c-l>', '<c-o>', { desc = 'Switch o and l' })
vim.keymap.set('', '<c-o>', 'g_', { desc = 'End of line' })
vim.keymap.set('i', '<c-l>', '<c-o>', {desc = 'Switch o and l'})
vim.keymap.set('i', '<c-o>', '<c-o>A', {desc = 'End of line i'})
vim.keymap.set('n', 'gj', 'gn', {desc = 'Switch n and j'})
