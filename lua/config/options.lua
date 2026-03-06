-- タブをスペースに変換する（推奨）
vim.opt.expandtab = true

-- インデントの幅（<< や >> で動く幅）
vim.opt.shiftwidth = 2

-- Tabキーを押したときに入力される幅
vim.opt.tabstop = 2

-- バックスペース入力時に、まるでタブを消すかのように挙動させる幅
vim.opt.softtabstop = 2
--
-- エラーメッセージを行の右側に表示する（標準の挙動）
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = true,
  },
  float = {
    source = true,
  },
  signs = true, -- 左端（行番号の横）のアイコンを表示
  underline = true, -- エラー箇所の下線を表示
  update_in_insert = false, -- 入力中は表示を更新しない（チラつき防止）
  severity_sort = true, -- 重大なエラーを優先表示
})
