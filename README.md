# Terminal_Run.nvim
A plugin for running projects quickly through neovim itself rather than programs such as tmux.
## Contents
- 3rd party modules
  - [JSON](https://github.com/rxi/json.lua/blob/master/json.lua)
- [Installation](Installation)
  - [Packer](Packer)
  - [Plug](Plug)
- [Commands](Commands)
  - [SetRunCommand](SetRunCommand)
  - [Run](Run)

## Installation
### Packer
Enter `use('isaac238/terminal_run.nvim')` into your packer file.
Add `require('terminal_run')` to any file that runs on startup e.g. after/plugins/terminal_run.lua

### Plug
Enter `Plug 'isaac238/terminal_run.nvim'` into your plug file
Add `require('terminal_run')` to any file that runs on startup e.g. after/plugins/terminal_run.lua

## Commands
### SetRunCommand
`:SetRunCommand <command>` takes the inputted command e.g. 
* `:SetRunCommand python3 -m http.server 8000`

and assigns it to that project (based on cwd). Multiple commands can be set using && e.g. to activate a python venv beforehand 
* `:SetRunCommand source venv/bin/activate && python3 main.py`.

### Run
`:Run` uses the command set previously to open a terminal buffer in neovim and run the prior command.
