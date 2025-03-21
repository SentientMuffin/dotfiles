-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- constant values
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- not sure why this does not work... terminal is still monocolor
config.term = 'xterm-256color'
-- This is where you actually apply your config choices
-- For example, changing the color scheme:
-- config.color_scheme_dirs = { '/Users/xinjun.lin/.config/wezterm/colors' }
-- config.color_scheme = 'Everforest Dark (Gogh)'
config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Earthsong'
-- config.color_scheme = 'Eldritch'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'


-- config.colors = {
  -- -- The default text color
  -- foreground = '#ebfafa',
  -- -- The default background color
  -- -- background = 'black',
  -- background = '#212337',

  -- -- Overrides the cell background color when the current cell is occupied by the
  -- -- cursor and the cursor style is set to Block
  -- cursor_bg = '#52ad70',
  -- -- Overrides the text color when the current cell is occupied by the cursor
  -- cursor_fg = '#212337',
  -- -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- -- Bar or Underline.
  -- cursor_border = '#04d1f9',

  -- -- the foreground color of selected text
  -- selection_fg = 'rgba(0% 0% 0% 0%)',
  -- -- the background color of selected text
  -- selection_bg = 'rgba(26.666668% 27.843138% 35.294117% 50%)',

  -- -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  -- scrollbar_thumb = '#37f499',

  -- -- The color of the split lines between panes
  -- split = '#a48cf2',

  -- ansi = {
    -- "#000000",
    -- "#cc0000",
    -- "#4e9a06",
    -- "#c4a000",
    -- "#3465a4",
    -- "#75507b",
    -- "#06989a",
    -- "#d3d7cf",
  -- },
  -- brights = {
    -- "#555753",
    -- "#ef2929",
    -- "#8ae234",
    -- "#fce94f",
    -- "#729fcf",
    -- "#ad7fa8",
    -- "#34e2e2",
    -- "#eeeeec",
  -- },
-- }

config.font_dirs = { '/Users/xinjun.lin/Library/Fonts' }
config.font = wezterm.font('JetBrains Mono NL', {
  weight = 'DemiBold'
})

config.audible_bell = "Disabled"

config.cell_width = 1

config.bold_brightens_ansi_colors = 'BrightAndBold'
-- config.custom_block_glyphs = true
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 0.9,
}

config.line_height = 1.0
config.font_size = 12

config.force_reverse_video_cursor = true
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.show_tab_index_in_tab_bar = true
config.enable_tab_bar = false

config.initial_cols = 120
config.initial_rows = 50

-- config.use_fancy_tab_bar = false
-- config.show_tabs_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#333333'
    local background = '#444444'
    local foreground = '#808080'

    if tab.is_active then
      background = '#afd787'
      foreground = '#000000'
    end

    local edge_foreground = background

    local title = string.format('%d: %s', tab.tab_index + 1, tab_title(tab))

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('{C: %d/ T: %d} ', tab.tab_index + 1, #tabs)
  end

  local currentPane = string.format('[%s] ', tab.active_pane.title)
  local date_and_time = wezterm.strftime '%A %b %d, %Y %H:%M'

  return zoomed .. index .. currentPane .. date_and_time
end)

local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('update-right-status', function(window, pane)
  local info = pane:get_foreground_process_info()
  if info then
    window:set_right_status(
      tostring(info.pid) .. ' ' .. basename(info.executable)
    )
  else
    window:set_right_status ''
  end
end)

-- and finally, return the configuration to wezterm
return config
