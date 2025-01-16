-- local Input = require("nui.input")
-- local event = require("nui.utils.autocmd").event

-- local input = Input({
  -- relative = "cursor",
  -- position = {
    -- row = 2,
    -- col = 0,
  -- },
  -- size = {
    -- width = 20,
  -- },
  -- border = {
    -- style = "single",
    -- text = {
      -- top = "Cmd",
      -- top_align = "left",
    -- },
  -- },
  -- win_options = {
    -- winhighlight = "Normal:Normal,FloatBorder:Normal",
  -- },
-- }, {
  -- prompt = "",
  -- default_value = "",
  -- on_close = function()
    -- -- print("Input Closed!")
  -- end,
  -- on_submit = function(value)
    -- print("Input Submitted: " .. value)

    -- local ok, err = pcall(vim.cmd, value)
    -- if not ok then
      -- local idx = err:find(':E')
      -- if type(idx) ~= 'number' then
        -- return
      -- end
      -- local msg = err:sub(idx + 1):gsub('\t', '    ')
      -- vim.notify(msg, vim.log.levels.ERROR)
    -- end
  -- end,
-- })
-- -- mount/open the component
-- vim.keymap.set('n', ':', function () input:mount() end, {noremap = true})

-- -- unmount component when cursor leaves buffer
-- input:on(event.BufLeave, function()
  -- local bufnr = vim.api.nvim_get_current_buf()
  -- print("Left Buffer" .. bufnr)
  -- -- pcall(vim.api.nvim_buf_delete, bufnr, {force = true})
  -- input:unmount()
-- end)

-- input:map("n", "<esc>", "dd<cr>", { noremap = true })
-- input:map("n", "<esc>", "<cr>", { noremap = true })

local cmp = require("cmp")
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-Space>'] = cmp.mapping.abort(),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  completion = {
    keyword_length = 1,
  },
  sources = cmp.config.sources({
    -- { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
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
require("no-neck-pain").setup({
  width = 120,
  buffers = {
    right = {
      -- When `false`, the buffer won't be created.
      --- @type boolean
      enabled = false,
    }
  }
})

-- local function my_on_attach(bufnr)
-- 	local api = require "nvim-tree.api"
-- 
-- 	local function opts(desc)
-- 		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- 	end
-- 
-- 	-- default mappings
-- 	api.config.mappings.default_on_attach(bufnr)
-- 
-- 	-- custom mappings
-- 	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
-- 	vim.keymap.set("n", "i", api.tree.change_root_to_node, opts("In"))
-- end

-- require('grug-far').setup({
  -- startInInsertMode = false,
-- })

-- require("nvim-tree").setup({
-- 	sort = {
-- 		sorter = "case_sensitive",
-- 	},
-- 	view = {
-- 		side = "right",
-- 		width = 60,
-- 	},
-- 	renderer = {
-- 		group_empty = true,
-- 	},
-- 	filters = {
-- 		dotfiles = false,
-- 		git_ignored = false,
-- 	},
--   actions = {
--     open_file = {
--       quit_on_open = true,
--       window_picker = {
--         chars = 'DFJKASLGH',
--       },
--     },
--   },
-- 	on_attach = my_on_attach,
-- })

require('nvim-treesitter.configs').setup{
	highlight = {
		enable = true,
    disable = {
      -- "vimdoc",
      -- "txt",
    },
		-- disable = function(lang, buf)
			-- local fName = vim.api.nvim_buf_get_name(buf)
			-- return fName == ".vimrc"
		-- end,
	},
	ensure_installed = {
		"c", "lua", "go", "tsx",
	},
	-- 'nvim-treesitter/nvim-treesitter-textobjects'
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "t", -- set to `false` to disable one of the mappings
      scope_incremental = false,
			node_incremental = "t",
			node_decremental = "T",
			-- scope_incremental = "<a-h>",
			-- init_selection = "<leader>gi",
			-- node_incremental = "<leader>ga",
			-- node_decremental = "<leader>gd",
		},
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = false,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
				["ir"] = "@assignment.rhs",
				["il"] = "@assignment.lhs",
				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@function.outer'] = 'V', -- linewise
        ['@function.inner'] = 'V', -- linewise
        ['@parameter.outer'] = 'v', -- charwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      -- include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        -- ["]]"] = "@parameter.inner",
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

-- function ToggleSpectre()
	-- local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
	-- if vim.v.shell_error ~= 0 then
		-- root = "%"
	-- end

	-- local state = require('spectre.state')
	-- if state.is_open then
		-- require('spectre').toggle()
	-- else
		-- require('spectre').open({ cwd=root })
	-- end
-- end

-- vim.keymap.set('n', '<leader>ss', ToggleSpectre, { desc = "Toggle Spectre" })


-- local tele = require('telescope.builtin')

-- local function rg_under_git_root()
	-- local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
	-- if vim.v.shell_error ~= 0 then
		-- root = "%"
	-- end
  -- tele.live_grep({cwd = root, hidden = true})
-- end

-- local function find_file_under_git()
	-- local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
	-- if vim.v.shell_error ~= 0 then
		-- root = "%"
	-- end
  -- tele.find_files({cwd = root, hidden = true})
-- end

-- vim.keymap.set('n', '<c-f>', function() find_file_under_git() end, {})
-- vim.keymap.set('n', '<leader>ss', function() rg_under_git_root() end, {})
-- vim.keymap.set('n', '<leader>b', tele.buffers, {})

-- require('telescope').setup {
  -- defaults = {
    -- mappings = {
      -- i = {
        -- ["<c-f>"] = require("telescope.actions").select_default,
        -- ["<c-t>"] = require("telescope.actions").select_default,
      -- },
      -- n = {
        -- ["<c-space>"] = require("telescope.actions").close,
      -- },
    -- }
  -- }
-- }
-- pcall(require('telescope').load_extension, 'fzf')

local leap = require('leap')
leap.opts.safe_labels = 'sfwetgbjuqz,.?\'\"SFWETLHUBMQZJ'
leap.opts.labels = 'sfwetgbjuqz,.?\'\"SFWETLHUBMQZJ'
leap.opts.special_keys =    {
  next_target = '<space>',
  prev_target = { '<backspace>' },
  next_group = '<enter>',
  prev_group = { '<backspace>' },
}
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function ()
    if vim.g.colors_name == "eldritch" then
      -- Force using the defaults of Leap:
      require('leap').init_highlight(true)
      -- And/or make your own tweaks:
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'ModeMsg' })
      vim.api.nvim_set_hl(0, 'LeapLabel', {
        bold = true,
        underline = false,
        fg = '#ebfafa',
        bg = '#bf4f8e',
      })
    end

    if vim.g.colors_name == "everforest" then
      -- Force using the defaults of Leap:
      require('leap').init_highlight(true)
      -- And/or make your own tweaks:
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'ModeMsg' })
      vim.api.nvim_set_hl(0, 'LeapLabel', {
        bold = true,
        underline = false,
        fg = '#ff0000',
        bg = '#ffffff',
      })
    end

    if vim.g.colors_name == "kanagawa" then
      -- Force using the defaults of Leap:
      require('leap').init_highlight(true)
      -- And/or make your own tweaks:
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'CurSearch' })
      vim.api.nvim_set_hl(0, 'LeapLabel', {
        bold = true,
        underline = false,
        -- fg = '#2D4F67',
        -- bg = '#D2CDB1',
        fg = '#ff0000',
        bg = '#dddddd',
      })
    end
  end
})

-- require('leap').opts.safe_labels = 'sfnut,?\'SFNLHMUGTZ'

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

-- require("mytabline")
require("mystatusline")
