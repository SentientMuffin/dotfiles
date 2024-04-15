require("ibl").setup({
	indent = {
		char = "╎",
		tab_char = "│",
	},
})

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "i", api.tree.change_root_to_node, opts("In"))
end

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		side = "right",
		width = 60,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
	},
	on_attach = my_on_attach,
})

local bufferline = require("bufferline")
-- bufferline.setup{
	-- highlights = {
		-- fill = {
			-- -- fg = '#FFFFFF',
			-- -- bg = '#FFFFFF',
			-- -- fg = '#333333',
			-- bg = '#333333',
		-- },
		-- background = {
			-- -- fg = '#FFFFFF',
			-- bg = '#444444',
		-- },
		-- tab = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- tab_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- tab_separator = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- tab_separator_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- -- underline = '#FFFFFF',
		-- },
		-- tab_close = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- close_button = {
			-- -- yellow
			-- fg = '#FFFF00',
			-- bg = '#FFFF00',
		-- },
		-- close_button_visible = {
			-- -- red
			-- fg = '#FF0000',
			-- bg = '#FF0000',
		-- },
		-- close_button_selected = {
			-- -- blue
			-- fg = '#0000FF',
			-- bg = '#0000FF',
		-- },
		-- buffer_visible = {
			-- fg = '#afd878',
			-- bg = '#444444',
			-- bold = false,
			-- italic = false,
		-- },
		-- buffer_selected = {
			-- fg = '#303030',
			-- bg = '#afd878',
			-- bold = false,
			-- italic = false,
		-- },
		-- numbers = {
			-- -- fg = '#444444',
			-- bg = '#444444',
		-- },
		-- numbers_visible = {
			-- fg = '#afd878',
			-- bg = '#444444',
		-- },
		-- numbers_selected = {
			-- fg = '#303030',
			-- bg = '#afd878',
			-- bold = false,
			-- italic = false,
		-- },
		-- diagnostic = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- diagnostic_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- diagnostic_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- hint = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- hint_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- hint_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- hint_diagnostic = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- hint_diagnostic_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- hint_diagnostic_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- info = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- info_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- info_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- info_diagnostic = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- info_diagnostic_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- info_diagnostic_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- warning = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- warning_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- warning_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- warning_diagnostic = {
			-- fg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- warning_diagnostic_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- warning_diagnostic_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- error = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
		-- },
		-- error_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- error_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- error_diagnostic = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
		-- },
		-- error_diagnostic_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- error_diagnostic_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- sp = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- modified = {
			-- fg = '#8eb7e1',
			-- bg = '#444444',
		-- },
		-- modified_visible = {
			-- fg = '#8eb7e1',
			-- bg = '#444444',
		-- },
		-- modified_selected = {
			-- -- fg = '#FFFFFF',
			-- -- bg = '#FFFFFF',
			-- fg = '#8eb7e1',
			-- bg = '#afd878',
		-- },
		-- duplicate_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- italic = true,
		-- },
		-- duplicate_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- italic = true,
		-- },
		-- duplicate = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- italic = true,
		-- },
		-- separator_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- separator_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- separator = {
			-- -- turquoise
			-- fg = '#000000',
			-- bg = '#444444',
		-- },
		-- indicator_visible = {
			-- fg = '#444444',
			-- bg = '#444444',
		-- },
		-- indicator_selected = {
			-- fg = '#afd878',
			-- bg = '#afd878',
		-- },
		-- pick_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- pick_visible = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- pick = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- bold = true,
			-- italic = true,
		-- },
		-- offset_separator = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
		-- },
		-- trunc_marker = {
			-- -- fg = '#FFFFFF',
			-- bg = '#333333',
		-- },
	-- },
	-- options = {
		-- themable = false,
		-- numbers = function(opts)
			-- return string.format('%s', opts.id)
		-- end,
		-- indicator = {
			-- style = 'none',
		-- },
		-- show_buffer_close_icons = false,
		-- show_close_icon = false,
		-- color_icons = true,
		-- show_buffer_icons = false,
		-- tab_size = 3,
		-- -- max_name_length = 5,
		-- -- left_trunc_marker = '',
		-- -- right_trunc_marker = '',
		-- separator_style = {
			-- "¦", -- focused
			-- "¦", -- unfocused
		-- },
		-- style_preset = bufferline.style_preset.minimal,
	-- },
-- }

require('nvim-treesitter.configs').setup{
	highlight = {
		enable = true,
    disable = {
      "vimdoc",
    },
		-- disable = function(lang, buf)
			-- local fName = vim.api.nvim_buf_get_name(buf)
			-- return fName == ".vimrc"
		-- end,
	},
	ensure_installed = {
		"c", "lua",
	},
	-- 'nvim-treesitter/nvim-treesitter-textobjects'
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>gi", -- set to `false` to disable one of the mappings
			node_incremental = "<c-3>",
			-- scope_incremental = "<a-h>",
			node_decremental = "<c-4>",
			-- init_selection = "<leader>gi",
			-- node_incremental = "<leader>ga",
			-- node_decremental = "<leader>gd",
		},
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
				["ir"] = "@assignment.rhs",
				["il"] = "@assignment.lhs",
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
  },
}

require('bqf').setup {
	func_map = {
		-- doesn't work, <c-f> is already mapped
		-- fzffilter = '<c-f>',
	},
}

function ToggleSpectre()
	local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
	if vim.v.shell_error ~= 0 then
		root = "%"
	end

	local state = require('spectre.state')
	if state.is_open then
		require('spectre').toggle()
	else
		require('spectre').open({ cwd=root })
	end
end

vim.keymap.set('n', '<leader>ss', ToggleSpectre, { desc = "Toggle Spectre" })

-- require('copilot').setup({
  -- panel = { enabled = false },
  -- suggestion = {
    -- enabled = true,
    -- auto_trigger = true,
    -- debounce = 75,
    -- keymap = {
      -- accept = "<c-i>",
      -- accept_word = "<a-w>",
      -- accept_line = "<a-l>",
      -- next = "<a-k>",
      -- prev = "<a-j>",
      -- dismiss = "<c-e>"
    -- },
  -- },
  -- copilot_node_command = 'node', -- Node.js version must be > 18.x
  -- server_opts_overrides = {},
-- })

-- doesn't work :'(
require("mytabline")
require("mystatusline")
--
