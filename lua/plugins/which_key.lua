return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 300,
    preset = "modern",
    win = { border = "rounded", padding = { 1, 2 }, title = " ⌨️ Keymaps ", title_pos = "center" },

    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find/File" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>e", desc = "NeoTree Toggle" },

      -- ★ ここに Surround 専用メニューを新設！
      { "<leader>s", group = "✨ Surround" },
      { "<leader>sa", desc = 'Add Surround (例: <leader>saiw")' },
      { "<leader>sc", desc = "Change Surround (例: <leader>sc\"')" },
      { "<leader>sd", desc = 'Delete Surround (例: <leader>sd")' },
    },
  },
  keys = {
    {
      "<leader>",
      function()
        require("which-key").show({
          keys = "<leader>",
          filter = function(mapping)
            return mapping.desc ~= nil
          end,
        })
      end,
      desc = "My Leader Menu",
    },
    {
      "<leader><leader>",
      function()
        require("which-key").show({ keys = "<leader>" })
      end,
      desc = "Show All Keymaps",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE" })
    vim.opt.timeoutlen = 1500
  end,
}
