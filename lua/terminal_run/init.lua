fileio = require("terminal_run.io")
local M = {}
local commands = {}


-- Creating Commands for the Plugin
vim.api.nvim_create_user_command('Run', function()
	M.runTerminal()
end, {})

vim.api.nvim_create_user_command('SetRunCommand', function(opts)
	M.setRunCommand(opts.args)
end, { nargs = 1 })

-- Command Methods
M.setRunCommand = function(command)
	local cwd = vim.fn.getcwd()
	fileio.create()
	commands = fileio.readTable()
	commands[cwd] = command
	fileio.writeTable(commands)
	commands = fileio.readTable()
	if commands[cwd] == command then
		print("Run set to: "..command)
	else
		print("Something went wrong, please try again!")
	end
end

M.runTerminal = function()
	commands = fileio.readTable()
	local command = commands[vim.fn.getcwd()]

	if command ~= nil then
		vim.cmd("term "..command)
	else
		print("Execute SetRunCommand <command> to set a command")
	end
end

return M
