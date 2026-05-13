return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      -- カーソルを乗せてからハイライトされるまでの時間（ミリ秒）
      -- 100〜200くらいにするとチカチカしなくてちょうどいいです
      delay = 120,

      -- ハイライトしたくないファイルタイプがあれば指定
      filetypes_denylist = {
        "neo-tree",
        "TelescopePrompt",
      },
    })

    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#313244" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#313244" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#313244" })
  end,
}
