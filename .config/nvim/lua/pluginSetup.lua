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
		width = 40,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = my_on_attach,
})

local bufferline = require("bufferline")
bufferline.setup{
	highlights = {
		fill = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			-- fg = '#333333',
			bg = '#333333',
		},
		background = {
			-- fg = '#FFFFFF',
			bg = '#444444',
		},
		tab = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		tab_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		tab_separator = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		tab_separator_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			-- underline = '#FFFFFF',
		},
		tab_close = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		close_button = {
			-- yellow
			fg = '#FFFF00',
			bg = '#FFFF00',
		},
		close_button_visible = {
			-- red
			fg = '#FF0000',
			bg = '#FF0000',
		},
		close_button_selected = {
			-- blue
			fg = '#0000FF',
			bg = '#0000FF',
		},
		buffer_visible = {
			fg = '#afd878',
			bg = '#444444',
			bold = false,
			italic = false,
		},
		buffer_selected = {
			fg = '#303030',
			bg = '#afd878',
			bold = false,
			italic = false,
		},
		numbers = {
			fg = '#444444',
			bg = '#444444',
		},
		numbers_visible = {
			fg = '#afd878',
			bg = '#444444',
		},
		numbers_selected = {
			fg = '#303030',
			bg = '#afd878',
			bold = false,
			italic = false,
		},
		diagnostic = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		diagnostic_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		diagnostic_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			bold = true,
			italic = true,
		},
		hint = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		hint_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		hint_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		hint_diagnostic = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		hint_diagnostic_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		hint_diagnostic_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		info = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		info_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		info_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		info_diagnostic = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		info_diagnostic_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		info_diagnostic_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		warning = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		warning_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		warning_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		warning_diagnostic = {
			fg = '#FFFFFF',
			sp = '#FFFFFF',
			bg = '#FFFFFF',
		},
		warning_diagnostic_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		warning_diagnostic_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		error = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
		},
		error_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		error_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		error_diagnostic = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
		},
		error_diagnostic_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		error_diagnostic_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			sp = '#FFFFFF',
			bold = true,
			italic = true,
		},
		modified = {
			fg = '#8eb7e1',
			bg = '#444444',
		},
		modified_visible = {
			fg = '#8eb7e1',
			bg = '#444444',
		},
		modified_selected = {
			-- fg = '#FFFFFF',
			-- bg = '#FFFFFF',
			fg = '#8eb7e1',
			bg = '#afd878',
		},
		duplicate_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			italic = true,
		},
		duplicate_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			italic = true,
		},
		duplicate = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			italic = true,
		},
		separator_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		separator_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		separator = {
			-- turquoise
			fg = '#000000',
			bg = '#444444',
		},
		indicator_visible = {
			fg = '#444444',
			bg = '#444444',
		},
		indicator_selected = {
			fg = '#afd878',
			bg = '#afd878',
		},
		pick_selected = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			bold = true,
			italic = true,
		},
		pick_visible = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			bold = true,
			italic = true,
		},
		pick = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
			bold = true,
			italic = true,
		},
		offset_separator = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
		trunc_marker = {
			fg = '#FFFFFF',
			bg = '#FFFFFF',
		},
	},
	options = {
		themable = false,
		numbers = function(opts)
			return string.format('%s', opts.id)
		end,
		indicator = {
			style = 'none',
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		show_buffer_icons = false,
		tab_size = 3,
		-- max_name_length = 5,
		-- left_trunc_marker = '',
		-- right_trunc_marker = '',
		separator_style = {
			"¦", -- focused
			"¦", -- unfocused
		},
		style_preset = bufferline.style_preset.minimal,
	},
}

require('nvim-treesitter.configs').setup{
	highlight = {
		enable = true,
		-- disable = function(lang, buf)
			-- local fName = vim.api.nvim_buf_get_name(buf)
			-- return fName == ".vimrc"
		-- end,
	},
}

-- doesn't work :'(
-- require("mytabline")
require("mystatusline")
--
