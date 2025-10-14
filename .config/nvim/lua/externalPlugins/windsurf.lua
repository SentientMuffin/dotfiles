local M = {
  'Exafunction/windsurf.vim',
  event = 'bufEnter',
  config = function ()
    vim.keymap.set('i', '<A-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-w>', function() return vim.fn['codeium#AcceptNextWord']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-e>', function() return vim.fn['codeium#AcceptNextLine']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

    vim.keymap.set('i', '<A-a>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
  end
}

return M
