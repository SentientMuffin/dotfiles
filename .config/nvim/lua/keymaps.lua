local Commentator = require('commentator')

-- keymaps
vim.keymap.set({'n', 'v'}, '<BS>', '<nop>', {desc = 'leader key no stand alone action', noremap = true})
vim.keymap.set({'', 'v'}, 'V', '<c-v>', {desc = 'Visual block mode'})
vim.keymap.set({'', 'v'}, '<c-q>', 'V', {desc = 'Visual block mode for windows'})
vim.keymap.set({'', 'v'}, '<c-v>', 'V', {desc = 'Visual line mode'})
vim.keymap.set({'', 't'}, '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('c', '<c-space>', '<c-c>', {desc = 'Ctrl-c to escape in command mode'})
vim.keymap.set('i', '<c-space>', '<esc>l', {desc = 'Escape and move cursor right'})
vim.keymap.set({'n', 'v'}, '<c-c>', ':', {desc = 'Command mode'})
vim.keymap.set('i', '<c-c>', '<c-c><right>', {desc = 'Escape insert mode'})
-- <c-i> is <tab> by default
-- vim.keymap.set('c', '<c-i>', '<cr>', {desc = 'Enter in command mode'})
-- vim.keymap.set('c', '<c-h>', '<left>', {desc = 'Command mode cursor left'})
-- vim.keymap.set('c', '<c-j>', '<down>', {desc = 'Command mode cursor down'})
-- vim.keymap.set('c', '<c-k>', '<up>', {desc = 'Command mode cursor up'})
-- vim.keymap.set('c', '<c-l>', '<right>', {desc = 'Command mode cursor right'})
-- vim.keymap.set('c', '<c-o>', '<bs>', {desc = 'Normal mode delete'})
vim.keymap.set('n', '<leader>st', ToggleSectionB, {desc = 'Status Toggle'})
-- silent = true in opts does not work dfor save
vim.keymap.set('i', '<c-s>', '<esc><cmd>silent! write<cr>l', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>silent! write<cr>', {desc = 'Save'})
-- /\%9 searches line 9, <c-r>= executes the following vim expression and <cr> to take the output into the original expression
-- line('.') returns the current line # of the cursor, and l allows for search
vim.keymap.set('n', 'f', '/\\%<c-r>=line(\'.\')<cr>l', {desc = 'Search within the current line'})
vim.keymap.set('v', 'f', '<esc>/\\%V', {desc = 'Search within the visual selection'})
vim.keymap.set('n', 'F', '/', {desc = 'Search the current buffer'})
vim.keymap.set('c', '<c-a>', '/g', {desc = 'replace all in command mode s&r'})
vim.keymap.set('n', '<leader>c', '.', {desc = 'redo'})
vim.keymap.set('n', 'M', 'q', {desc = 'record macro'})
vim.keymap.set('n', '<c-2>', '@', {desc = 'access recording register'})
-- vim.keymap.set('n', '<c-e>', '<c-y>', {desc = 'Page down'})
vim.keymap.set('n', '<c-r>', '<c-y>', {desc = 'Page down'})
vim.keymap.set('n', 'R', '<c-r>', {desc = 'Redo'})

-- text editting
vim.keymap.set('n', '\'', ':call append(line(\'.\')-1, \'\')<cr>', {desc = 'Insert empty line above'})
vim.keymap.set('n', '"', ':call append(line(\'.\'), \'\')<cr>', {desc = 'Insert empty line above'})
vim.keymap.set('n', 'K', 'i<cr><esc>k$', {desc = 'split line from cursor'})
vim.keymap.set('n', '<leader>e', Commentator.CommentLine, {desc = 'Comment current or highlighted lines'})
vim.keymap.set('n', '<leader>r', Commentator.UncommentLine, {desc = 'Uncomment current or highlighted lines'})
vim.keymap.set('v', '<leader>e', ':lua Commentator.CommentLines()<cr>', {desc = 'Comment current or highlighted lines'})
vim.keymap.set('v', '<leader>r', ':lua Commentator.UncommentLines()<cr>', {desc = 'Uncomment current or highlighted lines'})
vim.keymap.set('n', '<leader>sr', ':%s/', {desc = "Search and replace entire file"})
vim.keymap.set('v', '<leader>sr', ':s/', {desc = "Search and replace within visual selection"})
vim.keymap.set('n', 'J', 'gJ', {desc = 'Join lines without space'})
vim.keymap.set('v', 's', 'S', {desc = 'Visual mode surround'})
-- map copy to t
vim.keymap.set({'n', 'v'}, 't', 'y', {desc = 'Copy to clipboard'})
vim.keymap.set('n', 'tt', 'yy', {desc = 'Copy to clipboard'})
vim.keymap.set('n', 'tas', 'g@iw', {desc = 'Add Surroud'})

-- motion keymaps
vim.keymap.set('', '<c-h>', '_', {desc = 'Start of line'})
vim.keymap.set('i', '<c-h>', '<c-o>I', {desc = 'Start of line i'})
vim.keymap.set('', '<c-l>', 'g_', {desc = 'End of line'})
vim.keymap.set('i', '<c-l>', '<c-o>A', {desc = 'End of line i'})
vim.keymap.set('i', '<c-d>', '<left>', {desc = 'Input mode cursor left'})
vim.keymap.set('i', '<c-f>', '<right>', {desc = 'Input mode cursor right'})

-- use \> for end of word, need to deal with the extra space
vim.keymap.set('n', 'q', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('n', 'Q', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set('v', 'q', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('v', 'Q', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set({'n', 'v'}, 'w', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'W', '/\\>/e-1<cr>', {desc = 'End of next word'})
vim.keymap.set({'n', 'v'}, 'w', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'W', '/\\>/e-1<cr>', {desc = 'End of next word'})

vim.keymap.set('n', 'w', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('n', 'W', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set('v', 'w', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('v', 'W', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set({'n', 'v'}, 'E', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})
vim.keymap.set({'n', 'v'}, 'E', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})

-- vim.keymap.set({'n', 'v'}, 't', '%', {desc = 'Jump to matching character defined by mps'})
-- vim.keymap.set('i', '<c-l>', '<cr>', {desc = 'Enter in insert mode'})
vim.keymap.set({'n', 'v'}, 'x', '~h', {desc = 'Toggle case under cursor'})
vim.keymap.set('n', '<c-j>', 'Lzz', {desc = 'Center screen on page down'})
vim.keymap.set('n', '<c-k>', 'Hzz', {desc = 'Center screen on page up'})
vim.keymap.set('n', 'gm', '`', {desc = 'Jump to mark'})
vim.keymap.set('n', '<c-p>', '<c-i>', {desc = 'Newer location, opposite of <c-o>'})
vim.keymap.set('n', 'gw', '*', {desc = 'Search word under cursor'})

-- buffer actions
vim.keymap.set('n', '<leader>q', '<cmd>bp | bd #<cr>', {desc = 'delete current buffer'})
vim.keymap.set('n', '<leader>aa', '<cmd>ls<cr>:b<space>', {desc = 'list and fuzzy search open buffers'})
vim.keymap.set('n', '<leader>as', '<cmd>ls<cr>:sb<space>', {desc = 'list and fuzzy search buffers, open in split'})
vim.keymap.set('n', '<leader>av', '<cmd>ls<cr>:vert sb<space>', {desc = 'list and fuzzy search buffers, open in vertical split'})
vim.keymap.set('n', '<a-s>', '<cmd>bp<cr>', {desc = 'previous buffer in list'})
vim.keymap.set('n', '<a-f>', '<cmd>bn<cr>', {desc = 'next buffer in list'})
vim.keymap.set('n', '<leader>6', '<c-6>', {desc = 'toggle previous buffer'})
vim.keymap.set('n', 'gs', '<c-w>o<c-w>v<c-w>lgd', {desc = 'split and move definition to the right'})

-- NvimTree keymaps
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeFocus<cr>', {desc = 'Toggle NvimTree'})
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFindFile<cr>', {desc = 'Refresh NvimTree'})

-- Vim surround override on s
vim.keymap.set('n', 's', '<Plug>Ysurround', {desc = 'surround followed by textobject'})
vim.keymap.set('v', 's', '<Plug>VSurround', {desc = 'visual surround selection'})
vim.keymap.set('n', 'S', '<Plug>YSurround', {desc = 'Surround followed by textobject'})

-- Fugitive keymaps
vim.keymap.set('n', '<c-g>', '<cmd>Git<cr>', {desc = 'Git'})
vim.keymap.set('n', '<c-f>', '<cmd>GFiles<cr>', {desc = 'Git files'})
vim.keymap.set('n', '<leader>gp', '<cmd>G push<cr>', {desc = 'Git push'})
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

-- quickfix window
vim.keymap.set('n', '<leader>v', '<cmd>copen<cr>', {desc = 'Open quickfix list'})
vim.api.nvim_create_autocmd('BufWinEnter', {
	callback = function()
		local filetype = vim.bo[0].filetype
		if filetype == 'qf' then
			-- vim.keymap.set('n', '<cr>', '<c-M>')
			-- vim.keymap.set('n', 'o', '<cr>zz<c-w><c-w>')
			vim.keymap.set('n', '<leader>v', '<cmd>ccl<cr>', {desc = 'Close quickfix list'})
		end
	end,
})

vim.api.nvim_create_autocmd('BufLeave', {
	callback = function()
		local filetype = vim.bo[0].filetype
		if filetype == 'qf' then
			vim.keymap.set('n', '<leader>v', '<cmd>copen<cr>', {desc = 'Open quickfix list'})
		end
	end,
})

-- special keyboard layout
-- N <> J switch !!!
-- vim.keymap.set('n', 'n', 'nzz', {desc = 'Center next search to screen'})
-- vim.keymap.set('n', 'N', 'Nzz', {desc = 'Center previous search to screen'})
function NtoJ()
  vim.keymap.set({'', 'v'}, 'n', 'j', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'j', 'nzz', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'N', 'gJ', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'J', 'Nzz', {desc = 'Switch n and j'})
  vim.keymap.set('n', '<c-n>', 'Lzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>n', '<c-w>j', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>N', '<c-w>J', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-n>', '<c-w><c-j>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>j', '<c-w>n', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>J', '<c-w>N', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-j>', '<c-w><c-n>', {desc = 'Switch n and j'})

  -- O <> L switch !!!
  vim.keymap.set({'', 'v'}, 'l', 'o', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'o', 'l', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'O', 'L', {desc = 'Switch o and l'})
  vim.keymap.set({'', 'v'}, 'L', 'O', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-l>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('', '<c-o>', 'g_', {desc = 'End of line'})
  vim.keymap.set('i', '<c-l>', '<c-o>', {desc = 'Switch o and l'})
  vim.keymap.set('i', '<c-o>', '<c-o>A', {desc = 'End of line i'})
  vim.keymap.set({'n', 'v'}, '<c-w>o', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-o>', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>l', '<c-w>o', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-l>', '<c-w><c-o>', {desc = 'Switch o and l'})
end
vim.keymap.set('n', '<leader>asdf', function() NtoJ() end, {desc = 'Switch n and j'})
-- defualt for now
NtoJ()

function JtoN()
  vim.keymap.set({'', 'v'}, 'j', 'j', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'n', 'nzz', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'J', 'gJ', {desc = 'Switch n and j'})
  vim.keymap.set({'', 'v'}, 'N', 'Nzz', {desc = 'Switch n and j'})
  vim.keymap.set('n', '<c-j>', 'Lzz', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>j', '<c-w>j', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>J', '<c-w>J', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-j>', '<c-w><c-j>', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>n', '<c-w>n', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w>N', '<c-w>N', {desc = 'Switch n and j'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-n>', '<c-w><c-n>', {desc = 'Switch n and j'})

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
  vim.keymap.set({'n', 'v'}, '<c-w><c-l>', '<c-w>l', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w>o', '<c-w>o', {desc = 'Switch o and l'})
  vim.keymap.set({'n', 'v'}, '<c-w><c-o>', '<c-w><c-o>', {desc = 'Switch o and l'})
end
vim.keymap.set('n', '<leader>,', function() JtoN() end, {desc = 'Switch j and n'})
