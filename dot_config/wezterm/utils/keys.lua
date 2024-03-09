local wezterm = require("wezterm")
local act = wezterm.action

return {
	leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "|",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
		{ key = "p", mods = "LEADER", action = act.ActivateCommandPalette },
		-- Tab
		{
			key = "[",
			mods = "CMD",
			action = act.MoveTabRelative(-1),
		},
		{
			key = "]",
			mods = "CMD",
			action = act.MoveTabRelative(1),
		},
	},
}
