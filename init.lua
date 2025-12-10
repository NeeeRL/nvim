-- bootstrap lazy.nvim, LazyVim and your plugins
vim.env.XDG_STATE_HOME = "/tmp"
vim.opt.undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
