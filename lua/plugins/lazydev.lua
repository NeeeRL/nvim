return {
  "folke/lazydev.nvim",
  ft = "lua", -- Luaファイルを開いたときだけ読み込む
  opts = {
    library = {
      -- "lazy.nvim" 自体の型定義も認識させる
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}

