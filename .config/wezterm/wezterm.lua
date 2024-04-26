local wezterm = require("wezterm")

local config = {}

-- use config build if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- window
config.window_background_opacity = 0.5
config.macos_window_background_blur = 40
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	border_left_width = 0,
	border_right_width = 0,
	border_bottom_height = 0,
	border_top_height = 0,
}

-- font
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", scale = 1.3 },
	{ family = "MonaspiceNe Nerd Font", scale = 1.3 },
	{ family = "CaskaydiaCove Nerd Font", scale = 1.3 },
})
config.font_size = 15.0

-- misc
config.color_scheme = "Solarized Dark - Patched"
config.front_end = "WebGpu"
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.scrollback_lines = 3000
config.use_fancy_tab_bar = false

for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Vulkan" then
		config.webgpu_preferred_adapter = gpu
		break
	end
end

return config
