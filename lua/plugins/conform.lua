return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- 言語ごとのフォーマッターを指定
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      cpp = { "clang-format" },
      c = { "clang-format" },
    },
    -- 保存時に自動フォーマットを実行する設定
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- フォーマッターが無い場合はLSPの機能で代用
    },
  },
  -- 手動でフォーマットしたい時用のキーバインド
  keys = {
    {
      "<leader>c",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
}
