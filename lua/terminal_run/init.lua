json = require "terminal_run.json"

local M = {}
local commands = {}
local fileName = "testPluginCommandStorage.json"
local path = vim.fn.stdpath('cache').."/"..fileName


-- Creating Commands for the Plugin
vim.api.nvim_create_user_command('Run', function()
	M.runTerminal()
end, {})

vim.api.nvim_create_user_command('SetRunCommand', function(opts)
	M.setRunCommand(opts.args)
end, { nargs = 1 })



-- File handling JSON
M.createCacheFileIfNotExists = function()
	local file = io.open(path, "a")
	io.close(file)
end

M.updateFile = function()
	local file = io.open(path, "w")
	if file then
		file:write(json.encode(commands))
		file:close()
	end
end

M.getCommands = function()
	local file = io.open(path, "r")
	if file then
		local contents = file:read("*all")
		if contents ~= "" then
			commands = json.decode(contents)
		end
		file:close()
	end
end


-- Command Methods
M.setRunCommand = function(command)
	local cwd = vim.fn.getcwd()
	M.createCacheFileIfNotExists()
	M.getCommands()
	commands[cwd] = command
	M.updateFile()
	M.getCommands()
	print("Run set to: "..command)
end

M.runTerminal = function()
	M.getCommands()
	local command = commands[vim.fn.getcwd()]
	vim.cmd("term "..command)
end

return M
