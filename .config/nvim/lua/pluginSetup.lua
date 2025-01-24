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

require("eldritch")

require('nvim-treesitter.configs').setup{
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

require('copilot').setup({
  panel = { enabled = false },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<a-i>",
      accept_word = "<a-a>",
      accept_line = "<a-l>",
      next = "<a-k>",
      prev = "<a-j>",
      dismiss = "<c-e>"
    },
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

require("mystatusline")
