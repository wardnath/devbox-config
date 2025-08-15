local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
-- optionally also fix the initial size in cells:
-- config.initial_cols = 120
-- config.initial_rows = 34

return config
