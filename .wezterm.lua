-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tokyo Night"

-- Coolnight Colorscheme
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#010C18",
-- 	cursor_bg = "#3AFF9C",
-- 	cursor_border = "#3AFF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#1477F8", "#a277ff", "#3AFF9C", "#3AFF9C" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#3AFF9C", "#3AFF9C" },
-- }

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
