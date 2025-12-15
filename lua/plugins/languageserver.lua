return {
  -- 1. Mason (LSPサーバーのインストーラー)
  {
    "mason-org/mason.nvim", -- 【修正】最新の公式リポジトリ
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- 2. Mason-LSPConfig (MasonとLSPConfigをつなぐもの)
  {
    "mason-org/mason-lspconfig.nvim", -- 【修正】最新の公式リポジトリ
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- mason-lspconfig のセットアップ
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }, -- 自動インストールするサーバー

        -- handlers を使うことで、サーバーごとの設定を柔軟に適用できます
        handlers = {
          -- 1. デフォルトのハンドラー（特別な設定がいらないサーバー用）
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- 2. Lua (lua_ls) 専用のハンドラー
          -- 個別の設定 (globals = {"vim"}) はここに書きます
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- 3. nvim-lspconfig (本体)
  -- 設定は mason-lspconfig の handlers 側で行うため、ここは空定義でOKです
  {
    "neovim/nvim-lspconfig",
  },
}
