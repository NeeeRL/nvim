return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<cr>",
        desc = "NeoTreeの表示切替",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      window = {
        position = "left",
        mappings = {
          -- 2. Spaceのディレクトリ開閉を無効化 (これでWhich-Keyが優先される)
          ["<space>"] = "none",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        follow_current_file = {
          enabled = true,
        },
      },
      -- ここから下はあなたの既存設定を統合
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.cursorline = true
          end,
        },
      },
    },
  },
}
