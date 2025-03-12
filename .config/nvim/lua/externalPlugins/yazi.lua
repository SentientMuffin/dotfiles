local M = {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    -- {
    -- "<leader>f",
    -- function()
    -- require("yazi").yazi()
    -- end,
    -- desc = "Open the file manager",
    -- },
    {
      -- Open in the current working directory
      -- "<leader>f",
      "<c-d>",
      function()
        -- require("yazi").yazi(nil, vim.fn.getcwd())
        require("yazi").yazi(nil, vim.fn.expand('%'))
      end,
      desc = "Open the file manager in nvim's working directory" ,
    },
    { -- Open in the current git project root
      "<leader>g",
      function()
        local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
        if vim.v.shell_error ~= 0 then
          root = "%"
        end
        require("yazi").yazi(nil, root)
      end,
      desc = "Open the file manager in current git root" ,
    },
    opts = {
      open_for_directories = false,
    },
  }
}

return M
