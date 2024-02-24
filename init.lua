require("settings.highlights")
require("settings.base")
require("settings.maps")
require("settings.plugins")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("settings.macos")
end
if is_win then
	require("settings.windows")
end
