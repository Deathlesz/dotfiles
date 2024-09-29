local beautiful = require("beautiful")
local gears = require("gears")

local themes = {
	"gruvbox-material",
}

local theme = themes[1]

-- TODO: some better way to do this
if not beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), theme)) then
	beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
end
