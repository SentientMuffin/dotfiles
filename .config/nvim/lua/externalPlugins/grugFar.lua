local M = {
  -- grugfar
  'MagicDuck/grug-far.nvim',
  config = function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error ~= 0 then
      root = "%"
    end
    -- doesn't work ???
    -- vim.g.maplocalleader = ' ';
    require('grug-far').setup({
      transient = true,
      startInInsertMode = true,
      -- searchOnInsertLeave = true,
      normalModeSearch = true,
      prefills = {
        paths = root,
        -- flags = '--hidden',
      },
      keymaps = {
        replace = { n = '<localleader>r' },
        qflist = { n = '<leader>q' },
        syncLocations = { n = '<localleader>s' },
        syncLine = { n = '<localleader>l' },
        close = { n = '<c-space>' },
        historyOpen = { n = '<localleader>t' },
        historyAdd = { n = '<localleader>a' },
        refresh = { n = '<localleader>f' },
        -- openLocation = { n = '<tab>' },
        openNextLocation = { n = '<down>' },
        openPrevLocation = { n = '<up>' },
        gotoLocation = { n = '<enter>' },
        pickHistoryEntry = { n = '<enter>' },
        abort = { n = '<localleader>b' },
        help = { n = 'g?' },
        toggleShowCommand = { n = '<leader>p' },
        swapEngine = { n = '<localleader>e' },
        previewLocation = { n = '<localleader>i' },
      },
      -- windowCreationCommand = 'tabnew % | vsplit',
      windowCreationCommand = 'only | vsplit',
    })
  end
}

return M
