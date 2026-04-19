vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.env.XDG_STATE_HOME = "/tmp"
vim.opt.undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"
-- マークダウンの記号を隠して綺麗にレンダリングする設定
vim.opt.conceallevel = 2

require("config.lazy")
require("config.options")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
