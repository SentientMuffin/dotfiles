local Commentator = require('commentator')

-- keymaps
vim.keymap.set({'', 't'}, '<c-space>', '<esc>', {desc = 'Escape'})
vim.keymap.set('c', '<c-space>', '<c-c>', {desc = 'Ctrl-c to escape in command mode'})
vim.keymap.set('i', '<c-space>', '<esc>l', {desc = 'Escape and move cursor right'})
vim.keymap.set('i', '<c-[>', '<c-o>:stopinsert<cr>', {desc = 'Escape and move cursor right', noremap = true})
vim.keymap.set({'n', 'v'}, '<c-c>', ':', {desc = 'Command mode'})
vim.keymap.set('i', '<c-c>', '<c-o>:stopinsert<cr>', {desc = 'Escape insert mode'})
vim.keymap.set('n', '<leader>st', ToggleSectionB, {desc = 'Status Toggle'})
vim.keymap.set('i', '<c-s>', '<esc><cmd>silent! write<cr>l', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>silent! write<cr>', {desc = 'Save'})
vim.keymap.set('c', '<c-g>', '/g', {desc = 'replace all in command mode s&r'})
vim.keymap.set('n', '<leader>c', '.', {desc = 'Repeat previous action'})
vim.keymap.set('n', 'M', 'q', {desc = 'record macro'})
vim.keymap.set('n', '<c-r>', '<c-y>', {desc = 'Page down'})
vim.keymap.set('n', 'U', '<c-r>', {desc = 'Redo'})
vim.keymap.set('n', '<c-y>', '<cmd>let @" = expand(\'%\')<cr>', {desc = 'Copy current directory'})

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
vim.keymap.set('n', '<leader>sl', 'V:%s/', {desc = "Search and replace within current line"})
vim.keymap.set('v', '<leader>sl', ':s/', {desc = "Search and replace within current line"})
vim.keymap.set('n', 'J', 'gJ', {desc = 'Join lines without space'})
vim.keymap.set('v', 's', 'S', {desc = 'Visual mode surround'})
vim.keymap.set('v', 't', "/\\%.l", {desc = 'Visual mode select till search result on current line'})

-- motion keymaps
vim.keymap.set('', '<c-h>', '_', {desc = 'Start of line'})
vim.keymap.set('i', '<c-h>', '<c-o>I', {desc = 'Start of line i'})
vim.keymap.set('', '<c-l>', 'g_', {desc = 'End of line'})
vim.keymap.set('i', '<c-l>', '<c-o>A', {desc = 'End of line i'})
vim.keymap.set('i', '<c-d>', '<left>', {desc = 'Input mode cursor left'})
vim.keymap.set('i', '<c-f>', '<right>', {desc = 'Input mode cursor right'})

-- vim.keymap.set('n', 'w', '?\\<<cr>', {desc = 'Beginning of previous word'})
-- vim.keymap.set('n', 'W', '?\\><cr>h', {desc = 'End of previous word'})
-- vim.keymap.set('v', 'w', '?\\<<cr>', {desc = 'Beginning of previous word'})
-- vim.keymap.set('v', 'W', '?\\><cr>h', {desc = 'End of previous word'})
-- vim.keymap.set({'n', 'v'}, 'E', '/\\<<cr>', {desc = 'Beginning of next word'})
-- vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})
-- vim.keymap.set({'n', 'v'}, 'E', '/\\<<cr>', {desc = 'Beginning of next word'})
-- vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})

vim.keymap.set('n', 'W', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('n', 'E', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set('v', 'W', '?\\<<cr>', {desc = 'Beginning of previous word'})
vim.keymap.set('v', 'E', '?\\><cr>h', {desc = 'End of previous word'})
vim.keymap.set({'n', 'v'}, 'w', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})
vim.keymap.set({'n', 'v'}, 'w', '/\\<<cr>', {desc = 'Beginning of next word'})
vim.keymap.set({'n', 'v'}, 'e', '/\\>/e-1<cr>', {desc = 'End of next word'})

vim.keymap.set({'n', 'v'}, 'x', '~h', {desc = 'Toggle case under cursor'})
vim.keymap.set('n', '<c-j>', 'Lzz', {desc = 'Center screen on page down'})
vim.keymap.set('n', '<c-k>', 'Hzz', {desc = 'Center screen on page up'})
vim.keymap.set('n', 'gm', '`', {desc = 'Jump to mark'})
vim.keymap.set('n', 'gw', '*', {desc = 'Search word under cursor'})
vim.keymap.set({'n', 'v'}, 'ge', 'G', {desc = 'End of buffer'})
vim.keymap.set('n', '+', 'nzz', {desc = 'Next search'})
vim.keymap.set('n', '-', 'Nzz', {desc = 'Previous search'})
vim.keymap.set('v', 'f', 'y/<c-r>"<cr>', {desc = 'Search for selected content'})

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
vim.keymap.set('n', 's', '<Plug>YSurround', {desc = 'Surround followed by textobject'})

-- GrugFar
vim.keymap.set('n', '<leader>F', '<cmd>GrugFar<cr>')

-- Spectre
vim.keymap.set('', '<a-s>', '<cmd>ToggleSpectre<cr>')
function ToggleSpectre()
  local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
  if vim.v.shell_error ~= 0 then
    root = "%"
  end

  local state = require('spectre.state')
  if state.is_open then
    require('spectre').toggle()
  else
    require('spectre').open({
      cwd=root,
    })
  end
end
vim.api.nvim_create_user_command('ToggleSpectre', function()
  ToggleSpectre()
end, { bang = true, nargs = '*' })

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
-- set in n<>j switch at the end of the file
-- vim.keymap.set('n', 'j', '<cmd>Buffers<cr>', {desc = 'Buffer fuzzy search'})


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
-- coc.nvim
-- GoTo code navigation
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
-- vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- quickfix window
-- vim.keymap.set('n', '<leader>v', '<cmd>copen<cr>', {desc = 'Open quickfix list'})
-- vim.api.nvim_create_autocmd('BufWinEnter', {
	-- callback = function()
		-- local filetype = vim.bo[0].filetype
		-- if filetype == 'qf' then
			-- -- vim.keymap.set('n', '<cr>', '<c-M>')
			-- -- vim.keymap.set('n', 'o', '<cr>zz<c-w><c-w>')
			-- vim.keymap.set('n', '<leader>v', '<cmd>ccl<cr>', {desc = 'Close quickfix list'})
		-- end
	-- end,
-- })

-- vim.api.nvim_create_autocmd('BufLeave', {
	-- callback = function()
		-- local filetype = vim.bo[0].filetype
		-- if filetype == 'qf' then
			-- vim.keymap.set('n', '<leader>v', '<cmd>copen<cr>', {desc = 'Open quickfix list'})
		-- end
	-- end,
-- })

-- no neck pain
vim.keymap.set({'n'}, '<leader>p', function() LeftNeckPain() end, {desc = 'Toggle NoNeckPain'})
function LeftNeckPain()
  vim.cmd('NoNeckPain')
  -- vim.cmd('NoNeckPainToggleRightSide')
end

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

-- nvim leap
vim.keymap.set({'n', 'x', 'o'}, 'f',  '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'F',  '<Plug>(leap-backward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'gf', '<Plug>(leap-from-window)')
-- vim.keymap.set({'n', 'x', 'o'}, ',',  '<Plug>(leap)')

