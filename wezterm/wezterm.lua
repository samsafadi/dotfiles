local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Brogrammer (Gogh)'
config.font = wezterm.font('CommitMono')
config.font_size = 14
config.line_height = 1.2
config.front_end = 'WebGpu'

config.window_background_opacity = 1
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.freetype_load_flags = 'NO_HINTING'
config.enable_scroll_bar = false

return config
