json = require("terminal_run.json")

local M = {}

local fileName = "terminal_run_command_storage.json"
local path = vim.fn.stdpath('cache').."/"..fileName

-- File handling JSON
M.create = function()
	local file = io.open(path, "a")
	io.close(file)
end

M.writeTable = function(table)
	local file = io.open(path, "w")
	if file then
		file:write(json.encode(table))
		file:close()
		return true
	end
	return false
end

M.readTable = function()
	local file = io.open(path, "r")
	if file then
		local contents = file:read("*all")
		if contents ~= "" then
			return json.decode(contents)
		end
		file:close()
	end
	return {}
end

return M
