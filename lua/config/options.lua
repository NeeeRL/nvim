-- タブをスペースに変換する（推奨）
vim.opt.expandtab = true

-- インデントの幅（<< や >> で動く幅）
vim.opt.shiftwidth = 2

-- Tabキーを押したときに入力される幅
vim.opt.tabstop = 2

-- バックスペース入力時に、まるでタブを消すかのように挙動させる幅
vim.opt.softtabstop = 2

-- エラーの行末表示（赤文字）を完全にオフ<-別のプラグインとの競合を防ぐ
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.opt.signcolumn = "yes:2" -- サインカラム（アイコンが出る場所）を常にx列分確保
vim.opt.numberwidth = 2

vim.api.nvim_set_hl(0, "LineNr", { fg = "#6e6a86", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebbae2", bold = true })
