vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.env.XDG_STATE_HOME = "/tmp"
vim.opt.undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"

require("config.lazy")
require("config.options")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
