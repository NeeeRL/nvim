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
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
        follow_current_file = {
        enabled = true,
      },
      default_component_configs = {
        container = {
          enable_character_fade = true
        }
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
}

