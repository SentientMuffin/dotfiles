local M = {
  "yorickpeterse/nvim-window",
  keys = {
    { "<leader><space>", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = true,
}

return M
