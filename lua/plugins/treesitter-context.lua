return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    enable = true,
    max_lines = 3, -- 画面上部に固定される行数の最大値（3行くらいが邪魔にならず最適）
    trim_scope = "outer",
    mode = "cursor", -- カーソル位置を基準にコンテキストを計算
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)

    vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#585b70" })
    -- 背景はエディタ本体に合わせる（透過ならそのまま透過される）
    vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#cba6f7" })
  end,
}
