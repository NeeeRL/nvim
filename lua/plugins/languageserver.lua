return {
  {
    "mason-org/mason.nvim",
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

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },

        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

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

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- clangdの設定。勝手にincludeしないようにする。なお、brewのclangdを使用している点について注意
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--header-insertion=never",
        },
      })
      vim.lsp.enable("clangd")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)           -- カーソル下の情報を表示
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)     -- 定義元へジャンプ
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)     -- 参照先を一覧表示
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 変数名などをリネーム
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- コードアクション
        end,
      })
    end,
  },
}
