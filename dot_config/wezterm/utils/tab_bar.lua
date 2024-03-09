local wezterm = require("wezterm")

function tab_title(tab)
	local pane_title = tab.active_pane.title
	local title = tab.active_pane.user_vars.panetitle

	if title ~= nil and #title > 0 then
		pane_title = title
	end

	return tab.tab_index + 1 .. ": " .. pane_title .. " "
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)

	return {
		{ Text = title },
	}
end)

return {
	tab_bar_at_bottom = false,
	tab_max_width = 32,
}
