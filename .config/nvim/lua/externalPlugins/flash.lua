local M = {
  "folke/flash.nvim",
  lazy = false,
  opts = {
    search = {
      mode = "fuzzy",
      wrap = false,
      -- how does this even work?
      -- trigger = "<c-i>",
    },
    modes = {
      search = {
        enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- { "<a-f>",     mode = { "n" }, function() require("flash").jump() end,              desc = "Flash" },
    -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    -- { "f",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}

return M
