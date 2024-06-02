local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

--- Colors ---
local colors = require("utils/colors")
config.color_scheme = colors.color_scheme
config.window_background_gradient = colors.window_background_gradient
config.window_padding = colors.window_padding
config.colors = colors.colors

--- Fonts ---
config.font_size = 11.0

--- Keys ---
local keys = require("utils/keys")
config.leader = keys.leader
config.keys = keys.keys

-- Tab Bar ---
local tab_bar = require("utils/tab_bar")
config.tab_max_width = tab_bar.tab_max_width
config.tab_bar_at_bottom = tab_bar.tab_bar_at_bottom
config.hide_tab_bar_if_only_one_tab = true

--- Other ---
config.window_close_confirmation = "NeverPrompt"
config.native_macos_fullscreen_mode = true

return config
