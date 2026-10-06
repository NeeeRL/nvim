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
    config = function(_, opts)
      require("mason").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mason",
        callback = function()
          -- Redditで言われていた「NormalFloatのクリア」と、念のためのMason専用背景のクリア
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "MasonNormal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "MasonNormalNC", { bg = "NONE" })
        end,
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    config = function()
      -- TypeScript
      vim.lsp.config("vtsls", {
        settings = {
          typescript = {
            tsserver = {
              watchOptions = {
                watchFile = "fixedPollingInterval",
                watchDirectory = "fixedPollingInterval",
              },
            },
          },
        },
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Ruby / Rails
      vim.lsp.config("ruby_lsp", {
        init_options = {
          formatter = "auto",

          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls",
          "ruby_lsp",
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

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- カーソル下の情報を表示
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- 定義元へジャンプ
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- 参照先を一覧表示
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 変数名などをリネーム
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- コードアクション
        end,
      })
    end,
  },
}
