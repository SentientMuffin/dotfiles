local Commentator = require('commentator')

-- keymaps
-- vim.keymap.set({'', 't'}, '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('n', '<c-space>', '<nop>', {desc = 'No op in normal mode'})
vim.keymap.set('c', '<c-space>', '<c-c>', {desc = 'Ctrl-c to escape in command mode'})
vim.keymap.set('i', '<c-space>', '<esc>l', {desc = 'Escape and move cursor right'})
vim.keymap.set('v', '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('i', '<c-[>', '<c-o>:stopinsert<cr>', {desc = 'Escape and move cursor right', noremap = true})
vim.keymap.set({'n', 'v'}, '<c-c>', ':', {desc = 'Command mode'})
vim.keymap.set('i', '<c-c>', '<c-o>:stopinsert<cr>', {desc = 'Escape insert mode'})
vim.keymap.set('n', '<leader>st', ToggleSectionB, {desc = 'Status Toggle'})
vim.keymap.set('i', '<c-s>', '<esc><cmd>silent! write<cr>l', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>silent! write<cr>', {desc = 'Save'})
vim.keymap.set('c', '<c-g>', '/g', {desc = 'replace all in command mode s&r'})
vim.keymap.set({'n', 'v'}, '<c-r>', '<c-y>', {desc = 'Page down'})
vim.keymap.set('n', 'U', '<c-r>', {desc = 'Redo'})
vim.keymap.set('n', '<leader>cd', '<cmd>let @+ = expand(\'%:p:h\')<cr>', {desc = 'Copy current directory'})

-- text editting
vim.keymap.set({'n', 'v'}, 'R', 'r', {desc = 'Replace'})
vim.keymap.set('n', '"', ':call append(line(\'.\')-1, \'\')<cr>', {desc = 'Insert empty line above'})
vim.keymap.set('n', '\'', ':call append(line(\'.\')-1, \'\')<cr>k', {desc = 'Push current line down'})
vim.keymap.set('n', '|', ':call append(line(\'.\'), \'\')<cr>', {desc = 'Insert empty line below'})
vim.keymap.set('n', 'K', 'i<cr><esc>k$', {desc = 'split line from cursor'})
vim.keymap.set({'n', 'v'}, '`', Commentator.ToggleComments, {desc = 'Toggle comment'})
vim.keymap.set({'n', 'v'}, '\\', Commentator.ForceComment, {desc = 'Force comment'})
vim.keymap.set('n', '<leader>sr', ':%s/', {desc = "Search and replace entire file"})
vim.keymap.set('v', '<leader>sr', ':s/', {desc = "Search and replace within visual selection"})
vim.keymap.set('n', '<leader>sl', 'V:%s/', {desc = "Search and replace within current line"})
vim.keymap.set('v', '<leader>sl', ':s/', {desc = "Search and replace within current line"})
vim.keymap.set('n', 'J', 'gJ', {desc = 'Join lines without space'})
vim.keymap.set('v', 's', 'S', {desc = 'Visual mode surround'})
vim.keymap.set('v', 't', "/\\%.l", {desc = 'Visual mode select till search result on current line'})
vim.keymap.set({'n', 'v'}, 'c', '"_c', {desc = 'c actions to void register'})
vim.keymap.set({'n', 'v'}, 'X', 'd', {desc = 'X for cut (delete and write to shared register)'})
vim.keymap.set('n', 'd', '"dd', {desc = 'd actions to d register -'})
vim.keymap.set('n', 'dd', '"ddd', {desc = 'dd actions to d register -'})
vim.keymap.set('v', 'd', '"dd', {desc = 'd actions to d register -'})
vim.keymap.set({'n', 'v'}, '<c-p>', '"dp', {desc = 'paste from d register -'})
vim.keymap.set('v', 'p', '"ddP', {desc = 'visual mode paste without overwritting register'})

-- motion keymaps
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

vim.keymap.set({'n', 'v'}, 'x', '~h', {desc = 'Toggle case under cursor'})
vim.keymap.set('n', '<c-j>', 'Lzz', {desc = 'Center screen on page down'})
vim.keymap.set('n', '<c-k>', 'Hzz', {desc = 'Center screen on page up'})
vim.keymap.set('n', 'gm', '`', {desc = 'Jump to mark'})
vim.keymap.set({'n', 'v'}, 'ge', 'G', {desc = 'End of buffer'})
vim.keymap.set('n', '+', 'nzz', {desc = 'Next search'})
vim.keymap.set('n', '-', 'Nzz', {desc = 'Previous search'})

vim.keymap.set({'n', 'v'}, 'f', function() AdvancedSearch('/', true) end, {desc = 'Flash forward'})
vim.keymap.set({'n', 'v'}, 'F', function() AdvancedSearch('?', true) end, {desc = 'Flash backward'})
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
vim.keymap.set('n', '<leader>aa', '<cmd>ls<cr>:b<space>', {desc = 'list and fuzzy search open buffers'})
vim.keymap.set('n', '<leader>as', '<cmd>ls<cr>:sb<space>', {desc = 'list and fuzzy search buffers, open in split'})
vim.keymap.set('n', '<leader>av', '<cmd>ls<cr>:vert sb<space>', {desc = 'list and fuzzy search buffers, open in vertical split'})
vim.keymap.set('n', '<a-s>', '<cmd>bp<cr>', {desc = 'previous buffer in list'})
vim.keymap.set('n', '<a-f>', '<cmd>bn<cr>', {desc = 'next buffer in list'})
vim.keymap.set('n', '<leader>6', '<c-6>', {desc = 'toggle previous buffer'})
vim.keymap.set('n', 'gs', '<c-w>o<c-w>v<c-w><right>gd', {desc = 'split and move definition to the right'})

vim.keymap.set('v', 's', '<Plug>VSurround', {desc = 'visual surround selection'})
vim.keymap.set('n', 's', '<Plug>YSusround', {desc = 'Surround followed by textobject'})

-- tab actions
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', {desc = 'Open a copy of the current buffer in new tab'})
vim.keymap.set('n', '<leader>tc', '<cmd>tabc<cr>', {desc = 'Close current tab'})

-- GrugFar
function GrugFarNewWindow()
  vim.cmd('tabnew %')
  vim.cmd('GrugFar')
end
vim.keymap.set({'n', 'v'}, 'gf', function() GrugFarNewWindow() end, {desc = 'GrugFar'})

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
vim.keymap.set('n', '<leader>d', function() GBranchDelete() end, {desc = 'Delete branch'})
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

-- special keyboard layout
-- N <> J switch !!!
-- vim.keymap.set('n', 'n', 'nzz', {desc = 'Center next search to screen'})
-- vim.keymap.set('n', 'N', 'Nzz', {desc = 'Center previous search to screen'})
function NtoJ()
  vim.keymap.set({'', 'v'}, 'n', 'j', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'j', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'N', 'gJ', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'J', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
  vim.keymap.set('n', '<c-n>', 'Lzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>n', '<c-w>j', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>N', '<c-w>J', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-n>', '<c-w><c-j>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>j', '<c-w>n', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>J', '<c-w>N', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-j>', '<c-w><c-n>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zn', 'zjzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zN', 'zJ', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zj', 'zn', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zJ', 'zN', {desc = 'Switch n and j'})

  -- O <> L switch !!!
  vim.keymap.set({'', 'v'}, 'l', 'o', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'o', 'l', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'O', 'L', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'L', 'O', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-l>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-o>', 'g_', {desc = 'End of line'})
  vim.keymap.set({'n', 'v'}, '<c-w>o', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set('i', '<c-l>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('i', '<c-o>', '<c-o>A', {desc = 'End of line i'})
  vim.keymap.set({'n', 'v'}, '<c-w>o', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>l', '<c-w>o', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>O', '<c-w>L', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>L', '<c-w>O', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-o>', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-l>', '<c-w><c-o>', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, 'zo', 'zl', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zO', 'zL', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zl', 'zo', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zL', 'zO', {desc = 'Switch n and j'})
end
vim.keymap.set('n', '<leader>asdf', function() NtoJ() end, {desc = 'Switch n and j'})
-- defualt for now
NtoJ()

function JtoN()
  vim.keymap.set({'', 'v'}, 'j', 'j', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'n', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'J', 'gJ', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'N', '<cmd>Buffers<cr>', {desc = 'Switch n and j'})
  vim.keymap.set('n', '<c-j>', 'Lzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>j', '<c-w>j', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>J', '<c-w>J', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-j>', '<c-w><c-j>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>n', '<c-w>n', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>N', '<c-w>N', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-n>', '<c-w><c-n>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zn', 'zn', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zN', 'zN', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zj', 'zjzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zJ', 'zJ', {desc = 'Switch n and j'})

  -- O <> L switch !!!
  vim.keymap.set({'', 'v'}, 'l', 'l', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'o', 'o', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'O', 'O', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'L', 'L', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-o>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-l>', 'g_', {desc = 'End of line'})
  vim.keymap.set('i', '<c-o>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('i', '<c-l>', '<c-o>A', {desc = 'End of line i'})
  vim.keymap.set({'n', 'v'}, '<c-w>l', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>o', '<c-w>o', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>L', '<c-w>L', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>O', '<c-w>O', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-l>', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-o>', '<c-w><c-o>', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, 'zo', 'zo', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zO', 'zO', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zl', 'zl', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, 'zL', 'zL', {desc = 'Switch n and j'})
end
vim.keymap.set('n', '<leader>,', function() JtoN() end, {desc = 'Switch j and n'})

-- movement center remap
vim.keymap.set('n', '{{',  '{{zz')
vim.keymap.set('n', '}}',  '}}zz')
vim.keymap.set(
  'c', '<CR>',
  function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end,
  { expr = true }
)
