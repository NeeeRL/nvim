return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- 🍓 これが「途切れない一本の線」を引くための設定
    indent = {
      char = "│", -- 途切れない垂直線
      tab_char = "│",
    },
    -- 🍫 重要：ここを false にしないと、行番号を破壊したり画面がガクつきます
    scope = { enabled = false },

    -- 空行にもしっかり線を引く
    whitespace = {
      remove_blankline_trail = false,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    -- 🎀 ここが「行番号消滅」を防ぐ究極の対策
    -- 行番号のハイライト（LineNr）を IBL より高いレイヤーに固定する
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b374b", nocombine = true })
  end,
}

