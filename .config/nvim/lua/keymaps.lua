local Commentator = require('commentator')

-- keymaps
vim.keymap.set({'', 't'}, '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('c', '<c-space>', '<c-c>', {desc = 'Ctrl-c to escape in command mode'})
vim.keymap.set('i', '<c-space>', '<esc>l', {desc = 'Escape and move cursor right'})
vim.keymap.set('c', '<c-i>', '<cr>', {desc = 'Enter in command mode'})
vim.keymap.set('c', '<c-h>', '<left>', {desc = 'Command mode cursor left'})
vim.keymap.set('c', '<c-j>', '<down>', {desc = 'Command mode cursor down'})
vim.keymap.set('c', '<c-k>', '<up>', {desc = 'Command mode cursor up'})
vim.keymap.set('c', '<c-l>', '<right>', {desc = 'Command mode cursor right'})
vim.keymap.set('c', '<c-o>', '<bs>', {desc = 'Normal mode delete'})
vim.keymap.set('n', '<leader>st', ToggleSectionB, {desc = 'Status Toggle'})
vim.keymap.set('i', '<c-s>', '<esc><cmd>silent! write<cr>l', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>silent! write<cr>', {desc = 'Save'})
-- /\%9 searches line 9, <c-r>= executes the following vim expression and <cr> to take the output into the original expression
-- line('.') returns the current line # of the cursor, and l allows for search
vim.keymap.set('n', 'f', '/\\%<c-r>=line(\'.\')<cr>l', {desc = 'Search within the current line'})
vim.keymap.set('n', 'F', '/', {desc = 'Search the current buffer'})
vim.keymap.set('c', '<c-a>', '/g', {desc = 'replace all in command mode s&r'})
vim.keymap.set('n', '<leader>c', '.', {desc = 'redo'})
vim.keymap.set('n', 'M', 'q', {desc = 'record macro'})
vim.keymap.set('n', '<c-2>', '@', {desc = 'access recording register'})
vim.keymap.set('i', '<tab>', '<tab>', {desc = '<c-i> over writting <tab> in insert mode'})

-- text editting
vim.keymap.set('n', '\'', ':call append(line(\'.\')-1, \'\')<cr>', {desc = 'Insert empty line above'})
vim.keymap.set('n', 'K', 'i<cr><esc>k$', {desc = 'split line from cursor'})
vim.keymap.set('n', '<leader>e', Commentator.CommentLine, {desc = 'Comment current or highlighted lines'})
vim.keymap.set('n', '<leader>r', Commentator.UncommentLine, {desc = 'Uncomment current or highlighted lines'})
vim.keymap.set('v', '<leader>e', ':lua Commentator.CommentLines()<cr>', {desc = 'Comment current or highlighted lines'})
vim.keymap.set('v', '<leader>r', ':lua Commentator.UncommentLines()<cr>', {desc = 'Uncomment current or highlighted lines'})
vim.keymap.set('n', '<leader>sr', ':%s/', {desc = "Search and replace entire file"})
vim.keymap.set('v', '<leader>sr', ':s/', {desc = "Search and replace within visual selection"})

-- motion keymaps
-- vim.keymap.set('', '#', '_', {desc = 'Beginning of line'})
-- vim.keymap.set('', '$', 'g_', {desc = 'End of line'})
-- dupes of the keymaps below
vim.keymap.set('', '<c-j>', '_', {desc = 'Start of line'})
vim.keymap.set('i', '<c-j>', '<c-o>I', {desc = 'Start of line i'})
vim.keymap.set('', '<c-k>', 'g_', {desc = 'End of line'})
vim.keymap.set('i', '<c-k>', '<c-o>A', {desc = 'End of line i'})
vim.keymap.set('i', '<c-d>', '<left>', {desc = 'Input mode cursor left'})
vim.keymap.set('i', '<c-f>', '<right>', {desc = 'Input mode cursor right'})
-- vim.keymap.set('i', '<c-e>', '<BS>', {desc = 'Input mode delete'})
vim.keymap.set({'n', 'v'}, 'q', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set({'n', 'v'}, 'Q', '?\\<<cr>e', {desc = 'Beginning of previous word'})
vim.keymap.set({'n', 'v'}, 'w', '/\\<<cr>', {desc = 'End of next word'})
vim.keymap.set({'n', 'v'}, 'W', '/\\<<cr>e', {desc = 'End of next word'})
vim.keymap.set({'n', 'v'}, 't', '%', {desc = 'Jump to matching character defined by mps'})
vim.keymap.set('i', '<c-l>', '<cr>', {desc = 'Enter in insert mode'})
vim.keymap.set({'n', 'v'}, 'x', '~h', {desc = 'Toggle case under cursor'})
vim.keymap.set('n', 'Z', 'zz', {desc = 'Center cursor to screen'})
vim.keymap.set('n', 'n', 'nzz', {desc = 'Center next search to screen'})
vim.keymap.set('n', 'N', 'Nzz', {desc = 'Center previous search to screen'})
vim.keymap.set('n', '<c-d>', '<c-d>zz', {desc = 'Center screen on page down'})
vim.keymap.set('n', '<c-u>', '<c-u>zz', {desc = 'Center screen on page up'})
-- vim.keymap.set('n', 'M', 'm', {desc = 'Set mark'})
vim.keymap.set('n', 'gm', '`', {desc = 'Jump to mark'})
vim.keymap.set('n', '<c-p>', '<c-i>', {desc = 'Newer location, opposite of <c-o>'})

-- buffer actions
vim.keymap.set('n', '<leader>q', '<cmd>bp | bd #<cr>', {desc = 'delete current buffer'})
vim.keymap.set('n', '<leader>aa', '<cmd>ls<cr>:b<space>', {desc = 'list and fuzzy search open buffers'})
vim.keymap.set('n', '<leader>as', '<cmd>ls<cr>:sb<space>', {desc = 'list and fuzzy search buffers, open in split'})
vim.keymap.set('n', '<leader>av', '<cmd>ls<cr>:vert sb<space>', {desc = 'list and fuzzy search buffers, open in vertical split'})
vim.keymap.set('n', '<c-h>', '<cmd>bp<cr>', {desc = 'previous buffer in list'})
vim.keymap.set('n', '<c-l>', '<cmd>bn<cr>', {desc = 'next buffer in list'})
vim.keymap.set('n', '<leader>6', '<c-6>', {desc = 'toggle previous buffer'})

-- NvimTree keymaps
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle NvimTree'})
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFindFileToggle<cr>', {desc = 'Refresh NvimTree'})

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

