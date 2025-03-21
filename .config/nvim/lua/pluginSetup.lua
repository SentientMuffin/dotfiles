local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
  }),
  completion = {
    keyword_length = 1,
  },
  sources = cmp.config.sources({
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

require("ibl").setup({
	indent = {
		char = "╎",
		tab_char = "│",
	},
})

-- require("eldritch")
local treesitterconfig = require("nvim-treesitter.configs")
treesitterconfig.typescript = {
  enable = true,
  -- disable = { "javascript" },
}
treesitterconfig.tsx = {
  enable = true,
  -- disable = { "typescript" },
}
treesitterconfig.go = {
  enable = true,
}
treesitterconfig.lua = {
  enable = true,
}
treesitterconfig.setup{
	highlight = {
		enable = true,
    disable = {
    },
	},
	ensure_installed = {
		"c", "lua", "go", "tsx",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "t",
      scope_incremental = false,
			node_incremental = "t",
			node_decremental = "T",
		},
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = false,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
				["ir"] = "@assignment.rhs",
				["il"] = "@assignment.lhs",
				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",
      },
      selection_modes = {
        ['@function.outer'] = 'V', -- linewise
        ['@function.inner'] = 'V', -- linewise
        ['@parameter.outer'] = 'v', -- charwise
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["}}"] = "@function.outer",
      },
      goto_next_end = {
        ["]]"] = "@parameter.inner",
        ["{}"] = "@function.outer",
      },
      goto_previous_start = {
        -- ["[["] = "@parameter.inner",
        ["{{"] = "@function.outer",
      },
      goto_previous_end = {
        ["[["] = "@parameter.inner",
        ["}{"] = "@function.outer",
      },
    },
  },
}

require('bqf').setup {
	func_map = {
		-- doesn't work, <c-f> is already mapped
		-- fzffilter = '<c-f>',
	},
}

-- require('copilot').setup({
--   panel = { enabled = false },
--   suggestion = {
--     enabled = true,
--     auto_trigger = true,
--     debounce = 75,
--     keymap = {
--       accept = "<a-i>",
--       accept_word = "<a-a>",
--       accept_line = "<a-l>",
--       next = "<a-k>",
--       prev = "<a-j>",
--       dismiss = "<c-e>"
--     },
--   },
--   copilot_node_command = 'node', -- Node.js version must be > 18.x
--   server_opts_overrides = {},
-- })

require("mystatusline")

require('nvim-window').setup({
  -- The characters available for hinting windows.
  -- chars = {
  --   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  --   'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  -- },
  chars = {
    's', 'd', 'f', 'n', 'k', 'o',
  },

  -- A group to use for overwriting the Normal highlight group in the floating
  -- window. This can be used to change the background color.
  normal_hl = 'Todo',

  -- The highlight group to apply to the line that contains the hint characters.
  -- This is used to make them stand out more.
  hint_hl = 'MatchParen',

  -- The border style to use for the floating window.
  border = 'double',

  -- How the hints should be rendered. The possible values are:
  --
  -- - "float" (default): renders the hints using floating windows
  -- - "status": renders the hints to a string and calls `redrawstatus`,
  --   allowing you to show the hints in a status or winbar line
  render = 'float',
})

-- Lua config
local actions = require("diffview.actions")

require("diffview").setup({
  keymaps = {
    file_panel = {
      { "n", "<space>",           actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
    },
  },
})

