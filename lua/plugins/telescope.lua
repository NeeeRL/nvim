return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- ★ここを追加！
  -- "Telescope" というコマンドが叩かれたら、プラグインを起動する設定です
  cmd = "Telescope",

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
  },

  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        file_ignore_patterns = {
          "node_modules/.*",
          "%.git/.*",
          "%.next/.*", -- Next.js（Cloudflare環境なら念のため）
          "dist/.*", -- ビルド成果物
          "%.wrangler/.*", -- Cloudflare Wranglerのキャッシュや一時ファイル
        },
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        preview = {
          treesitter = true,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
}
