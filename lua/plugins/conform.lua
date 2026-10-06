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
      ruby = { "rubocop" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = "fallback",
    },
  },
  -- 手動でフォーマットしたい時用のキーバインド
  keys = {
    {
      "<leader>c",
      function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
}
