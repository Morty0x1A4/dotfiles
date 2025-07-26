-- Pull in the wezterm API
local wezterm = require("wezterm")
-- Make act alias for wezterm.action
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()
-- Plugins
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

-- Apply configuration
config.use_fancy_tab_bar = false
--config.enable_tab_bar = false
config.font_size = 10
config.color_scheme = "Everforest Dark (Gogh)"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 2,
	bottom = 0,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- splitting
	{
		key = "m",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "l",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "c",
		mods = "ALT",
		action = act.SplitHorizontal({
			args = { "ssh", "server" },
		}),
	},
}
config.colors = {
	background = "#2B3339",
}
config.inactive_pane_hsb = {
	brightness = 0.75,
}
bar.apply_to_config(config)
return config
